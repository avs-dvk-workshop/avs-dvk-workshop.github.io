#!/bin/sh
#
# This script is run once, to set up all that is necessary on top of a base Raspbian image, and to precompile the AVS sdk
#
# create directories
cd /home/pi/
mkdir sdk-folder

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
sudo apt-get -y install node npm
npm install aws-iot-device-sdk
npm install onoff

#portaudio
cd /home/pi/sdk-folder/third-party

wget -c http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz
tar zxf pa_stable_v190600_20161030.tgz

cd portaudio
./configure --without-jack

make

#json comment extractor
pip install commentjson

#grab sdk
cd /home/pi/sdk-folder/sdk-source
git clone --single-branch git://github.com/alexa/avs-device-sdk.git

#compile sdk
cd /home/pi/sdk-folder/sdk-build
cmake /home/pi/sdk-folder/sdk-source/avs-device-sdk \
-DSENSORY_KEY_WORD_DETECTOR=ON \
-DSENSORY_KEY_WORD_DETECTOR_LIB_PATH=/home/pi/sdk-folder/third-party/alexa-rpi/lib/libsnsr.a \
-DSENSORY_KEY_WORD_DETECTOR_INCLUDE_DIR=/home/pi/sdk-folder/third-party/alexa-rpi/include \
-DGSTREAMER_MEDIA_PLAYER=ON \
-DPORTAUDIO=ON \
-DPORTAUDIO_LIB_PATH=/home/pi/sdk-folder/third-party/portaudio/lib/.libs/libportaudio.a \
-DPORTAUDIO_INCLUDE_DIR=/home/pi/sdk-folder/third-party/portaudio/include

make SampleApp -j2
