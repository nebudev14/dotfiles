{
  pkgs,
  inputs,
  ...
} : {

  programs.waybar = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    inputs.niri.packages.${pkgs.system}.niri-unstable
    ghostty
    nushell
    carapace
    brightnessctl
    wl-clipboard
    pavucontrol
    blueberry
    xwayland-satellite
  ];

  fonts = {
    enableDefaultPackages = true;     
    packages = with pkgs; [
      # nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
    fontconfig = {
      enable = true; # Enable fontconfig for proper font rendering
    };
  };
}
