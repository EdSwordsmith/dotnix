{ pkgs, profiles, configDir, ... }:
let
  installedPackages = with pkgs; [
    helvum
    evince
    (unstable.discord.override { withOpenASAR = true; })
    firefox
    vlc
    spotify
    zoom-us
    calibre
    unstable.thunderbird
    neofetch
    pavucontrol
    feh
    alacritty
    dogdns
    qalculate-gtk
    joshuto
    transmission-gtk
    transmission-remote-gtk
    git-ignore
    jellyfin-media-player
    sonixd
    slack
    tldr
    showmethekey
    brave
    htop
    jetbrains.idea-ultimate
    (lutris.override { extraLibraries = pkgs: [ ]; })
    wineWowPackages.waylandFull
    winetricks
    waypipe
    wl-clipboard
  ];
in
{

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit configDir;
    };
  };

  home-manager.users."vasco" = { pkgs, configDir, ... }: {
    imports = with profiles.home.users.vasco; [
      streaming
      ssh
      fzf
      foot
      kitty
      gtk
      zsh
      neovim
      git
      tmux
      firefox
      direnv
    ];
    home = {
      username = "vasco";
      homeDirectory = "/home/vasco";
      stateVersion = "22.05";
    };
    programs.home-manager.enable = true;
    home.packages = installedPackages;
    home.file.".ideavimrc" = {
      enable = true;
      text = builtins.readFile "${configDir}/nvim/init.vim";
    };
  };
} 
