##################################################
# Filename: install.sh
# Description: a script for instaling rnnlib on ubuntu14.04
# Author: ChrisZZ
# E-mail: zchrissirhcz@163.com
# Created Time: 2015年08月14日 星期五 21时20分41秒
##################################################
#!/bin/bash

#change directory to your workspace
cd $HOME
mkdir -p workspace
cd workspace

#config gcc with version 4.4
sudo apt-get install -y vim git
sudo apt-get install -y gcc
sudo apt-get install -y g++
sudo apt-get install -y gcc-4.4
sudo apt-get install -y g++-4.4
sudo update-alternatives --install/usr/bin/gcc gcc/usr/bin/gcc-4.4 50
sudo update-alternatives --install/usr/bin/g++ g++/usr/bin/g++-4.4 50

#get the source code of netcdf-c and netcdf-c++, then compile and install them with specified parameters.
wget 218.244.143.208/rnnlib/install_rnnlib/netcdf-4.3.3.1.tar.gz
wget 218.244.143.208/rnnlib/install_rnnlib/netcdf-cxx4-4.2.1.tar.gz
tar -zxvf netcdf-4.3.3.1.tar.gz
tar -zxvf netcdf-cxx4-4.2.1.tar.gz
cd netcdf-4.3.3.1
./configure --disable-dap --disable-netcdf-4
make
sudo make install
cd ..
cd netcdf-cxx4-4.2.1
CPPFLAGS=-I/home/`whoami`/workspace/netcdf-4.3.3.1/include ./configure
CPPFLAGS=-I/home/`whoami`/workspace/netcdf-4.3.3.1/include LDFLAGS=-L/usr/local/netcdf/lib make
sudo make install
cd ..

#get rnnlib and boost1.46 source code. compile rnnlib with specified boost source directory
wget 218.244.143.208/rnnlib/install_rnnlib/boost_1_46_0.tar.gz
wget 218.244.143.208/rnnlib/install_rnnlib/rnnlib.tar.gz
tar -zxvf boost_1_46_0.tar.gz
tar -zxvf rnnlib.tar.gz
cd rnnlib_source_forge_version

sudo apt-get install -y python-netcdf
sudo apt-get install -y libnetcdf-dev
sudo apt-get install -y automake
sudo apt install libnetcdf-dev libnetcdf-cxx-legacy-dev

sed -i '344 s/size/difference/' src/Helpers.hpp
CXXFLAGS=-I/home/`whoami`/workspace/boost_1_46_0 ./configure
make
sudo make install

#cp necessary helper file to example directory
cp utils/netcdf_helpers.py examples/arabic_offline_handwriting
cp utils/netcdf_helpers.py examples/arabic_online_handwriting
cp utils/netcdf_helpers.py examples/farsi_offline_handwriting
