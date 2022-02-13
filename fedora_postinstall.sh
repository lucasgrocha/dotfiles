# sudo su
# echo "fastestmirror=true" >> /etc/dnf/dnf.conf
# exit

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update -y
sudo dnf install -y gparted gnome-tweak-tool neofetch screenfetch zsh git curl wget bpytop htop dnf-plugins-core vlc flatpak openssl-devel readline-devel zlib-devel speedtest-cli util-linux-user

rm -rf ~/.zshrc
mv zshrc ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/lucasgrocha/dotfiles.git

cd dotfiles/gnome
tar -xvf Bibata-Modern.tar.gz
tar -xvf Tela-blue.tar.xz
tar -xvf 01-Flat-Remix-GTK-Blue_20220119.tar.xz

mkdir ~/.icons
mv $(find . -maxdepth 1 -type d | grep -E 'Bibata|Tela') ~/.icons

mkdir ~/.themes
mv $(find . -maxdepth 1 -type d | grep -E 'Flat') ~/.themes
cd ..

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

source ~/.bashrc
asdf update
asdf plugin-add ruby
asdf intall ruby 2.7.4
asdf global ruby 2.7.4

asdf plugin-add nodejs
asdf install nodejs 16.13.2
asdf global asdf nodejs 16.13.2

sudo dnf remove -y fedora-chromium-config

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y --noninteractive flathub com.spotify.Client
flatpak run com.spotify.Client


# sudo nano /etc/default/grub
# sudo grub2-mkconfig -o /etc/grub2-efi.cfg
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg


# wget -c https://updates.tdesktop.com/tlinux/tsetup.3.5.1.tar.xz
# tar -vxf tsetup.3.5.1.tar.xz
# cd Telegram
# ./Telegram

chsh -s $(which zsh)
