{pkgs, ...}: {
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
      serif = ["Lexend"];
      sansSerif = ["Lexend"];
      monospace = ["Maple Mono SC NF"];
      # emoji = ["Noto Color Emoji"];
    };
  };
}
