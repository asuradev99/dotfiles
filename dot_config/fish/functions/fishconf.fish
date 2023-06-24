# Defined in - @ line 1
function fishconf --wraps='code ~/.config/fish/fish.config' --wraps='code ~/.config/fish/config.fish' --description 'alias fishconf code ~/.config/fish/config.fish'
  code ~/.config/fish/config.fish $argv;
end

# Update dotfiles

