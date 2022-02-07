sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update
sudo dnf install -y gparted gnome-tweak-tool neofetch screenfetch zsh git curl wget chsh bpytop htop dnf-plugins-core vlc openssl-devel readline-devel zlib-devel speedtest-cli
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
source ~/.zshrc
asdf update
source ~/.zshrc
asdf plugin-add ruby
asdf install ruby 2.6.3
asdf plugin-add nodejs
asdf install nodejs 16.13.2
asdf global asdf nodejs 16.13.2
sudo dnf remove -y fedora-chromium-config
mkdir temp
cd temp
wget -c https://github.com/lucasgrocha/dotfiles/blob/main/.zshrc
rm -rf ~/.zshrc
mv .zshrc ~/
cd ..
sudo nano /etc/default/grub
sudo grub2-mkconfig -o /etc/grub2-efi.cfg
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

wget -c https://github.com/lucasgrocha/dotfiles/blob/main/themes.zip
unzip themes.zip
mv themes ~/.themes

wget -c https://updates.tdesktop.com/tlinux/tsetup.3.5.1.tar.xz
tar -vxf tsetup.3.5.1.tar.xz
cd Telegram
./Telegram


