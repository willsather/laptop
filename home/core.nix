{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip # zip archiver
    xz # compression tool
    unzip # zip extractor
    p7zip # 7z archiver

    # utils
    jq # json processor
    yq # yaml processer
    kubectl # kubernetes
    kubectx # kubernetes context

    # software
    nodejs
    pnpm

    # nix
    alejandra # formatter

    # misc
    delta # git diff viewer
    curl # data transfer tool
    cowsay # text art generator
    httpie # http client tool
    htop # process monitor
    file # file type detector
    which # command locator
    tree # directory tree viewer
    gnused # stream editor
    gnutar # archive utility
    gawk # text processing tool
    zstd # compression tool
    caddy # web server
    gnupg # encryption tool
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
