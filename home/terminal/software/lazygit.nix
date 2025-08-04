{
  programs.lazygit = {
    enable = true;
    settings = {
      disableStartupPopups = true;
      notARepository = "skip";
      promptToReturnFromSubprocess = false;
      update.method = "never";
      git = {
        commit.signOff = true;
        parseEmoji = true;
      };
      gui = {
        theme = {
          activeBorderColor = ["magenta" "bold"];
          inactiveBorderColor = ["black"];
        };
        showListFooter = false;
        showRandomTip = false;
        showCommandLog = false;
        showBottomLine = false;
        nerdFontsVersion = "3";
      };
    };
  };
}
