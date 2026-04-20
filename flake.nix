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
              inherit system isWork hostname;
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
        # Personal computer: wingman
        # Usage: nix run github:nix-community/home-manager/master -- switch -b backup --flake .#wingman
        wingman = mkHomeConfig {
          system = "x86_64-linux";
          hostname = "wingman";
          username = "wingman";
          isWork = false;
        };

        # Personal computer: sushant
        # Usage: nix run github:nix-community/home-manager/master -- switch -b backup --flake .#sushant
        sushant = mkHomeConfig {
          system = "x86_64-linux";
          hostname = "sushant";
          username = "sushant";
          isWork = false;
        };

        # Work Mac
        # Usage: nix run github:nix-community/home-manager/master -- switch -b backup --flake .#work-mac
        work-mac = mkHomeConfig {
          system = "aarch64-darwin";
          hostname = "work-mac";
          username = "sushant.dhakal";
          isWork = true;
        };

        # Compatibility aliases
        fedora = self.homeConfigurations.wingman;
        work-mac-linux = self.homeConfigurations.sushant;
      };

      # Apps for easy activation
      apps = {
        x86_64-linux.wingman = {
          type = "app";
          program = "${self.homeConfigurations.wingman.activationPackage}/activate";
        };
        x86_64-linux.sushant = {
          type = "app";
          program = "${self.homeConfigurations.sushant.activationPackage}/activate";
        };
        aarch64-darwin.work-mac = {
          type = "app";
          program = "${self.homeConfigurations.work-mac.activationPackage}/activate";
        };
      };

      # Default packages for direct use
      packages = {
        x86_64-linux.wingman = self.homeConfigurations.wingman.activationPackage;
        x86_64-linux.sushant = self.homeConfigurations.sushant.activationPackage;
        aarch64-darwin.work-mac = self.homeConfigurations.work-mac.activationPackage;
      };
    };
}
