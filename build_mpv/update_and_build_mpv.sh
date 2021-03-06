#!/bin/bash
cd ~/mpv
git pull
./build_intel.sh
./TOOLS/osxbundle.py build/mpv
cd ~/build_mpv
mkdir combine
mv ~/mpv/build/mpv.app combine/mpv_intel.app
cd ~/mpv
./build_arm.sh
./TOOLS/osxbundle.py build/mpv
cd ~/build_mpv
mv ~/mpv/build/mpv.app combine/mpv_arm.app
cp -R combine/mpv_arm.app mpv.app
rm -rf mpv.app/Contents/MacOS/*
mkdir mpv.app/Contents/MacOS/lib
./dynuni.sh combine/mpv_intel.app combine/mpv_arm.app
rm -rf combine
cp mpv mpv.app/Contents/MacOS/
cp youtube-dl mpv.app/Contents/Resources/
codesign --deep -f -s - mpv.app
