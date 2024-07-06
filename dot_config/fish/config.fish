#aliases
alias pac "sudo pacman"
alias fishconf "nvim ~/.config/fish/config.fish"
alias ls "exa"
alias vim "nvim"
alias neo "neovide --multigrid"
alias nvim-config "cd ~/.config/nvim/lua/user"
#alias cat bat
#alias ovito "QT_QPA_PLATFORM=xcb ~/Apps/ovito-basic-3.9.2-x86_64/bin/ovito"
alias headphones "bluetoothctl connect AC:80:0A:42:22:E0"

# custom ENV variables
set -x REMOTE 'esuresh@txe1-login.mit.edu:/home/gridsan/esuresh'
alias get-data 'scp "$REMOTE/mdurop/mclammps/dumps/*" .'
