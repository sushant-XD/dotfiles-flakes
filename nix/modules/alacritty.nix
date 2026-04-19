{
  config,
  ...
}:
{
  programs = {
    alacritty = {
      enable = true;
    };
  };

  # Symlink alacritty config from dotfiles if it exists
  # Create ~/.config/alacritty/alacritty.toml in the dotfiles repo to customize
  home.file.".config/alacritty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dotfiles/.config/alacritty";
  };
}
