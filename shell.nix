let
  nixpkgs = builtins.fetchTarball {
    # https://github.com/NixOS/nixpkgs/tree/release-25.05 latest commit
    url = "https://github.com/nixos/nixpkgs/archive/9ba04bda9249d5d5e5238303c9755de5a49a79c5.tar.gz";
    sha256 = "05im0w8g3hhqgimahllxrnqjzx21zmg6g7qfwq4w2862clgpihhz";
  };
  pkgs = import nixpkgs { config = { allowUnfree = true; }; };
in

pkgs.mkShell {
  name = "dev-shell";
  buildInputs = [
    pkgs.python311
    pkgs.poetry
    pkgs.codespell
  ];

  shellHook = ''
  # configure poetry to create virtualenv in ./.venv
  export POETRY_VENV_IN_PROJECT=1
  # poetry reports it needs this
  export LANG=en_US.UTF-8
  # support for building wheels:
  # https://nixos.org/nixpkgs/manual/#python-setup.py-bdist_wheel-cannot-create-.whl
  unset SOURCE_DATE_EPOCH
  '';
}
