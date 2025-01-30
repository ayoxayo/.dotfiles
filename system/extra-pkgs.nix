# extra packages and thier config if necessary
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sweethome3d.application
    sweethome3d.furniture-editor
    sweethome3d.textures-editor
  ];

  environment.variables = {
    JAVA_TOOL_OPTIONS = "-Dcom.eteks.sweethome3d.j3d.useOffScreen3DView=true";
  };
}
