{pkgs}: let
  flags = ''
    # Wayland support
    --ozone-platform=wayland
    --enable-features=WaylandWindowDecorations
    # GPU and Video Acceleration Flags
    --use-vulkan=native
    --enable-dawn-backend=vulkan
    --ignore-gpu-blocklist
    --enable-gpu-rasterization
    --enable-zero-copy
    --enable-raw-draw
    --enable-drdc
    --disable-gpu-driver-bug-workarounds
    --disable-features=UseChromeOSDirectVideoDecoder
    --enable-features=UseOzonePlatform,Vulkan,SkiaGraphite,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,VaapiIgnoreDriverChecks,OverlayScrollbar,ParallelDownloading
    # Performance
    --enable-hardware-overlays
    --enable-accelerated-video-decode
    --enable-accelerated-video-encode
    --enable-accelerated-mjpeg-decode
    --enable-oop-rasterization
    --enable-webgl-developer-extensions
    --enable-accelerated-2d-canvas
    --enable-direct-composition
    --enable-gpu-compositing
    # Smooth browsing
    --enable-media-router
    --enable-smooth-scrolling
    # UnGoogled features
    --disable-search-engine-collection
    --extension-mime-request-handling=always-prompt-for-install
    --fingerprinting-canvas-image-data-noise
    --fingerprinting-canvas-measuretext-noise
    --fingerprinting-client-rects-noise
    --popups-to-tabs
    --force-punycode-hostnames
    --show-avatar-button=incognito-and-guest
    # Miscellaneous
    --no-default-browser-check
    --no-pings
  '';

  sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    LIBVA_MESSAGING_LEVEL = "1";
    LIBGL_ALWAYS_SOFTWARE = "0";
    ENABLE_VAAPI = "1";
    ENABLE_VDPAU = "1";
    VAAPI_DISABLE_ENCODER_CHECKING = "1";
    EGL_PLATFORM = "wayland";
    RADV_PERFTEST = "sam";
    AMD_VULKAN_ICD = "RADV";
  };

  flagsList =
    builtins.filter (s: s != "" && !(pkgs.lib.hasPrefix "#" s))
    (pkgs.lib.splitString "\n" flags);
in {
  inherit flags flagsList sessionVariables;

  configFile = {
    "chromium-flags.conf".text = flags;
  };
}
