{
  config,
  ...
}:
{
  programs = {
    tmux = {
      enable = true;
      baseIndex = 1;
      keyMode = "vi";
      mouse = true;
    };
  };

  # Symlink tmux config from dotfiles
  home.file.".tmux.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dotfiles/.config/tmux/.tmux.conf";
  };
}
