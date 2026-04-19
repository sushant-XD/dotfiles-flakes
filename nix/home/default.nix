{
  config,
  pkgs,
  hostSpec,
  lib,
  ...
}:
{
  imports = 
    [
      ../modules/git.nix
      ../modules/zsh.nix
      ../modules/nvim.nix
      ../modules/alacritty.nix
      ../modules/tmux.nix
    ]
    ++ (if hostSpec.system == "linux" then [ ./linux.nix ] else [ ./darwin.nix ])
    ++ (if hostSpec.isWork then [ ./work.nix ] else [ ]);

  home.stateVersion = "24.05";

  # Common packages for all systems
  home.packages = with pkgs; [
    # CLI tools
    bat
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
    cmake
    git
    python312
    rustup
    vim
  ];

  programs = {
    home-manager.enable = true;
  };
}


