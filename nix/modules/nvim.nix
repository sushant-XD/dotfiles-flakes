{
  repoRoot,
  ...
}:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      withPython3 = false;
      withRuby = false;
      viAlias = true;
      vimAlias = true;
    };
  };

  # Symlink .config/nvim from dotfiles into home
  home.file.".config/nvim" = {
    source = repoRoot + "/.config/nvim";
  };
}
