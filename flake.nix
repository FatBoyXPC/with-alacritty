{
  description = "Let's make with-alacritty available for nix!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.callPackage ./nix {};

  };
}
