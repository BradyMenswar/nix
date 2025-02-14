{
  pkgs,
  inputs,
  ...
}: {
  programs.wofi.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
    ];
    settings = {
      exec-once = [
        "hyprpaper"
        "ags run"
      ];

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun";

      bind = [
        "$mod, F, exec, firefox"
        "$mod, S, exec, kitty"
        "$mod, D, exec, discord"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod, Q, killactive"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating,"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        "$mod, SPACE, exec, $menu"
        "SUPER_SHIFT, H, movewindow, l"
        "SUPER_SHIFT, J, movewindow, d"
        "SUPER_SHIFT, K, movewindow, u"
        "SUPER_SHIFT, L, movewindow, r"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      decoration = {
        rounding = 4;
        rounding_power = 4.0;
      };
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "./wallpapers/wallpaper.jpg"
      ];
      wallpaper = [
        ", ./wallpapers/wallpaper.jpg"
      ];
    };
  };
}
