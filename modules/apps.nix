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
    bruno
    lazydocker
    lazygit
    gh
    go
    python3
    rustc
    rustup
    jetbrains-mono
    slack
  ];

  # FIXME: To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    brews = [
    ];

    # `brew install --cask`
    # FIXME: uninstall and reinstall these apps with brew
    casks = [
#       "1password"
       "1password-cli"
#       "google-chrome"
#       "slack"
       "jetbrains-toolbox"
       "visual-studio-code"
#       "font-jetbrains-mono"
#       "zoom"
    ];
  };
}