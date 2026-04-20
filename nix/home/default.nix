{
  config,
  pkgs,
  hostSpec,
  lib,
  ...
}:
let
  hostOverride = ./hosts + "/${hostSpec.hostname}.nix";
in
{
  imports = 
    [
      ../modules/git.nix
      ../modules/zsh.nix
      ../modules/nvim.nix
      ../modules/alacritty.nix
      ../modules/tmux.nix
    ]
    ++ lib.optional (builtins.pathExists hostOverride) hostOverride
    ++ (if hostSpec.system == "linux" then [ ./linux.nix ] else [ ./darwin.nix ])
    ++ (if hostSpec.isWork then [ ./work.nix ] else [ ]);

  home.stateVersion = "24.05";

  # Common packages for all systems
  home.packages = with pkgs; [
    # CLI tools
    bat
    direnv
    fd
    fzf
    htop
    jq
    lsof
    ripgrep
    rsync
    tmux
    unzip
    watch
    wget
    yq
    # Development
    bazelisk
    cmake
    git
    python312
    rustup
    vim
  ];

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}


