{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(zoxide init --cmd cd zsh)"
      eval "$(starship init zsh)"
    '';

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .";
      hs = "home-manager switch --flake .";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fastfetch = {
    enable = true;
  };
}
