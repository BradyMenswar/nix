{lib, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      disable_ligatures = "always";
    };
    font = {
      size = lib.mkForce 16;
    };
  };
}
