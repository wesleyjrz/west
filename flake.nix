{
  description = "[we]st - Wesley's simple terminal";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = flake-utils.lib.flattenTree {
          west = pkgs.callPackage ./default.nix { };
        };
        defaultPackage = packages.west;
        apps.west = flake-utils.lib.mkApp {
          drv = packages.west;
          exePath = "/bin/st";
        };
        apps.default = apps.west;
        defaultApp = apps.west;
        devShell = pkgs.mkShell {
          name = "west";
          packages = with pkgs; [
            pkgconfig
            xorg.libX11
            xorg.libXft
            fontconfig
            harfbuzz
            gd
            glib
          ];
        };

      });
}
