{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # editors
    neovim
    helix
    vim
    emacs
    emacsPackages.magit

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
    difftastic
    mergiraf

    # file management
    stow

    # prompt
    oh-my-posh

    # python
    uv

    # networking
    cloudflared

    # misc
    curl
    wget
    tree
    unzip
    duf
    dust
    just
    jujutsu
    lazyjj
    kanata
    ast-grep
  ];
}
