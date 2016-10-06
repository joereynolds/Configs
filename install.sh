#!/bin/bash

#Install script for a sane distro (xubuntu, lubuntu, mint etc...)
packages=(
    cmake
    curl
    exuberant-ctags
    npm
    python-dev
    rake
    vim-gnome
    php-cs-fixer
    phpmd
    silversearch-ag
)

npmPackages=(
    jsonlint
)

sudo rm -rf /usr/local/bin/vim #Remove crap vim and later link it to a good one
for package in ${packages[*]}; do
    echo "Installing" ${package}
    sudo apt-get install -qq ${package}
done

for package in ${npmPackages[*]}; do
    echo "Installing" ${package}
    npm install ${package} -g
done
ln -s /usr/bin/vim.gnome /usr/local/bin/vim


echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Git configuration"
git config --global user.email "joereynolds952@gmail.com"
git config --global user.name "Joe Reynolds"

mkdir -p ~/programs && cd ~/programs
git clone https://github.com/joereynolds/fanbox
git clone https://github.com/joereynolds/life
git clone https://github.com/joereynolds/programming-dump
git clone https://github.com/joereynolds/util.joereynoldsaudio

#Use a loop instead of this grossness
rm ~/.vimrc
ln -s ~/programs/configs/vim/.vimrc ~/.vimrc

rm ~/.ctags
ln -s ~/programs/configs/ctags/.ctags ~/.ctags

rm ~/.bashrc
ln -s ~/programs/configs/bash/.bashrc ~/.bashrc

rm ~/.git-prompt.sh
ln -s ~/programs/configs/git/.git-prompt.sh ~/.git-prompt.sh

rm ~/.jshintrc
ln -s ~/programs/configs/jshint/.jshintrc ~/.jshintrc

rm -rf ~/.vim/UltiSnips
ln -s ~/programs/configs/vim/UltiSnips ~/.vim/UltiSnips
