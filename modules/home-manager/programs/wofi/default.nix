{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [wofi-emoji];
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      width = 450;
      show = "drun";
      prompt = "Search...";
      normal_window = true;
      layer = "top";
      term = "foot";
      height = "500px";
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };

    style =
      lib.mkForce
      ''
        #outer-box {
          padding: 20px;
        }

        #input {
          padding: 8px 12px;
        }

        #scroll {
          margin-top: 20px;
        }

        #inner-box {}

        #img {
          padding-right: 8px;
        }

        #entry {
          padding: 6px;
        }
      '';
  };
}
