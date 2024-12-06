{ config, pkgs, ... }:

{
  # Home Manager 配置
  home = {
    username = "todd";
    homeDirectory = "/Users/todd";
    stateVersion = "24.11";

    packages = with pkgs; [
      nix-index
      postgresql rustup zls
      mihomo 
      mise
    ];
  };

  # 文件链接和配置
  home.file = {
    # ".config/some-config".source = ./dotfiles/some-config;
  };
}