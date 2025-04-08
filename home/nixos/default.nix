{nhModules, ...}: {
  imports = [
    "${nhModules}/common"
    "${nhModules}/desktop/hyprland"
    "${nhModules}/misc/stylix"
    "${nhModules}/programs/cemu"
    "${nhModules}/programs/lutris"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
