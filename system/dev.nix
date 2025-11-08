{
  pkgs,
  inputs,
  ...
} : {
  imports = [
    ../services/can_logging.nix
  ];
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user.email = "wyun2006@gmail.com";
      user.name = "nebudev14";
    };
  };
  
  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${pkgs.system}.default

    # virtualization
    distrobox 
    podman

    # utils
    act
    ripgrep 
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder
    fuzzel
    glow # markdown previewer in terminal
    zip
    xz
    unzip
    p7zip
    ethtool
    usbutils
    seatd
    jaq
    file
    which
    tree
    gawk
    zstd
    gnupg

    # nix 
    nixfmt-rfc-style
    nix-output-monitor
    nh

    # misc
    typst
    mcap-cli
    teensy-loader-cli
    qemu-user
    qemu
    # monitoring
    btop 
    iotop
    iftop 
    strace 
    sysstat

  ];

  environment.interactiveShellInit = ''
    export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    export EDITOR=nvim
    export ELECTRON_OZONE_PLATFORM_HINT=auto
    export DISPLAY=:0
    export DISTROBOX_RUNTIMES=podman
  '';

  environment.shellAliases = {
    zj = "zellij'";
    yz = "yazi";
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.variables.EDITOR = "neovim";

  # Hytech stuff
  logging-service.enable = false;

  fileSystems."/mnt/can_logs" = {
    device = "UUID=6CEC-5AC8";
    fsType = "exfat";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=10"
      "sync"

      "uid=0"
      "gid=0"
      "umask=022"
    ];
  };
}
