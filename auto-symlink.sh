#/bin/bash

REPO=$PWD
echo "Repo: $REPO"

symlink_list="\
    $REPO/bash/bashrc_ext;$HOME/.bashrc_ext \
    $REPO/tmux/tmux.conf;$HOME/.tmux.conf \
    $REPO/vim/vimrc;$HOME/.vimrc \
    $REPO/vim/viminfo;$HOME/.viminfo \
"

for item in $symlink_list; do
    src=`echo ${item%%;*}`
    des=`echo ${item##*;}`
    if [ -f $des ]; then
        echo "REM: $des"
        rm -f "$des"
    fi
    ln -s "$src" "$des"
done

echo "DONE"
