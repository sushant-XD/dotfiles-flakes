{
  config,
  lib,
  ...
}:
{
  options.hostSpec = {
    hostname = lib.mkOption {
      description = "The machine hostname";
      type = lib.types.str;
      default = "default";
    };
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
