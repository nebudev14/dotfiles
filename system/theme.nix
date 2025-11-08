{
  pkgs,
  ...
} : {

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
