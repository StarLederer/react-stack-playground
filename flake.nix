{
  description = "pnpm with internal Node v18";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/22.11";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (self: super: {
              cypress = super.cypress.overrideAttrs (oldAttrs: rec {
                pname = "cypress";
                version = "12.9.0";

                src = super.fetchzip {
                  url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
                  sha256 = "sha256-ozyQya2WxnDK6of1VfxlDlXo6IDGxAXkCjFt3DqRM4k=";
                  ## Note: sha256 is computed via (note the version):
                  ##
                  ## nix-prefetch-url --unpack https://cdn.cypress.io/desktop/12.8.1/linux-x64/cypress.zip
                };
              });
            })
          ];
        };
        pnpm = pkgs.nodePackages.pnpm.override {
          nodejs = pkgs.nodejs-18_x;
        };
      in {
        devShell = pkgs.mkShell rec {
          nativeBuildInputs = with pkgs; [
            pnpm
            cypress
          ];

          shellHook = ''
            export CYPRESS_INSTALL_BINARY=0
            export CYPRESS_RUN_BINARY=${pkgs.cypress}/bin/Cypress
          '';
        };
      }
    );
}
