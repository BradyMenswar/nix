{pkgs, ...}: {
  home.username = "brady";
  home.homeDirectory = "/home/brady";
  home.stateVersion = "24.11";

  imports = [
    ./home/zsh.nix
    ./home/neovim.nix
    ./home/starship.nix
    ./home/kitty.nix
    ./home/hyprland.nix
    ./home/stylix.nix
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    pciutils
    gowall
    obsidian
  ];

  programs.home-manager.enable = true;
}
