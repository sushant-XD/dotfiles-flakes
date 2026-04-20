{ pkgs, ... }:
{
  imports = [ ./host-spec.nix ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  nix = {
    package = pkgs.nix;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };
}
