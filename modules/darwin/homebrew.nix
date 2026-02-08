{ ... }: {
  homebrew = {
    enable = true;

    brews = [
      "mas"
      "fzf"
      "pixi"
      "cloudflared"
      "docker-credential-helper"
      "mysql"
      "llvm"
      "ninja"
      "coreutils"
      "readline"
      "xz"
      "zlib"
    ];

    casks = [
      "iina"
      "git-credential-manager"
      "mactex"
    ];

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
