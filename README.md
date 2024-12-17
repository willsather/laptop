# MacOS Laptop Configuration

This project provides a minimal setup for managing macOS configurations using Nix and Nix-Darwin. 
All you need to do is set your `hostname`, `username`, and `system` in the provided configuration, 
then execute a single command to apply the configuration.

## Prerequisites

1. Install Dependencies
   ```bash
   xcode-select --install
   ```

2. Install [Nix](https://nixos.org/download.html).

    ```
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    ```

    To enable them, add the following to your `/etc/nix/nix.conf`:
    ```
    experimental-features = nix-command flakes
    ```

## Getting Started

1. Clone this repository in `~/.config`:
   ```bash
   git clone git@github.com:willsather/laptop.git
   cd laptop
   ```

2. Update the configuration with your details:

   Open `flake.nix` and set:
    - `hostname`: Your machine's hostname.
    - `username`: Your macOS username.
    - `system`: Your system architecture (e.g., `x86_64-darwin` or `aarch64-darwin`).

   Example:
   ```
    username = "satherw"; # FIXME: update to username
    system = "aarch64-darwin"; # FIXME: set system architecture as aarch64-darwin or x86_64-darwin
    hostname = "JXDJLQC9C2"; # FIXME: update to machine hostname
   ```

3. Apply the configuration:
   ```bash
   nix run nix-darwin -- switch --flake .
   ```

   This will:
    - Install Nix-Darwin if not already installed.
    - Apply the configurations defined in the flake.


## Troubleshooting

- Ensure you have the correct permissions for system-level changes.
- If you encounter issues with `nix run`, try updating your Nix installation:
  ```bash
  nix upgrade-nix
  ```

## Resources

- [Nix](https://nixos.org/)
- [Nix-Darwin](https://github.com/LnL7/nix-darwin)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
