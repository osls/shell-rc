# shell-rc

This is `Wang`'s very personal configurations for various shells.

## To install it:
``` sh
git clone https://github.com/osls/shell-rc
#
mv ~/.tmux.conf ~/.tmux.conf.backup
cp ./shell-rc/_tmux.conf ~/.tmux.conf
# ---
mv ~/.ssh ~/.ssh.backup
mkdir -p ~/.ssh
cp ./shell-rc/config.ssh ~/.ssh/config
# ---
cp ./shell-rc/config.fish $XDG_CONFIG_HOME/fish/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc .zshrc.omzs
cp ./shell-rc/_zshrc ~/.zshrc
```
