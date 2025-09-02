{
  virtualisation.libvirtd.enable = true;
  virtualisation.qemu.package = pkgs.qemu_kvm;
  virtualisation.qemu.headless = false;
  programs.virt-manager.enable = true;
}
