SDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Script dir: $SDIR, Home: $HOME"

unlink $HOME/.vimrc
unlink $HOME/.vim

ln -s $SDIR/.vimrc    $HOME/.vimrc && echo "rc file linked"
ln -s $SDIR/.vim 	  $HOME/.vim   && echo "plugin dir linked"
