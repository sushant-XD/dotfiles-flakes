{
  description = "Home Manager Dotfiles - Linux Fedora & macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
    }:
    let
      lib = nixpkgs.lib.extend (
        self: super: { custom = import ./nix/lib { inherit (nixpkgs) lib; }; } // home-manager.lib
      );

      # Helper to create home-manager configurations
      mkHomeConfig = { system, hostname, username, isWork }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = {
            inherit inputs lib;
            hostSpec = {
              inherit system isWork;
            };
          };
          modules = [
            ./nix/common.nix
            ./nix/home
            {
              home = {
                inherit username;
                homeDirectory = 
                  if system == "aarch64-darwin" || system == "x86_64-darwin"
                  then "/Users/${username}"
                  else "/home/${username}";
              };
            }
          ];
        };
    in
    {
      homeConfigurations = {
        # Fedora personal computer - Linux
        # Usage: home-manager switch --flake .#fedora
        fedora = mkHomeConfig {
          system = "x86_64-linux";
          hostname = "fedora";
          username = "wingman";  # Change this to your username
          isWork = false;
        };

        # macOS work laptop
        # Usage: home-manager switch --flake .#work-mac
        work-mac = mkHomeConfig {
          system = "aarch64-darwin";
          hostname = "work-mac";
          username = "YOUR_USERNAME";  # Change this to your username
          isWork = true;
        };
      };

      # Apps for easy activation
      apps = {
        x86_64-linux.fedora = {
          type = "app";
          program = "${self.homeConfigurations.fedora.activationPackage}/activate";
        };
        aarch64-darwin.work-mac = {
          type = "app";
          program = "${self.homeConfigurations.work-mac.activationPackage}/activate";
        };
      };

      # Default packages for direct use
      packages = {
        x86_64-linux.fedora = self.homeConfigurations.fedora.activationPackage;
        aarch64-darwin.work-mac = self.homeConfigurations.work-mac.activationPackage;
      };
    };
}
