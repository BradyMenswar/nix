{
  hostname,
  nixosModules,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixosModules}/common"
  ];

  networking.hostName = hostname;

  system.stateVersion = "24.11";
}
