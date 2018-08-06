PWD_DIR=$(pwd)
echo "***************************************"
echo "*****       for AR Toolkit        *****"
echo "***************************************"
echo "***** apt install libv4l-dev *****"
apt install -y libv4l-dev
echo "***** cd /usr/include/linux *****"
cd /usr/include/linux
echo "***** ln -s ../libv4l1-videodev.h videodev.h *****"
ln -s ../libv4l1-videodev.h videodev.h
echo "***** wget https://github.com/MoriKen254/ARToolKit_Release/raw/master/ARToolKit_2.72.1_Ubuntu_amd64.deb *****"
wget https://github.com/MoriKen254/ARToolKit_Release/raw/master/ARToolKit_2.72.1_Ubuntu_amd64.deb
yes|dpkg -i ARToolKit_2.72.1_Ubuntu_amd64.deb
cd ${PWD_DIR}
