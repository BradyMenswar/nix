{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ../../programs/wofi
    ../../programs/waybar
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    plugins = [
      # inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
    ];
    settings = {
      exec-once = [
        "hyprpaper"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "pidof wofi || wofi --show drun";

      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2.5, md3_decel"
          "workspaces, 1, 3.5, easeOutExpo, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      bind = [
        "$mod, B, exec, zen"
        "$mod, RETURN, exec, kitty"
        "$mod, D, exec, discord"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod, Q, killactive"
        "$mod, E, exec, $fileManager"
        "$mod, F, togglefloating,"
        "$mod SHIFT, F, fullscreen,"
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
        "$mod, P, exec, hyprshot -z -m region --clipboard-only"
        "$mod SHIFT, P, exec, hyprshot -z -m region"
        "$mod SHIFT, C, exec, hyprpicker -a -n"
        "$mod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
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
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = false;
          size = 12;
          passes = 4;
          new_optimizations = "on";
          ignore_opacity = false;
          xray = false;
        };

        # shadow = {
        #   enabled = false;
        #   range = 30;
        #   render_power = 3;
        # };
        rounding_power = 4.0;
      };

      general = {
        gaps_in = 8;
        gaps_out = 12;
        border_size = 1;
        "col.active_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base0B}ff)";
        "col.inactive_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base03}ff)";
        layout = "dwindle";
        resize_on_border = true;
      };

      windowrulev2 = [
        "workspace 3, class:^(discord)$"
        "monitor DP-6, class:^(discord)$"
        "fullscreen, class:^(blender)$"
        "fullscreen, class:^(Godot)$"
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "../../../../wallpapers/glacier.png"
      ];
      wallpaper = [
        ", ../../../../wallpapers/glacier.png"
      ];
    };
  };
}
