{pkgs, ...}: {
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
      autoUpdate = true;
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    brews = [
      "vim"
      "lazydocker"
      "lazygit"
      "gh"
      "go"
      "python3"
      "rust"

      # software
      "openjdk@23"
      "openjdk@21"
      "openjdk@17"
      "openjdk@11"
      "jenv"
    ];

    # `brew install --cask`
    casks = [
      # productive
      "1password"
      "1password-cli"
      "bruno"
      "raycast"

      # browsers
      "arc"
      # "firefox"
      # "google-chrome"
      # "zen-browser"

      # IDE
      "jetbrains-toolbox"
      "visual-studio-code"

      # communiction
      # "slack"
      # "zoom"

      # other
      # "font-jetbrains-mono"
    ];
  };
}
