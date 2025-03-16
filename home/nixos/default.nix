{nhModules, ...}: {
  imports = [
    "${nhModules}/common"
    "${nhModules}/desktop/hyprland"
    "${nhModules}/misc/stylix"
    "${nhModules}/programs/waybar"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
