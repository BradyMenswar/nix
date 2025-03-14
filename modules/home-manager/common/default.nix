{
  inputs,
  outputs,
  userConfig,
  pkgs,
  ...
}: {
  imports = [
    ../programs/neovim
    ../shells/zsh
    ../terminals/kitty
    ../terminals/starship
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "${userConfig.name}";
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${userConfig.name}"
      else "/home/${userConfig.name}";
  };

  home.packages = with pkgs;
    [
      obsidian
      inputs.zen-browser.packages."${system}".default
      inkscape
    ]
    ++ lib.optionals stdenv.isDarwin [
      raycast
    ]
    ++ lib.optionals (!stdenv.isDarwin) [
      pciutils
      gowall
      mangohud
      protonup-qt
      wl-clipboard
      hyprpicker
      hyprshot
    ];
}
