{pkgs, ...}: {
  # graphics drivers / HW accel
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libva
      libva-vdpau-driver
      libvdpau-va-gl
      libGL
      mesa
      intel-media-driver
      libva-utils
      gstreamer1
      gstreamer1Plugins.good
      gstreamer1Plugins.bad
      gstreamer1Plugins.ugly
      ffmpeg
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
}
