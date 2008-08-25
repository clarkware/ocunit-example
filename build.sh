#!/bin/sh

xcodebuild -alltargets clean
xcodebuild -target Test -buildstyle Development build
