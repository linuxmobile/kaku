{
  inputs,
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols

      # normal fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      # nerdfonts
      nerd-fonts.symbols-only
      cozette

      inputs.self.packages.${pkgs.system}.apple-fonts
    ];

    # causes more issues than it solves
    enableDefaultPackages = false;

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
      defaultFonts = let
        addAll = builtins.mapAttrs (_: v: ["Symbols Nerd Font"] ++ v ++ ["Noto Color Emoji"]);
      in
        addAll {
          serif = ["New York Small"];
          sansSerif = ["SF Pro Display"];
          monospace = ["SF Mono"];
          emoji = ["Noto Color Emoji"];
        };
    };
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
  };
}
