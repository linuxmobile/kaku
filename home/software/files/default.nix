{ pkgs, config, lib, ... }:
# manage files in ~
{
  imports = [ ./wlogout.nix ];

  xdg.configFile = {
    "btop/themes/rose-pine.theme".source = pkgs.fetchurl {
      url =
        "https://raw.githubusercontent.com/rose-pine/btop/main/rose-pine.theme";
      hash = "sha256-CIZ1OHsLNmXwQkrGslB0jezY8jh6Cs+CG8j0eoDP0sY=";
    };
  };

  # # Product Sans font
  # home.file."${config.xdg.dataHome}/fonts/Cartograph-CF-NF".source = lib.cleanSourceWith {
  #   filter = name: _: (lib.hasSuffix ".otf" (baseNameOf (toString name)));
  #   src = pkgs.fetchzip {
  #     url = "git@github.com:linuxmobile/cartograph/raw/main/Cartograph-CF-NF.zip";
  #     sha256 = "sha256-PF2n4d9+t1vscpCRWZ0CR3X0XBefzL9BAkLHoqWFZR4=";
  #     stripRoot = false;
  #   };
  # };
}
