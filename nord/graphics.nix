{ config, lib, pkgs, ... }:

{
  

  services.xserver.videoDrivers = [ "nouveau" ];
  hardware.opengl.driSupport32Bit = true;
  
  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.kdm.enable = true;
  services.xserver.desktopManager.kde5.enable = true;
  
}
