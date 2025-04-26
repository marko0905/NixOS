{ config, pkgs, ... }:

{
    # Enable the X11 windowing system
    services.xserver.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable the desktop environment (GNOME)
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

}