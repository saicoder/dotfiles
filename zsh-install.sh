# ZSH INSTALATION FILE
SDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

touch $HOME/.zshrc #ENSURE THAT FILE EXISTS

# APPEND CONFIG
grep "dotfiles/zsh/zsh-init.sh" $HOME/.zshrc || \
printf "\n#LOAD SAI ZSH CONFIG \nsource \$HOME/.dotfiles/zsh/zsh-init.sh\n" >> $HOME/.zshrc

echo "File sourced"

read -p "Set zsh as your default prompt [y/N]? " -n 1 -r
echo
    
if [[ $REPLY =~ ^[Yy]$ ]]
then
    chsh -s $(which zsh) && echo "Installed successfully!!!"
fi
