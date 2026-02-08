{ pkgs, ... }: {
  system.defaults = {
    dock.autohide = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    roboto-slab
  ];
}
