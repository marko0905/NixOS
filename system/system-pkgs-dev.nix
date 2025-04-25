{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        vscode
        ghostty
        #github-desktop
        brave
    ];

}