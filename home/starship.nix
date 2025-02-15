{config, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format =
        "[░▒▓](#${config.lib.stylix.colors.base08})"
        + "$directory"
        + "[](fg:#${config.lib.stylix.colors.base08} bg:#${config.lib.stylix.colors.base09})"
        + "$git_branch"
        + "$git_status"
        + "[](fg:#${config.lib.stylix.colors.base09} bg:#${config.lib.stylix.colors.base0A})"
        + "$nodejs"
        + "$rust"
        + "[](fg:#${config.lib.stylix.colors.base0A} bg:#${config.lib.stylix.colors.base0B})"
        + "$time"
        + "[](fg:#${config.lib.stylix.colors.base0B})"
        + "\n$character";

      directory = {
        style = "fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base08}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
      };

      git_branch = {
        symbol = "";
        style = "fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09}";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09}";
        format = "[[$all_status$ahead_behind](bg:#${config.lib.stylix.colors.base09})]($style)";
        staged = "[+$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        modified = "[!$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        deleted = "[-$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        untracked = "[?$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        conflicted = "[~$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        renamed = "[»$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        stashed = "[S$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        ahead = "[⇡$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        behind = "[⇣$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
        diverged = "[⇕$count ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base09})";
      };

      nodejs = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base0A}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base0A})]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base0A})]($style)";
      };

      time = {
        style = "fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base0B}";
        disabled = false;
        time_format = "%R";
        format = "[  $time ]($style)";
      };
    };
  };
}
