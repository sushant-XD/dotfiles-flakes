{
  hostSpec,
  pkgs,
  lib,
  ...
}:
{
  programs =
    if hostSpec.isWork then
      { }
    else
      {
        git = {
          enable = true;

          settings = {
            user = {
              name = "sushant-XD";  # Change this to your name
              email = "sushantdhakal07@gmail.com";  # Change this to your email
            };
            core.editor = "vim";
            init.defaultBranch = "main";
            pull.rebase = true;
          };
        };

        gh = {
          enable = true;
          gitCredentialHelper.enable = false;
        };
      };
}
