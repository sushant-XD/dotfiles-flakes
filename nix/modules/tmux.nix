{
  repoRoot,
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
    source = repoRoot + "/.config/tmux/.tmux.conf";
  };
}
