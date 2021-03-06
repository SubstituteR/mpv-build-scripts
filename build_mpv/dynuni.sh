#!/bin/bash
echo Intel App: $1
echo ARM App: $2
lipo -create -output mpv.app/Contents/MacOS/mpv-bundle $1/Contents/MacOS/mpv $2/Contents/MacOS/mpv
for filename in $1/Contents/MacOS/lib/*.dylib; do
	#echo $filename
	other=$(basename $filename)
	intel=$1/Contents/MacOS/lib/$other
	arm=$2/Contents/MacOS/lib/$other
	#echo $filename "<--->" $2/Contents/MacOS/lib/$other
	lipo -create -output mpv.app/Contents/MacOS/lib/$other $intel $arm
done

