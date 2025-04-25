{

    description = "My First Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        home-manager.url = "github:nix-community/home-manager/release-24.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }:
        let
            lib = nixpkgs.lib;
            system = "aarch64-linux";   # var for system architecture. Uncoment if using arm64
            # system = "x86_64-linux";  # var for system architecture. Uncoment if using x86_64
            pkgs = nixpkgs.legacyPackages.${system}; # Caling in the var system
        in {
            nixosConfigurations = {
                nixos-vm = lib.nixosSystem { # must be the same name "nixos-vm" as in the configuration.nix hostName
                    inherit system; # inherityng the var system
                    modules = [ ./configuration.nix ];
                };
            };

            homeConfigurations = {
                marko = home-manager.lib.homeManagerConfiguration { # must be the same name "marko" as in the configuration.nix user
                    inherit pkgs;
                    modules = [ ./home.nix ];
                };
            };
        };

}

# Flake_____(>>IN)
## To build the flake.nix configuration
## Position your self to the directory where the flake.nix is located < cd ~/.dotfiles >
## Command to build the flake.nix is < sudo nixos-rebuild switch --flake . >
## This will build the flake.nix and make the flake.lock file

## To update the flake.lock configuration
## Position your self to the directory where the flake.nix is located < cd ~/.dotfiles >
## Command to update the flake.lock is < nix flake update >
# Flake_____(<<OUT)

# Home-Manager_____(>>IN)
## To build the home-manager in the flake.nix file
## Position your self to the directory where the flake.nix is located < cd ~/.dotfiles >
## Command < home-manager switch --flake . >
# Home-Manager_____(<<OUT)