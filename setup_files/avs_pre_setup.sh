#!/bin/sh
#
# This script is run once, to set up all that is necessary on top of a base Raspbian image, and to precompile the AVS sdk
#
# For some microphones, gain should be maxed out with "alsamixer"
#
# IMPORTANT for Raspbian Stretch
# ------------------------------
# Add "audio_pwm_mode=1" in "/boot/config.txt" (after "dtparam=audio=on" line)
# 

# create directories
cd /home/pi
mkdir sdk-folder
mkdir iot

cd sdk-folder
mkdir sdk-build sdk-source third-party application-necessities

cd application-necessities
mkdir sound-files

#update repos
sudo apt-get update

#install dependencies for avs
sudo apt-get -y install \
git gcc cmake build-essential libsqlite3-dev libcurl4-openssl-dev libfaad-dev \
libsoup2.4-dev libgcrypt20-dev libgstreamer-plugins-bad1.0-dev \
gstreamer1.0-plugins-good libasound2-dev doxygen libssl-dev

#install dependencies for AWS IoT
sudo apt-get -y install nodejs npm
cd /home/pi/iot
wget https://avs-dvk-workshop.github.io/setup_files/root-ca.pem.crt
npm install aws-iot-device-sdk
npm install onoff

#portaudio
cd /home/pi/sdk-folder/third-party

wget -c http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz
tar zxf pa_stable_v190600_20161030.tgz

cd portaudio
./configure --without-jack --without-oss

make

#json comment extractor
pip install commentjson

#grab sdk
cd /home/pi/sdk-folder/sdk-source
git clone --single-branch git://github.com/alexa/avs-device-sdk.git

#grab install and run scripts
cd /home/pi
wget https://avs-dvk-workshop.github.io/setup_files/avs_install.sh
wget https://avs-dvk-workshop.github.io/setup_files/avs_run.sh
chmod u+x avs_install.sh avs_run.sh
