{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs = {
    zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      
      shellAliases = {
        ll = "ls -lh";
        la = "ls -lah";
        l = "ls -l";
        ".." = "cd ..";
        "..." = "cd ../..";
        v = "vim";
        n = "nvim";
      };

      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "tmux"
          "fzf"
          "rust"
        ];
      };
    };

    fzf.enable = true;
  };

  # Optional: Symlink zsh config files from dotfiles if they exist
  # Add your .zshrc, .zsh_profile, or other zsh configs in .config/zsh/
  # home.file.".zshrc" = {
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/zsh/.zshrc";
  # };
}
