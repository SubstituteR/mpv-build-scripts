#!/bin/bash
#export PATH=/usr/local:/usr/local/bin:$PATH

./waf clean
CFLAGS="-mmacosx-version-min=11 -target arm64-apple-macos11" ./waf configure --disable-debug-build --swift-flags="-target arm64-apple-macos11"
./waf
