{
  inputs,
  config,
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
    ../programs/node
    ../programs/python
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  home.file."${config.xdg.dataHome}/fonts" = {
    source = ../../../fonts;
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
      blender
      chromedriver
      ffmpeg_6
      protonvpn-gui
      vlc
      godot_4
      material-maker
      mangohud
      protonup-qt
      wl-clipboard
      hyprpicker
      hyprshot
    ];
}
