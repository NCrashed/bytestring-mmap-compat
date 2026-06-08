{
  description = "bytestring-mmap-compat";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        hpkgs = pkgs.haskellPackages;
        pkg = hpkgs.callCabal2nix "bytestring-mmap-compat" ./. { };
      in {
        packages.default = pkg;

        devShells.default = hpkgs.shellFor {
          packages = _: [ pkg ];
          buildInputs = [
            hpkgs.cabal-install
            hpkgs.ghc
            hpkgs.haskell-language-server
            pkgs.pkg-config
          ];
        };
      });
}
