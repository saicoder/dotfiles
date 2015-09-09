SDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Script dir: $SDIR, Home: $HOME"

if [[ -L "$HOME/.vim" && -L "$HOME/.vimrc" ]]
then
    echo "Unlinking vim files"
    unlink $HOME/.vimrc
    unlink $HOME/.vim
fi

ln -s $SDIR/.vimrc    $HOME/.vimrc && echo "rc file linked"
ln -s $SDIR/.vim 	  $HOME/.vim   && echo "plugin dir linked"
