{ inputs, pkgs, config, ... }: {
  imports = [
    ../../modules/darwin/system.nix
    ../../modules/darwin/homebrew.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.primaryUser = "nevera";
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 5;

  # macOS-only system packages (not shared via home-manager)
  environment.systemPackages = with pkgs; [
    mkalias
    gnupg
    pinentry-tty
    pinentry_mac
    pass
  ];

  # Declarative homebrew taps from nix-homebrew
  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "nevera";
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
    };
    mutableTaps = false;
  };

  # Home Manager (shared modules applied to the primary user)
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.nevera = {
      imports = [
        ../../modules/home/packages.nix
        ../../modules/home/dev.nix
      ];
      home.stateVersion = "24.11";
    };
  };
}
