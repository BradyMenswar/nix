{inputs, ...}: {
  home.username = "brady";
  home.homeDirectory = "/home/brady";
  home.stateVersion = "24.11";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./home/zsh.nix
    ./home/neovim.nix
    ./home/starship.nix
    ./home/kitty.nix
    ./home/hyprland.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.dracula;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
}
