{
  config,
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
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dotfiles/.config/nvim";
  };
}
