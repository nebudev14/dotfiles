{
  pkgs,
  config,
  ...
}: {
   
  systemd.services.ModemManager.enable = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  boot = {
    extraModulePackages = [ config.boot.kernelPackages.evdi ];
    initrd = {
      kernelModules = [
        "evdi"
      ];
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05"; 

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
    };
  };

  users.users.warren = {
    isNormalUser = true;
    description = "Warren";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "wireshark"
      "dialout"
      "uucp"      
    ];
  };
    
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="16c0", MODE="0666"
    KERNEL=="hidraw*", MODE="0666"
  '';  

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.printing.enable = true;
  security.rtkit.enable = true;

  time.timeZone = "America/New_York";
  
}
