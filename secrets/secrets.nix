let
  shtirlitz = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILD7MLVPkz7GFurQGXAB9zPDUYWXbvM1LN7fA3Sv6e3g root@shtirlitz";
  hosts = [ shtirlitz ];
in
{
  "wg-shtirlitz.age".publicKeys = hosts;
}
