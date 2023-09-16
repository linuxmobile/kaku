{default}: let
  OSLogo = builtins.fetchurl rec {
    name = "OSLogo-${sha256}.png";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
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
    background: rgba(0,0,0,.95);
    transition-property: background-color;
    transition-duration: .5s;
    color: ${default.xcolors.fg}
  }
  tooltip {
    background: ${default.xcolors.bg};
    border-radius: 5px;
    border-width: 2px;
    border-style: solid;
    border-color: ${default.xcolors.bg};
  }
  #workspaces {
    background: ${default.xcolors.bg};
    margin: 5px 5px;
    padding: 8px 5px;
    border-radius: 5px;
    border: solid 0px ${default.xcolors.fg};
    font-weight: normal;
    font-style: normal;
  }
  #workspaces button {
    padding: 0px 5px;
    margin: 0px 3px;
    border-radius: 5px;
    color: #2f354a;
    background-color: #2f354a;
    transition: all 0.3s ease-in-out;
  }
  #workspaces button.active {
    color: ${default.xcolors.fg};
    background-color: ${default.xcolors.fg};
    border-radius: 5px;
    min-width: 50px;
    background-size: 100% 100%;
    transition: all 0.3s ease-in-out;
  }
  #workspaces button:hover {
    background-color: ${default.xcolors.fg};
    color: ${default.xcolors.fg};
    border-radius: 5px;
    min-width: 50px;
    background-size: 100% 100%;
  }
   #custom-date {
  	color: #D3869B;
  }
  #tray {
      background: ${default.xcolors.bg};
      margin: 5px 5px 5px 5px;
      border-radius: 5px;
      padding: 0px 5px;
      /*border-right: solid 1px #282738;*/
  }
  #clock {
      color: ${default.xcolors.fg};
      background-color: ${default.xcolors.bg};
      border-radius: 5px;
      padding-left: 13px;
      padding-right: 15px;
      margin: 5px 5px;
      font-weight: bold;
  }
  #pulseaudio {
      color: ${default.xcolors.fg};
      border-radius: 5px;
      margin-left: 0px;
      font-weight: bold;
  }
  #pulseaudio.muted {
      color: #242f33;
      border-radius: 5px;
      margin-left: 0px;
      font-weight: bold;
  }
  #custom-launcher {
      background-color: ${default.xcolors.bg};
      background-image: url("${OSLogo}");
      border-radius: 5px;
      margin: 5px 5px;
      padding: 0 20px 0 13px;
      font-size: 20px;
  }
  #custom-launcher button:hover {
      background-color: #FB4934;
      color: transparent;
      border-radius: 5px;
      margin-right: -5px;
      margin-left: 10px;
  }
  #image {
  	background: ${default.xcolors.bg};
    padding: 0px 5px 0px 10px;
  	border-radius: 100px;
    margin: 5px 7px;
    font-weight: normal;
    font-style: normal;
    font-size: 16px;
  }
  #custom-playerctl {
  	background: ${default.xcolors.bg};
    padding: 0px 5px 0px 10px;
  	border-radius: 5px;
    margin: 5px 7px;
    font-weight: normal;
    font-style: normal;
    font-size: 16px;
  }
  #custom-playerlabel {
      background: transparent;
      padding-left: 10px;
      padding-right: 5px;
      border-radius: 5px;
      margin-top: 5px;
      margin-bottom: 5px;
      font-weight: normal;
      font-style: normal;
  }
  #window {
      background: ${default.xcolors.bg};
      padding-left: 15px;
      padding-right: 15px;
      border-radius: 16px;
      margin-top: 5px;
      margin-bottom: 5px;
      font-weight: normal;
      font-style: normal;
  }
  #cpu {
      background-color: ${default.xcolors.bg};
      /*color: #FABD2D;*/
      border-radius: 5px;
      margin: 5px;
      margin-left: 5px;
      margin-right: 5px;
      padding: 0px 10px 0px 10px;
      font-weight: bold;
  }
  #memory {
      background-color: ${default.xcolors.bg};
      /*color: #83A598;*/
      border-radius: 5px;
      margin: 5px;
      margin-left: 5px;
      margin-right: 5px;
      padding: 0px 10px 0px 10px;
      font-weight: bold;
  }
  #disk {
      background-color: ${default.xcolors.bg};
      /*color: #8EC07C;*/
      border-radius: 5px;
      margin: 5px;
      margin-left: 5px;
      margin-right: 5px;
      padding: 0px 10px 0px 10px;
      font-weight: bold;
  }
''
