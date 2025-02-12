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
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
}
