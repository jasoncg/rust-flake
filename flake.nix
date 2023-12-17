{
  description = "A Rust project";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [ 
            pkgs.openssl 
            pkgs.pkg-config

            pkgs.rustc 
            pkgs.cargo 
            pkgs.rustup 

            # Add additional packages here
          ];

            shellHook = ''
              #rustup target add wasm32-unknown-unknown
              echo "Running: `rustc --version`"
            '';
        };
      }
    );
}

