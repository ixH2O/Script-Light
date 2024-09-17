USERNAME="root"
NEW_PASSWORD="123456"


echo "Changing Root Password"
echo "$USERNAME:$NEW_PASSWORD" | sudo chpasswd
echo "Password for $USERNAME has been changed."
clear


echo "Installing Necessary Packages"
sudo apt update
sudo apt install -y xfce4 desktop-base xfce4-terminal tightvncserver wget
echo "--Packages Installed--"
clear


echo "Installing Desktop Environment"
export DEBIAN_FRONTEND=noninteractive
sudo apt install --assume-yes xfce4 desktop-base xfce4-terminal
echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" | sudo tee /etc/chrome-remote-desktop-session
sudo apt remove --assume-yes gnome-terminal
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
echo "--Desktop Environment Installed--"
clear


echo "Installing Playit"
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt update
sudo apt install playit -y
echo "--Playit Installed--"
clear


echo "Installing Nomachine"
wget https://download.nomachine.com/download/8.13/Linux/nomachine_8.13.1_1_amd64.deb
sudo dpkg -i nomachine_8.13.1_1_amd64.deb
echo "--Nomachine Installed--"
clear
