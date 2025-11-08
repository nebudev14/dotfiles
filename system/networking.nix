{
  pkgs,
  ...
}:

{
  networking.hostName = "warren-fw13";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [ "enp195s0f4u1" ];

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  networking.interfaces.enp195s0f3u1 = {
    ipv4.addresses = [
      {
        address = "192.168.1.30";
        prefixLength = 24;
      }
    ];
    useDHCP = false;
  };

  programs.wireshark.enable = true;

  users.users.warren.packages = with pkgs; [
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc
    wireguard-tools
  ];

}
