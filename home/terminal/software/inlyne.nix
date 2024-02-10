{
  pkgs,
  config,
  ...
}: let
  c = config.programs.matugen.theme.colors.colors.${config.theme.name};

  mde = pkgs.writeShellScriptBin "mde" ''
    if [ ! -f "$1" ]; then
      touch "$1"
    fi

    hx "$1" & 
    inlyne "$1" &

    wait
  '';
in {
  home.packages = [pkgs.inlyne mde];
  home.file.".config/inlyne/inlyne.toml".text = ''
    theme = "Dark"

    [dark-theme]
    text-color = 0x${c.on_background}
    background-color = 0x14171b
    code-color = 0x${c.secondary}
    quote-block-color = 0x${c.secondary}
    link-color = 0x${c.inverse_primary}
    # select-color = 0x${c.primary}
    # code-highlighter = ""

    [font-options]
    regular-font = "Lexend"
    monospace-font = "Maple Mono SC NF"
  '';
}
