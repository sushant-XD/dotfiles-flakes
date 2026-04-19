{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Linux-specific configuration
  home.packages = with pkgs; [
    ghostty
  ];
}

