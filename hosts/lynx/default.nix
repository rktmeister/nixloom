{ pkgs, ... }: {
  imports = [
    ../../modules/home/packages.nix
    ../../modules/home/dev.nix
    ../../modules/home/kanata.nix
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";
  home.stateVersion = "24.11";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
    persistent = true;
  };

  # Let home-manager manage itself on standalone installs
  programs.home-manager.enable = true;
}
