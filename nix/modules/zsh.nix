{
  pkgs,
  repoRoot,
  ...
}:
{
  home.packages = with pkgs; [
    zsh
    direnv
    fzf
  ];

  # Traditional zsh setup: repo-managed files, symlinked into home.
  home.file.".config/zsh" = {
    source = repoRoot + "/.config/zsh";
  };

  home.file.".zshrc" = {
    source = repoRoot + "/.config/zsh/.zshrc";
  };
}
