#!/bin/bash
lipo -archs mpv.app/Contents/MacOS/mpv-bundle
for filename in mpv.app/Contents/MacOS/lib/*.dylib; do
	lipo -archs $filename
done
