{lib, ...}: {
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = true;
    highdpi = true;
    keyBindings = {
      normal = {
        ";v" = "hint links spawn --detach mpv {hint-url}";
        ",h" = lib.mkMerge [
          "config-cycle tabs.show      never   always"
          "config-cycle statusbar.show in-mode always"
          "config-cycle scrolling.bar  never   always"
        ];
        ",s" = lib.mkMerge [
          "config-cycle tabs.position  left   top"
        ];
      };
    };
    settings = {
      auto_save.session = true;
      fonts = {
        default_family = lib.mkForce "ZedMono Nerd Font Mono";
        default_size = lib.mkForce "10pt";
        web.family.fixed = lib.mkForce "ZedMono Nerd Font Mono";
      };
      colors.webpage.darkmode.enabled = true;
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
            "https://easylist.to/easylist/fanboy-annoyance.txt"
            "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"
            "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
            "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
            "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
            "https://www.i-dont-care-about-cookies.eu/abp/"
            "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext"
            "https://gitlab.com/curben/urlhaus-filter/-/raw/master/urlhaus-filter-online.txt"
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
    };

    searchEngines = {
      "DEFAULT" = "https://duckduckgo.com/?ia=web&q={}";
      "!d" = "https://duckduckgo.com/?ia=web&q={}";
      "!gc" = "https://github.com/search?q={}&type=code";
      "!g" = "https://www.google.com/search?hl=en&q={}";
      "!gr" = "https://github.com/search?q={}&type=repositories";
      "!gs" = "https://github.com/search?o=desc&q={}&s=stars";
      "!hm" = "https://home-manager-options.extranix.com/?query={}";
      "!nf" = "https://noogle.dev/q?term={}&limit=50&page=1";
      "!np" = "https://search.nixos.org/packages?type=packages&query={}";
      "!npp" = "https://github.com/NixOS/nixpkgs/pulls?q=is%3Apr+is%3Aopen+{}";
      "!nw" = "https://nixos.wiki/index.php?search={}";
      "!s" = "https://sourcegraph.com/search?patternType=standard&sm=1&q=context:global+{}";
      "!tr" = "https://nixpk.gs/pr-tracker.html?pr={}";
      "!yt" = "https://youtube.com/results?search_query={}";
    };

    # extraConfig = ''
    #   c.content.user_stylesheets = ['~/.config/qutebrowser/css/gruvbox.css']
    # '';
  };
}
