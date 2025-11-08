{
  ...
}:
{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    #alsa.enable = true;
    #asla.support32Bit = true;
    pulse.enable = true;
  };
}
