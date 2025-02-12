{config, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = ''
        [░▒▓](#${config.lib.stylix.colors.base08})$directory$git_branch$git_status$time
        $character
      '';
      directory = {
        style = "fg:#${config.lib.stylix.colors.base04} bg:#${config.lib.stylix.colors.base08}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
      };
      git_branch = {
        style = "fg:#${config.lib.stylix.colors.base04} bg:#${config.lib.stylix.colors.base08}";
        format = "[ on $branch ]($style)";
      };
      git_status = {
        style = "fg:#${config.lib.stylix.colors.base04} bg:#${config.lib.stylix.colors.base08}";
        format = "[[$all_status$ahead_behind](bg:#${config.lib.stylix.colors.base08})]($style)";
        staged = "[+\${count} ]($style)";
        modified = "[!\${count} ]($style)";
        deleted = "[-\${count} ]($style)";
        untracked = "[?\${count} ]($style)";
      };
      time = {
        style = "fg:#${config.lib.stylix.colors.base04} bg:#${config.lib.stylix.colors.base08}";
        disabled = false;
        time_format = "%R";
        format = "[ $time ]($style)";
      };
    };
  };
}
