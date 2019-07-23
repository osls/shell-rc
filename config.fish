# ~/.config/fish/config.fish

# Generic
set fish_greeting (fortune)
set EDITOR nvim
set VISUAL nvim
# ---
set -x LANG zh_CN.UTF-8
set -x LANGUAGE $LANG
set -x LC_ALL $LANG
set -x LC_CTYPE $LANG
set -x LC_MESSAGES $LANG
# for Go:
### please be very careful which go you are using!!!
### curl -O https://storage.googleapis.com/golang/go-.-.linux-amd64.tar.gz
### tar -xvf go-.-.linux-amd64.tar.gz ; sudo mv go /usr/local
#set -x PATH /usr/local/go/bin $PATH
### sudo apt install golang-1.8
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH /usr/lib/go-1.10/bin $PATH
set -x PATH $PATH $GOBIN
# for Spark:
#set -x SPARK_HOME /opt/spark
#set -x SPARK_BIN $SPARK_HOME/bin
#set -x PATH $PATH $SPARK_BIN
#set -x PYSPARK_PYTHON python3
#set -x PYSPARK_DRIVER_PYTHON ipython
##set -x PYSPARK_DRIVER_PYTHON_OPTS "notebook"
# Misc.
set -gx PATH $HOME/anaconda3/bin $PATH
#set -gx PATH $HOME/tensorflow/bin $PATH
#set -gx PATH /opt/android-studio/bin $PATH
#set -gx NVIM_LISTEN_ADDRESS /tmp/neovim/neovim
# ---
set -x FISH_PATH $HOME/.config/fish
set -x PATH /usr/local/sbin $PATH
set -U fish_user_paths $fish_user_paths $GOBIN
# use 256 color term
if begin; status --is-interactive; end
    set -gx TERM xterm-256color
end

# Aliases
#alias -='cd -'
alias ,='cd ..'
alias ,,='cd ../..'
alias ,,,='cd ../../..'
alias ,,,,='cd ../../../..'
alias ,,,,,='cd ../../../../..'
#alias -='cd -'
alias ed='emacs -nw'
alias ex='emacs'
alias vv='nvim'
alias pp='pip install -i https://pypi.tuna.tsinghua.edu.cn/simple '
alias py='ipython3'
alias pyss='python -m SimpleHTTPServer'
alias pipu='sudo pip install --upgrade'
alias jps='jupyter notebook --no-browser --port=9999' # server
alias jpc='ssh -N -f -L localhost:8888:localhost:9999 mw@10.110.1.xx' # fill real info here!!!
# run jps on the sever, and copy the URL the sever given
# run jpc on the client, enter the server psw nowhere
# paste the server URL into a client web browser, change 9999 to 8888, and visit the new URL page
alias jpcvt='jupyter nbconvert --to'
alias mm='tmux -2 attach'
alias sskg='ssh-keygen'
# use sskg to generate id_rsa&id_ras.pub, and copy .pub to ~/.ssh/authorized_keys on server.
alias mc="pandoc -f markdown+lhs slides.md -o slides.html -t dzslides -i -s -S --toc"
alias uu="sudo apt-get update -y; sudo apt-get upgrade -y; sudo apt-get autoremove --purge -y; sudo cp -f /home/mw/.emacs.d/emacs.desktop /usr/share/applications/"

# Function
function lc
  ls -ah --color=always $argv | less -R
end

function vi
    if command --search nvim >/dev/null do
        nvim  $argv[1..-1]
    else
        vim $argv[1..-1]
    end
end

function vd
    if command --search nvim >/dev/null do
        nvim -d $argv[1..-1]
    else
        vimdiff $argv[1..-1]
    end
end

function tp
  echo "::latex $argv.tex; dvipdfmx $argv.dvi"
  latex $argv.tex; dvipdfmx $argv.dvi
end

# Local configuration
if test -r ~/.config/fish/local.fish
  . "~/.config/fish/local.fish"
end
