{pkgs, ...}: {
  home.packages = with pkgs; [
    wineWowPackages.waylandFull
    dxvk
    vkd3d
    lutris
  ];

  home.sessionVariables = {
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
    WINEWAYLAND_DISABLE_XWAYLAND = "1";
    WINE_VK_VULKAN_ONLY = "1";
    DXVK_ENABLE_NVAPI = "0";
  };
}
