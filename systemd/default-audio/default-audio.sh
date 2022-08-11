#zobrazit vstupne zariadenia
#pactl list short sources
#0       alsa_input.usb-SHENZHENAONI_ELECTRONIC_CO._LTD_2K_FHD_camera_AN2020091401-02.analog-stereo      module-alsa-card.c      s16le 2k 32000Hz        SUSPENDED
#1       alsa_output.pci-0000_00_1f.3.analog-stereo.monitor      module-alsa-card.c      s16le 2k 44100Hz        IDLE
#2       alsa_input.pci-0000_00_1f.3.analog-stereo       module-alsa-card.c      s16le 2k 44100Hz        SUSPENDED

#zobrazit vystupne zariadenia
#pactl list short sinks
#0       alsa_output.pci-0000_00_1f.3.analog-stereo      module-alsa-card.c      s16le 2k 44100Hz        RUNNING

# set default input
pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo

# set default output
#pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo