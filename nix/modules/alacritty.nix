{
  lib,
  repoRoot,
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
  home.file = lib.mkIf (builtins.pathExists (repoRoot + "/.config/alacritty")) {
    ".config/alacritty" = {
      source = repoRoot + "/.config/alacritty";
    };
  };
}
