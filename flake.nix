{
  description = "Will Sather MacOS Nix System flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages =
        [ 
          pkgs.vim
          pkgs.lazydocker # Docker TUI
          pkgs.lazygit # Git TUI
          pkgs.pyenv # Python version manager
          pkgs.gh # GitHub CLI
          pkgs.go # Go programming language
          pkgs.kubectl # Kubernetes CLI
          pkgs.kubectx # Kubernetes context switcher
          pkgs.delta # Terminal git diff viewer with syntax highlighting
          pkgs.curl # Command line tool for transferring data with URL syntax
          pkgs.jq # Command line JSON processor
          pkgs.yq # Command line YAML processor
          pkgs.vscode # Visual Studio Code
          pkgs.neovim # Vim-fork focused on extensibility and usability
          pkgs.k9s # Kubernetes CLI to manage your clusters in styles
          pkgs.python3 # Python 3 programming language
          pkgs.rustc # Rust programming language
          pkgs.rustup # Rust toolchain installer
          pkgs.lorri # Nix shell manager
          pkgs.htop # Interactive process viewer
          pkgs.httpie # Interactive process viewer
          pkgs.tree # Display directories as trees
          pkgs.jetbrains-mono # JetBrains Mono font
        ];

      # allowUnfree is required to install some packages that are not "free" software.
      nixpkgs.config.allowUnfree = true;

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Enable sudo authentication using fingerprint biometrics
      security.pam.enableSudoTouchIdAuth = true;

      # Used for backwards compatibility, please read the changelog before changing.
      system.stateVersion = 4;

      system.defaults = {
        dock.mru-spaces = false; # Most Recently Used spaces.
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "icnv"; # icon view. Other options are: Nlsv (list), clmv (column), Flwv (cover flow)
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10; # in seconds

        dock.persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Google Chrome.app"
          "/Applications/Slack.app"
          "/Applications/IntelliJ IDEA Ultimate.app"
          "/Applications/iTerm.app"
          "/System/Applications/System Settings.app"
        ];

        # keyboard repeat
        NSGlobalDomain = {
          KeyRepeat = 1;
          InitialKeyRepeat = 15;
      };
    };

    nixpkgs.hostPlatform = "aarch64-darwin";

    nix.extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

  };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."JXDJLQC9C2" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."JXDJLQC9C2".pkgs;
  };
}