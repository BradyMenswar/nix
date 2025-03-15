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
    ../misc/stylix
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
      inkscape
    ]
    ++ lib.optionals stdenv.isDarwin [
      raycast
    ]
    ++ lib.optionals (!stdenv.isDarwin) [
      inputs.zen-browser.packages."${system}".default
      pciutils
      gowall
      mangohud
      protonup-qt
      wl-clipboard
      hyprpicker
      hyprshot
    ];
}
