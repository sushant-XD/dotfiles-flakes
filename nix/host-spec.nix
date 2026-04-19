{
  config,
  lib,
  ...
}:
{
  options.hostSpec = {
    system = lib.mkOption {
      description = "The system type: 'linux' or 'darwin'";
      type = lib.types.enum [ "linux" "darwin" ];
    };
    isWork = lib.mkOption {
      description = "Whether this is a work machine";
      type = lib.types.bool;
      default = false;
    };
  };
}
