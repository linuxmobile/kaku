{
  config,
  default,
  ...
}: {
  home.file.".config/eww/style/_colors.scss".text = ''
    $background : ${default.xcolors.background};
    $foreground : ${default.xcolors.foreground};
    $background-alt : ${default.xcolors.mbg};
    $background-light : ${default.xcolors.color0};
    $foreground-alt : ${default.xcolors.color7};
    $red : ${default.xcolors.color1};
    $red-light : ${default.xcolors.color9};

    $green : ${default.xcolors.color2};
    $green-light : ${default.xcolors.color10};


    $yellow : ${default.xcolors.color3};
    $yellow-light : ${default.xcolors.color11};

    $blue : ${default.xcolors.color4};
    $blue-light : ${default.xcolors.color12};

    $cyan : ${default.xcolors.color6};
    $cyan-light : ${default.xcolors.color14};

    $magenta : ${default.xcolors.color5};
    $magenta-light : ${default.xcolors.color13};

    $comment : ${default.xcolors.comment};
    $accent : ${default.xcolors.color12};

  '';
}
