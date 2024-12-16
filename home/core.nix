{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    jq # JSON processor
    yq # yaml processer
    kubectl # kubernetes
    kubectx # kubernetes context

    # misc
    delta
    curl
    cowsay
    httpie
    htop
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    caddy
    gnupg
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}