{ config, pkgs, ... }:

{

    # Exclude unwanted GNOME applications
    environment.gnome.excludePackages = [
        pkgs.geary
        pkgs.gnome-contacts
        pkgs.gnome-weather
        pkgs.gnome-maps
        pkgs.totem
        pkgs.gnome-tour
        pkgs.gnome-terminal
        pkgs.epiphany
        pkgs.gnome-music
  ];

}