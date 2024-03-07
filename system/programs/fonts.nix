{pkgs, inputs, ...}: {
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols
      # normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto

      maple-mono
      maple-mono-NF
      maple-mono-SC-NF

      inputs.aesthetic-iosevka.packages.${pkgs.system}.default

      lexend
      # nerdfonts
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    ];

    # causes more issues than it solves
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["AestheticIosevka Nerd Font"];
      sansSerif = ["AestheticIosevka Nerd Font"];
      monospace = ["AestheticIosevka Nerd Font Mono"];
      # emoji = ["Noto Color Emoji"];
    };
  };
}
