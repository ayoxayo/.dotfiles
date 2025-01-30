# git config module
{ ... }:
{
  programs.git = {
    enable = true;
    userName = "ayoxayo";
    userEmail = "ayoxayo.j704t@simplelogin.co";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
