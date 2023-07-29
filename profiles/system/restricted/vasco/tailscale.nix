{ config, lib, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.tailscale ];
  services.tailscale = {
    enable = true;
    permitCertUid = "vasco";
  };
}
