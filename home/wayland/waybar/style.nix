{ default }:
let
  OSLogo = builtins.fetchurl rec {
    name = "OSLogo-${sha256}.png";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
    url =
      "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
  };
in ''
* {
  border: none;
  border-radius: 0px;
  /* font-family: LigaSFMono Nerd Font, Iosevka, FontAwesome, Noto Sans CJK; */
  /* font-family: Iosevka, FontAwesome, Noto Sans CJK; */
  font-family: JetBrainsMono Nerd Font, FontAwesome, Noto Sans CJK;
  font-size: 12px;
  font-style: normal;
  min-height: 0;
}

window#waybar {
  background: rgba(16,22,24, 0.9);
  transition-property: background-color;
  transition-duration: .5s;
  color: ${default.xcolors.fg}
}

tooltip {
  background: ${default.xcolors.bg};
  border-radius: 10px;
  border-width: 2px;
  border-style: solid;
  border-color: ${default.xcolors.bg};
}

#workspaces {
  background: ${default.xcolors.bg};
  margin: 5px 5px;
  padding: 8px 5px;
  border-radius: 16px;
  border: solid 0px ${default.xcolors.fg};
  font-weight: normal;
  font-style: normal;
}

#workspaces button {
  padding: 0px 5px;
  margin: 0px 3px;
  border-radius: 16px;
  color: #2f354a;
  background-color: #2f354a;
  transition: all 0.3s ease-in-out;
}

#workspaces button.active {
  color: ${default.xcolors.fg};
  background-color: ${default.xcolors.fg};
  border-radius: 16px;
  min-width: 50px;
  background-size: 400% 400%;
  transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
  background-color: ${default.xcolors.fg};
  color: ${default.xcolors.fg};
  border-radius: 16px;
  min-width: 50px;
  background-size: 400% 400%;
}

#custom-date, #custom-playerctl, #clock, #battery, #pulseaudio, #network {
  background: ${default.xcolors.bg};
  color: ${default.xcolors.fg};
  padding: 0 6px;
  border-radius: 10px;
  margin: 6px 0px;
}

#pulseaudio, #tray, #clock, #custom-launcher {
  margin-right: 6px;
}

#cpu,
#disk,
#memory,
#pulseaudio,
#backlight,
#battery,
#network,
#clock {
    border-radius: 0px 10px 10px 0px;
}

#tray {
  color: ${default.xcolors.color4};
}

#tray>.passive {
  -gtk-icon-effect: dim;
}

#tray>.needs-attention {
  -gtk-icon-effect: highlight;
}

custom-launcher {
  font-size: 20px;
  margin: 0px 0px 2px 0px;
  border-radius: 0px 10px 0px 0px;
  padding: 10px 15px 10px 15px;
  color: ${default.xcolors.color12};
}

#pulseaudio {
  color: ${default.xcolors.fg};
}

#pulseaudio.muted {
  color: ${default.xcolors.color1};
}
''
