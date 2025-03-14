{nhModules, ...}: {
  imports = [
    "${nhModules}/common"
    "${nhModules}/desktop/hyprland"
    "${nhModules}/misc/stylix"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
