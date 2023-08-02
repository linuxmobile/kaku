{ colorscheme }:
with colorscheme.colors;
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
      font-family: LigaSFMono Nerd Font, Iosevka, FontAwesome, Noto Sans CJK;
      /* font-family: Iosevka, FontAwesome, Noto Sans CJK; */
      font-size: 12px;
      font-style: normal;
      min-height: 0;
  	}

  window#waybar {
      background: rgba(16, 18, 19, 0.8);
      border-bottom: 1px solid #0c0e0f;
      color: #cdd6f4
  }

  #workspaces {
  	background: #0c0e0f;
  	margin: 5px 5px;
    padding: 8px 5px;
  	border-radius: 16px;
    border: solid 0px #cdd6f4;
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
      color: #cdd6f4;
      background-color: #cdd6f4;
      border-radius: 16px;
      min-width: 50px;
      background-size: 400% 400%;
      transition: all 0.3s ease-in-out;
  }

  #workspaces button:hover {
  	background-color: #cdd6f4;
  	color: #cdd6f4;
  	border-radius: 16px;
    min-width: 50px;
    background-size: 400% 400%;
  }

  #custom-date, #clock, #battery, #pulseaudio, #network, #custom-randwall, #custom-launcher {
  	background: transparent;
  	padding: 5px 5px 5px 5px;
  	margin: 5px 5px 5px 5px;
    border-radius: 8px;
    border: solid 0px #f4d9e1;
  }

  #custom-date {
  	color: #D3869B;
  }

  #custom-power {
  	color: #24283b;
  	background-color: #db4b4b;
  	border-radius: 5px;
  	margin-right: 10px;
  	margin-top: 5px;
  	margin-bottom: 5px;
  	margin-left: 0px;
  	padding: 5px 10px;
  }

  #tray {
      background: #0c0e0f;
      margin: 5px 5px 5px 5px;
      border-radius: 16px;
      padding: 0px 5px;
      /*border-right: solid 1px #282738;*/
  }

  #clock {
      color: #cdd6f4;
      background-color: #0c0e0f;
      border-radius: 0px 0px 0px 24px;
      padding-left: 13px;
      padding-right: 15px;
      margin-right: 0px;
      margin-left: 10px;
      margin-top: 0px;
      margin-bottom: 0px;
      font-weight: bold;
      /*border-left: solid 1px #282738;*/
  }


  #battery {
      color: #9ece6a;
  }

  #battery.charging {
      color: #9ece6a;
  }

  #battery.warning:not(.charging) {
      background-color: #f7768e;
      color: #24283b;
      border-radius: 5px 5px 5px 5px;
  }

  #backlight {
      background-color: #24283b;
      color: #db4b4b;
      border-radius: 0px 0px 0px 0px;
      margin: 5px;
      margin-left: 0px;
      margin-right: 0px;
      padding: 0px 0px;
  }

  #network {
      color: #cdd6f4;
      border-radius: 8px;
      margin-right: 5px;
  }

  #pulseaudio {
      color: #cdd6f4;
      border-radius: 8px;
      margin-left: 0px;
      font-weight: bold;
  }

  #pulseaudio.muted {
      color: #242f33;
      border-radius: 8px;
      margin-left: 0px;
      font-weight: bold;
  }

  #custom-randwall {
      color: #cdd6f4;
      border-radius: 8px;
      margin-right: 0px;
  }

  #custom-launcher {
      color: #cdd6f4;
      background-color: #0c0e0f;
      border-radius: 0px 24px 0px 0px;
      margin: 0px 0px 0px 0px;
      padding: 0 20px 0 13px;
      /*border-right: solid 1px #282738;*/
      font-size: 20px;
  }

  #custom-launcher button:hover {
      background-color: #FB4934;
      color: transparent;
      border-radius: 8px;
      margin-right: -5px;
      margin-left: 10px;
  }

  #custom-playerctl {
  	background: #0c0e0f;
    padding: 0px 5px 0px 10px;
  	border-radius: 16px;
    /*border-left: solid 1px #282738;*/
    /*border-right: solid 1px #282738;*/
    margin: 5px 7px;
    font-weight: normal;
    font-style: normal;
    font-size: 16px;
  }

  #custom-playerlabel {
      background: transparent;
      padding-left: 10px;
      padding-right: 5px;
      border-radius: 16px;
      /*border-left: solid 1px #282738;*/
      /*border-right: solid 1px #282738;*/
      margin-top: 5px;
      margin-bottom: 5px;
      font-weight: normal;
      font-style: normal;
  }

  #window {
      background: #0c0e0f;
      padding-left: 15px;
      padding-right: 15px;
      border-radius: 16px;
      /*border-left: solid 1px #282738;*/
      /*border-right: solid 1px #282738;*/
      margin-top: 5px;
      margin-bottom: 5px;
      font-weight: normal;
      font-style: normal;
  }

  #custom-wf-recorder {
      padding: 0 20px;
      color: #e5809e;
      background-color: #1E1E2E;
  }

  #cpu {
      background-color: #0c0e0f;
      /*color: #FABD2D;*/
      border-radius: 16px;
      margin: 5px;
      margin-left: 5px;
      margin-right: 5px;
      padding: 0px 10px 0px 10px;
      font-weight: bold;
  }

  #memory {
      background-color: #0c0e0f;
      /*color: #83A598;*/
      border-radius: 16px;
      margin: 5px;
      margin-left: 5px;
      margin-right: 5px;
      padding: 0px 10px 0px 10px;
      font-weight: bold;
  }

  #disk {
      background-color: #0c0e0f;
      /*color: #8EC07C;*/
      border-radius: 16px;
      margin: 5px;
      margin-left: 5px;
      margin-right: 5px;
      padding: 0px 10px 0px 10px;
      font-weight: bold;
  }

  #custom-hyprpicker {
      background-color: #0c0e0f;
      /*color: #8EC07C;*/
      border-radius: 16px;
      margin: 5px;
      margin-left: 5px;
      margin-right: 5px;
      padding: 0px 11px 0px 9px;
      font-weight: bold;
  }

''
