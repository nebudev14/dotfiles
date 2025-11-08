{
  pkgs,
  ...
}:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager = {
      startx.enable = true;
      gdm.enable = false;
    };
    desktopManager = {
      gnome.enable = false;
    };
  };

  services.displayManager.sddm.wayland.enable = true;

}
