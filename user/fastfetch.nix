# fastfetch config module
{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      schema = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        type = "builtin";
        #  color = {
        #"1" = "green";
        #"2" = "cyan";
        #};
      };
      display = {
        separator = "   ";
        color = "cyan";
      };
      modules = [
        {
          type = "custom"; # HardwareStart
          format = "┌─────────── Hardware Information ───────────┐"; # `\u001b` is `\033`, or `\e`
        }
        {
          type = "host";
          key = "  󰌢";
        }
        {
          type = "cpu";
          key = "  ";
        }
        {
          type = "gpu";
          detectionMethod = "pci";
          key = "  ";
        }
        {
          type = "display";
          key = "  󱄄";
        }
        {
          type = "memory";
          key = "  ";
        }
        {
          type = "custom"; # SoftwareStart
          format = "├─────────── Software Information ───────────┤";
        }
        {
          type = "os";
          key = "  "; # Just get your distro's logo off nerdfonts.com
        }
        {
          type = "kernel";
          key = "  ";
          format = "{1} {2}";
        }
        {
          type = "wm";
          key = "  ";
        }
        {
          type = "shell";
          key = "  ";
        }
        {
          type = "custom"; # InformationEnd
          format = "|────────────── Uptime / Age ────────────────|";
        }
        {
          type = "command";
          key = "  OS Age ";
          keyColor = "magenta";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  Uptime ";
          keyColor = "magenta";
        }
        {
          type = "custom"; # InformationEnd
          format = "└────────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
