{
  inputs,
  pkgs,
  ...
}: {
  home.username = "brady";
  home.homeDirectory = "/home/brady";
  home.stateVersion = "24.11";

  imports = [
    inputs.ags.homeManagerModules.default
    ./home/zsh.nix
    ./home/neovim.nix
    ./home/starship.nix
    ./home/kitty.nix
    ./home/hyprland.nix
  ];

  stylix = {
    enable = true;
    image = ./home/wallpapers/wallpaper-everforest.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    polarity = "dark";
    opacity = {
      terminal = 0.9;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  programs.ags = {
    enable = true;
    configDir = ./home/ags;
    extraPackages = [
      inputs.ags.packages.${pkgs.system}.battery
    ];
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    pciutils
    gowall
  ];

  programs.home-manager.enable = true;
}
