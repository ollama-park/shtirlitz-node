{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./systempkgs.nix
    ./wg.nix
#    ./diskoteka.nix
  ];

  networking.hostName = "shtirlitz";

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false;
    };
  };

  programs.bash.shellInit = ''
    eval "$(keychain --eval --quiet ~/.ssh/shtirlitz)"
  '';

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [
        ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG/6GNBs/+NewQ6AK4igl7dZp8+HgCUzl++eIBV/3TGk terow-rist@nixos''
        ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDP+CjPP2R8NSbGNPbHXJmkgY/e0XdvSyLxypKtDE2sF root@rick''
      ];
    };
  };

  system.stateVersion = "25.05"; #change it!
}
