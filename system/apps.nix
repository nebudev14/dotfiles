{ 
  pkgs, 
  inputs,
  ... 
} : {
    

  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  users.users.warren.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    firefox
    thunderbird
    code-cursor
    obs-studio
    webcord
    thunderbird
    obsidian
    slack
    teams-for-linux
    rerun
    zathura

    fastfetch
    nitch
    microfetch
    yazi
    zellij
    swaybg

  ];

}
