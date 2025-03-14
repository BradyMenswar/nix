{
  inputs,
  pkgs,
  system,
  ...
}: {
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
    wl-clipboard
    hyprpicker
    hyprshot
    inputs.zen-browser.packages."${system}".default
    mangohud
    protonup-qt
    inkscape
  ];
  services.mako = {
    enable = true;
    borderRadius = 8;
    padding = "16";
  };

  services.cliphist = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
