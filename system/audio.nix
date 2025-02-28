# audio
{ ... }:
{
# Load the sequencer and midi kernel modules.
  boot.kernelModules = ["snd-seq" "snd-rawmidi"];
  users.extraUsers.igor.extraGroups = [ "audio" "realtime" ];

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
    pulse.enable = true;
  };

  # Must disable pulseaudio to allow for the pipewire pulseaudio emulation.
  hardware.pulseaudio.enable = false;
}

