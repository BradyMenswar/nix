{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = ''
        $directory $git_branch $git_status $time
        $character
      '';
      directory = {
        style = "fg:#e3e5e5 bg:#769ff0";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
      };
      git_branch = {
        style = "fg:#e3e5e5 bg:#769ff0";
        format = "[ on $branch ]($style)";
      };
      git_status = {
        style = "fg:#e3e5e5 bg:#769ff0";
        format = "[[$all_status$ahead_behind](bg:#394260)]($style)";
        staged = "[+\${count} ]($style)";
        modified = "[!\${count} ]($style)";
        deleted = "[-\${count} ]($style)";
        untracked = "[?\${count} ]($style)";
      };
      time = {
        style = "fg:#e3e5e5 bg:#769ff0";
        disabled = false;
        time_format = "%R";
        format = "[ $time ]($style)";
      };
    };
  };
}
