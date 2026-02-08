{ pkgs, ... }: {
  home.packages = with pkgs; [
    # languages
    go
    deno
    bun
    nodejs

    # node package managers
    pnpm

    # rust via fenix (overlay applied in flake.nix)
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer

    # build tools
    gnumake
    cmake
    tilt
    kubernetes-helm
    kind
    kubectl
    ngrok
  ];
}
