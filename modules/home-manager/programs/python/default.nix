{pkgs, ...}: {
  home.packages = with pkgs; [
    (python312.withPackages (py:
      with py; [
        numpy
        requests
        pandas
        pymupdf
        inkex
      ]))
  ];
}
