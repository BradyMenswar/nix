{config, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format =
        "$directory"
        + "[](fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base02})"
        + "$git_branch"
        + "$git_status"
        + "[](fg:#${config.lib.stylix.colors.base02} bg:#${config.lib.stylix.colors.base03})"
        + "$nodejs"
        + "$rust"
        + "[](fg:#${config.lib.stylix.colors.base03} bg:#${config.lib.stylix.colors.base04})"
        + "$time"
        + "[](fg:#${config.lib.stylix.colors.base04})"
        + "\n$character";

      directory = {
        style = "fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base01}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
      };

      git_branch = {
        symbol = "";
        style = "fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02}";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base01}";
        format = "[[$all_status$ahead_behind](bg:#${config.lib.stylix.colors.base01})]($style)";
        staged = "[+$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        modified = "[!$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        deleted = "[-$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        untracked = "[?$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        conflicted = "[~$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        renamed = "[»$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        stashed = "[S$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        ahead = "[⇡$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        behind = "[⇣$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
        diverged = "[⇕$count ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base02})";
      };

      nodejs = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base03})]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base06} bg:#${config.lib.stylix.colors.base03})]($style)";
      };

      time = {
        style = "fg:#${config.lib.stylix.colors.base01} bg:#${config.lib.stylix.colors.base04}";
        disabled = false;
        time_format = "%R";
        format = "[  $time ]($style)";
      };
    };
  };
}
