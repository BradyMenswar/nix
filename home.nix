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
  ];

  stylix = {
    enable = true;
    image = ./home/wallpapers/wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
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

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    pciutils
  ];

  programs.home-manager.enable = true;
}
