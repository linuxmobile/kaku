import json
import os
import subprocess
import sys

import tldextract

# The autofill functionality of this script was taken from
# https://github.com/qutebrowser/qutebrowser/blob/master/misc/userscripts/password_fill

# NOTE
# keyctl may have some bugs (see
# https://discourse.nixos.org/t/keyctl-read-alloc-permission-denied/8667).
# Running `keyctl link @u @s` may solve the problem
# (https://github.com/mattydebie/bitwarden-rofi/issues/34#issuecomment-641506873).

# FIXME
# 1. reddit password and usernames are fetched correctly but not inputted into
#    the respective fields
# 2. N26 password is fetched correctly but not inputted into the password field
# 3. wise.com password gets inputted into the password field, but wise
#    complains about password not being given. It needs to be changed (e.g. by
#    adding and deleting a character) before it becomes valid. Happens on a
#    bunch of other sites too.

QUTE_URL = os.getenv('QUTE_URL')
QUTE_FIFO = os.getenv('QUTE_FIFO')

QUTE_WRONG_MASTER_PASSWORD_MSG = 'Invalid master password'
QUTE_WRONG_SESSION_KEY_MSG = 'Invalid session key'
QUTE_NO_LOGIN_FOUND_MSG = 'No logins available for {}'
QUTE_NO_FORMS_FOUND_MSG = 'No login forms were found'

JS = """\
function isVisible(elem) {
    var style = elem.ownerDocument.defaultView.getComputedStyle(elem, null);
    if (style.getPropertyValue("visibility") !== "visible"
        || style.getPropertyValue("display") === "none"
        || style.getPropertyValue("opacity") === "0") {
        return false;
    }
    return elem.offsetWidth > 0 && elem.offsetHeight > 0;
};
function hasPasswordField(form) {
    var inputs = form.getElementsByTagName("input");
    for (var j = 0; j < inputs.length; j++) {
        var input = inputs[j];
        if (input.type == "password") {
            return true;
        }
    }
    return false;
};
function loadData2Form (form) {
    var inputs = form.getElementsByTagName("input");
    for (var j = 0; j < inputs.length; j++) {
        var input = inputs[j];
        if (isVisible(input)
            && (input.type == "text" || input.type == "email")) {
            input.focus();
            input.value = "%s";
            input.blur();
        }
        if (input.type == "password") {
            input.focus();
            input.value = "%s";
            input.blur();
        }
    }
};
var forms = document.getElementsByTagName("form");
for (i = 0; i < forms.length; i++) {
    if (hasPasswordField(forms[i])) {
        loadData2Form(forms[i]);
    }
}
"""


def qute_command(cmd: str):
    with open(QUTE_FIFO, 'w') as fifo:
        fifo.write(cmd + '\n')
        fifo.flush()


def qute_echo_error(msg: str):
    qute_command(f'message-error "{msg}"')


def get_bw_session_key() -> str:
    proc = subprocess.run(
        ['keyctl', 'request', 'user', 'bw_session'],
        capture_output=True,
        text=True,
    )
    if proc.returncode == 0:
        key_id = proc.stdout.rstrip()
        session_key = subprocess.run(
            ['keyctl', 'pipe', key_id],
            capture_output=True,
            text=True,
        ).stdout.rstrip()
    else:
        proc = subprocess.run(
            ['dmenu-xembed-qute', '-p', 'Master password>', '-P'],
            capture_output=True,
            text=True,
        )
        if proc.returncode != 0:
            sys.exit()

        bw_password = proc.stdout.rstrip()
        proc = subprocess.run(
            ['bw', 'unlock', '--raw', bw_password],
            capture_output=True,
            text=True,
        )
        if proc.returncode != 0:
            qute_echo_error(QUTE_WRONG_MASTER_PASSWORD_MSG)
            sys.exit()

        session_key = proc.stdout.rstrip()

        subprocess.run(
            ['keyctl', 'add', 'user', 'bw_session', session_key, '@u']
        )

    return session_key


def main():
    session_key = get_bw_session_key()
    url = tldextract.extract(QUTE_URL)

    proc = subprocess.run(
        ['bw', 'list', 'items', '--session', session_key, '--url', url.fqdn],
        capture_output=True,
        text=True,
    )
    if proc.returncode != 0:
        qute_echo_error(QUTE_WRONG_SESSION_KEY_MSG)
        sys.exit()

    items = json.loads(proc.stdout.rstrip())

    if len(items) == 0:
        qute_echo_error(QUTE_NO_LOGIN_FOUND_MSG.format(url.fqdn))
        sys.exit()

    elif len(items) == 1:
        login = items[0]['login']

    else:
        proc = subprocess.run(
            ['dmenu-xembed-qute', '-l', '5', '-p', 'Login> '],
            capture_output=True,
            text=True,
            input='\n'.join([item['name'] for item in items])
        )

        if proc.returncode != 0:
            sys.exit()

        name = proc.stdout.rstrip()

        for item in items:
            if item['name'] == name:
                login = item['login']
                break

    username = login['username']
    password = login['password']

    js = (JS % (username, password)).replace('\n', ' ')
    qute_command('jseval --quiet {}'.format(js))


if __name__ == '__main__':
    main()
