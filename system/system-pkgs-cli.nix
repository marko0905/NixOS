{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        lazygit
        neofetch
        yazi
    ];

}