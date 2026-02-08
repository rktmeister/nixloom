{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # editors
    neovim
    helix
    vim

    # shell tools
    fzf
    zoxide
    eza
    bat
    fd
    ripgrep
    jq
    yq-go

    # terminal
    kitty
    tmux
    btop

    # git
    git
    git-lfs
    gh
    lazygit
    delta

    # file management
    stow

    # prompt
    oh-my-posh

    # misc
    curl
    wget
    tree
    unzip
    duf
    dust
    just
    jujutsu
    kanata
    ast-grep
  ];
}
