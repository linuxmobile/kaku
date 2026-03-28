{config, ...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      # default ssh config
      "*" = {
        addKeysToAgent = "yes";
        certificateFile = [];
        checkHostIP = true;
        compression = false;
        controlMaster = "no";
        controlPath = "${config.home.homeDirectory}/.ssh/master-%r@%n:%p";
        controlPersist = "no";
        dynamicForwards = [];
        extraOptions = {
          "PasswordAuthentication" = "no";
        };
        forwardAgent = false;
        forwardX11 = false;
        forwardX11Trusted = false;
        hashKnownHosts = true;
        identitiesOnly = true;
        identityAgent = [];
        identityFile = [];
        localForwards = [];
        remoteForwards = [];
        sendEnv = [];
        serverAliveCountMax = 3;
        serverAliveInterval = 60;
        setEnv = {};
        userKnownHostsFile = "${config.home.homeDirectory}/.ssh/known_hosts";
      };
    };
  };
}
