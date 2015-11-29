# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./graphics.nix
    ];


  networking.hostName = "nord"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "be-latin1";
    defaultLocale = "nl_BE.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Brussels";
  services.virtualboxHost.enable = true;
  virtualisation.virtualbox.host.enable = true;
  
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
     wget
     nox
     coq
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "be";
  services.xserver.xkbOptions = "eurosign:e";
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers = [
    { name = "wvhulle"; 
      home = "/home/wvhulle"; 
      createHome = true; 
      isNormalUser = true;  
      extraGroups = [ "wheel" "networkmanager" "users" "sudo" ];
      hashedPassword = "$6$nm5.UbBWdn78$Tarj7EBCjs5tP8ul7ub6pIqjEBEHYR3hLecnA9ZSSu8f/5KPLdDRnTMJFfY64uThMTHKIDrM6XTyGwh8Jbyai/";
    }
    ];

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

}
