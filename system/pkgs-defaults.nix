{ config, pkgs, ... }:

{   
    
    # Use zsh as default shell
    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    # Enable git
    programs.git.enable = true;

    # Packages to instal by default
    environment.systemPackages = with pkgs; [
        vim         # | cli text editor
        wget        # | package for retriving files
        vscode      # | text editor
        ghostty     # | terminal emulator
        brave       # | browser
        vlc         # | video player
        oh-my-posh  # | zsh prompt theme engine
        zinit       # | zsh plugin manager
        lazygit     # | cli git helper
        neofetch    # | cli system information tool
        yazi        # | cli file explorer
        gnome-extension-manager
    ];

}