{
  imports = [ <sops-nix/modules/sops> ];
  sops.defaultSopsFile = ./secrets/codestats.yaml;
  sops.age.sshKeyPaths = [ "~/.ssh/ed25519" ];
  sops.secrets.codestats_key = {};
}
