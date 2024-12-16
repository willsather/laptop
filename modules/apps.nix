{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    vim
    lazydocker
    lazygit
    pyenv
    gh
    go
    vscode
    k9s
    python3
    rustc
    rustup
    lorri
    jetbrains-mono
    slack
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  # TODO: Uncomment and start fully using homebrew eventually
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
#  homebrew = {
#    enable = true;
#
#    onActivation = {
#      autoUpdate = false;
#    };
#
#    taps = [
#      "homebrew/services"
#    ];
#
#    # `brew install`
#    brews = [
#      "vim"
#      "lazydocker"
#      "lazygit"
#      "pyenv"
#      "git"
#      "gh"
#      "go"
#      "kubectl"
#      "kubectx"
#      "delta"
#      "curl"
#      "jq"
#      "yq"
#      "k9s"
#      "python3"
#      "rust"
#      "htop"
#      "httpie"
#      "tree"
#    ];
#
#    # `brew install --cask`
#    casks = [
#       "1password"
#       "1password-cli"
#       "google-chrome"
#       "slack"
#       "visual-studio-code"
#       "font-jetbrains-mono"
#       "zoom"
#    ];
#  };
}