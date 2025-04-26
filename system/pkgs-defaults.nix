{ config, pkgs, ... }:

{
    # Enable git
    programs.git.enable = true;

    # Packages to instal by default
    environment.systemPackages = with pkgs; [
        vim
        wget
        git
        vscode
        ghostty
        #github-desktop
        brave
    ];

}