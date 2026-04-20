{
  config,
  ...
}:
{
  # Work-only bootstrap layer. This file is imported only when hostSpec.isWork = true.

  home.sessionVariables = {
    # Keep these neutral; override per-machine in nix/home/hosts/*.nix if needed.
    WORK_ROOT = "${config.home.homeDirectory}/work";
    BAZELISK_HOME = "${config.home.homeDirectory}/.cache/bazelisk";
    BAZEL_CXXOPTS = "-std=c++17";
    DIRENV_LOG_FORMAT = "";
  };
}
