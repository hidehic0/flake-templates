{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ nixpkgs, flake-parts, ... }:
    let
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      inherit systems;
      flake = {
        templates = {
          default = {
            path = ./default;
            description = "default";
          };
        };
      };
    };
}
