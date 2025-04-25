{ config, pkgs, ... }:

{
    # Use zsh as default shell
    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
        oh-my-posh  # zsh prompt theme engine
        zinit   # zsh plugin manager
    ];

}