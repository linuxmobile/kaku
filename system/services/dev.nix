{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Node.js and JS tools
    nodejs
    yarn
    pnpm
    typescript
    eslint
    prettier
    
    # Rust
    rustc
    cargo
    rustfmt
    clippy
    
    # Python
    python3
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.virtualenv
    
    # PlatformIO for IoT/Robotics
    platformio
    
    # Useful dev tools
    git
    neovim
    vscode
    helix
    
    # Debugging and utilities
    gdb
    lldb
    htop
    bottom
    bat
    ripgrep
    fd
    
    # Container tools
    podman
    
    # Misc
    jq
    curl
    wget
  ];
}
