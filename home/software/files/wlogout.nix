{ default, pkgs, ... }:
let w = pkgs.wlogout;
in {
  xdg.configFile."wlogout/style.css".text = ''
    * {
    	background-image: none;
      font-family: "Jost *", Roboto, sans-serif;
    }
    window {
    	background-color: rgba(12, 12, 12, 0.2);
    }
    button {
      background: unset;
      border-radius: 16px;
    	border: 1px solid ${default.xcolors.color4};
      color: ${default.xcolors.foreground};
      margin: 1rem;
    	background-repeat: no-repeat;
    	background-position: center;
    	background-size: 25%;
    }

    button:focus, button:active, button:hover {
      background-color: ${default.xcolors.color4};
      color: ${default.xcolors.background};
    	outline-style: none;
    }

    #lock {
        background-image: image(url("${w}/share/wlogout/icons/lock.png"), url("${w}/local/share/wlogout/icons/lock.png"));
        margin-bottom: 2px;
    }

    #logout {
        background-image: image(url("${w}/share/wlogout/icons/logout.png"), url("${w}/local/share/wlogout/icons/logout.png"));
        margin-bottom: 2px;
    }

    #suspend {
        background-image: image(url("${w}/share/wlogout/icons/suspend.png"), url("${w}/local/share/wlogout/icons/suspend.png"));
        margin-bottom: 2px;
    }

    #hibernate {
        background-image: image(url("${w}/share/wlogout/icons/hibernate.png"), url("${w}/local/share/wlogout/icons/hibernate.png"));
        margin-bottom: 2px;
    }

    #shutdown {
        background-image: image(url("${w}/share/wlogout/icons/shutdown.png"), url("${w}/local/share/wlogout/icons/shutdown.png"));
        margin-bottom: 2px;
    }

    #reboot {
        background-image: image(url("${w}/share/wlogout/icons/reboot.png"), url("${w}/local/share/wlogout/icons/reboot.png"));
        margin-bottom: 2px;
    }
  '';
}
