#!/bin/bash

if [ -f "third_party/hsluv-glsl/hsluv-glsl.fsh" ];then
    kpackagetool6 -t Plasma/Applet --install plasmoid
    kpackagetool6 -t Plasma/Applet --upgrade plasmoid
else
    echo "Cannot find third party files."
fi
