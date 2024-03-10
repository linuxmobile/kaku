{pkgs, ...}: let
  bg0_hard = "#1d2021";
  bg0_soft = "#32302f";
  bg0_normal = "#282828";

  bg0 = "#131313"; # bg0_normal
  bg1 = "#3c3836";
  bg2 = "#504945";
  bg3 = "#665c54";
  bg4 = "#7c6f64";

  fg0 = "#fbf1c7";
  fg1 = "#ebdbb2";
  fg2 = "#d5c4a1";
  fg3 = "#bdae93";
  fg4 = "#a89984";

  bright_red = "#EA6962";
  bright_green = "#A9B665";
  bright_yellow = "#D8A657";
  bright_blue = "#7DAEA3";
  bright_purple = "#D3869B";
  bright_aqua = "#89B482";
  bright_gray = "#D4BE98";
  bright_orange = "#fe8019";

  dark_red = "#EA6962";
  dark_green = "#A9B665";
  dark_yellow = "#D8A657";
  dark_blue = "#458588";
  dark_purple = "#D3869B";
  dark_aqua = "#89B482";
  dark_gray = "#D4BE98";
  dark_orange = "#d65d0e";
in {
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = true;
    settings = {
      auto_save.session = true;
      fonts = {
        default_family = "AestheticIosevka Nerd Font Mono";
        default_size = "12pt";
      };
      new_instance_open_target = "window";
      tabs.background = true;
      completion = {
        height = "30%";
        open_categories = ["history"];
        scrollbar = {
          padding = 0;
          width = 0;
        };
        show = "always";
        shrink = true;
        timestamp_format = "";
        web_history.max_items = 7;
      };
      content = {
        headers = {
          user_agent = "Mozilla/5.0 (X11; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0";
          accept_language = "en-US,en;q=0.5";
        };

        blocking = {
          enabled = true;
          method = "both";
          adblock.lists = [
            "https://easylist.to/easylist/easylist.txt"
            "https://easylist.to/easylist/easyprivacy.txt"
            "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"
            "https://easylist.to/easylist/fanboy-annoyance.txt"
            "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt"
          ];
        };
        canvas_reading = false;
        autoplay = false;
        javascript.clipboard = "access";
        pdfjs = true;
      };
      downloads = {
        position = "bottom";
        remove_finished = 0;
      };
      scrolling = {
        bar = "never";
        smooth = true;
      };
      colors = {
        completion.fg = [fg1 bright_aqua bright_yellow];
        completion.odd.bg = bg0;
        completion.even.bg = bg0;
        completion.category.fg = bright_blue;
        completion.category.bg = bg1;
        completion.category.border.top = bg1;
        completion.category.border.bottom = bg1;
        completion.item.selected.fg = fg0;
        completion.item.selected.bg = bg4;
        completion.item.selected.border.top = bg2;
        completion.item.selected.border.bottom = bg2;
        completion.item.selected.match.fg = bright_orange;
        completion.match.fg = bright_orange;
        completion.scrollbar.fg = fg0;
        completion.scrollbar.bg = bg1;

        contextmenu.disabled.bg = bg3;
        contextmenu.disabled.fg = fg3;
        contextmenu.menu.bg = bg0;
        contextmenu.menu.fg = fg2;
        contextmenu.selected.bg = bg2;
        contextmenu.selected.fg = fg2;

        downloads.bar.bg = bg0;
        downloads.start.fg = bg0;
        downloads.start.bg = bright_blue;
        downloads.stop.fg = bg0;
        downloads.stop.bg = bright_aqua;
        downloads.error.fg = bright_red;

        hints.fg = bg0;
        hints.match.fg = bg4;

        keyhint.fg = fg4;
        keyhint.suffix.fg = fg0;
        keyhint.bg = bg0;

        messages.error.fg = bg0;
        messages.error.bg = bright_red;
        messages.error.border = bright_red;
        messages.warning.fg = bg0;
        messages.warning.bg = bright_purple;
        messages.warning.border = bright_purple;
        messages.info.fg = fg2;
        messages.info.bg = bg0;
        messages.info.border = bg0;

        prompts.fg = fg2;
        prompts.border = "1px solid ${bg1}";
        prompts.bg = bg3;
        prompts.selected.bg = bg2;

        statusbar.normal.fg = fg2;
        statusbar.normal.bg = bg0;
        statusbar.insert.fg = bg0;
        statusbar.insert.bg = dark_aqua;
        statusbar.passthrough.fg = bg0;
        statusbar.passthrough.bg = dark_blue;
        statusbar.private.fg = bright_purple;
        statusbar.private.bg = bg0;
        statusbar.command.fg = fg3;
        statusbar.command.bg = bg1;
        statusbar.command.private.fg = bright_purple;
        statusbar.command.private.bg = bg1;
        statusbar.caret.fg = bg0;
        statusbar.caret.bg = dark_purple;
        statusbar.caret.selection.fg = bg0;
        statusbar.caret.selection.bg = bright_purple;
        statusbar.progress.bg = bright_blue;
        statusbar.url.fg = fg4;
        statusbar.url.error.fg = dark_red;
        statusbar.url.hover.fg = bright_orange;
        statusbar.url.success.http.fg = bright_red;
        statusbar.url.success.https.fg = fg0;
        statusbar.url.warn.fg = bright_purple;

        tabs.bar.bg = bg0;
        tabs.indicator.start = bright_blue;
        tabs.indicator.stop = bright_aqua;
        tabs.indicator.error = bright_red;
        tabs.odd.fg = fg2;
        tabs.odd.bg = bg2;
        tabs.even.fg = fg2;
        tabs.even.bg = bg3;
        tabs.selected.odd.fg = fg2;
        tabs.selected.odd.bg = bg0;
        tabs.selected.even.fg = fg2;
        tabs.selected.even.bg = bg0;
        tabs.pinned.even.bg = bright_green;
        tabs.pinned.even.fg = bg2;
        tabs.pinned.odd.bg = bright_green;
        tabs.pinned.odd.fg = bg2;
        tabs.pinned.selected.even.bg = bg0;
        tabs.pinned.selected.even.fg = fg2;
        tabs.pinned.selected.odd.bg = bg0;
        tabs.pinned.selected.odd.fg = fg2;

        webpage.bg = bg4;
        webpage.preferred_color_scheme = "dark";
      };
    };

    searchEngines = {
      "DEFAULT" = "https://google.com/search?hl=en&q={}";
      "!d" = "https://duckduckgo.com/?ia=web&q={}";
      "!nw" = "https://nixos.wiki/index.php?search={}";
      "!np" = "https://search.nixos.org/packages?type=packages&query={}";
      "!hm" = "https://mipmip.github.io/home-manager-option-search/?query={}";
      "!gh" = "https://github.com/search?o=desc&q={}&s=stars";
      "!gc" = "https://github.com/search?q={}&type=code";
      "!s" = "https://sourcegraph.com/search?patternType=standard&sm=1&q=context:global+{}";
      "!yt" = "https://youtube.com/results?search_query={}";
      "!g" = "https://www.google.com/search?hl=en&q={}";
    };

    # extraConfig = ''
    #   c.content.user_stylesheets = ['~/.config/qutebrowser/css/gruvbox.css']
    # '';
  };
}
