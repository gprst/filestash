#/bin/bash
set -e

ARCH=$(dpkg --print-architecture)
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$(dirname "$0")"/deps

if [ $ARCH = "amd64" ]; then
    # AMD64 dependencies
    curl -s https://downloads.filestash.app/upload/libresize_Linux-x86_64.a > libresize_linux_amd64.a &
    curl -s https://downloads.filestash.app/upload/libtranscode_Linux-x86_64.a > libtranscode_linux_amd64.a &
elif [ $ARCH = "armhf" ]; then 
    # ARM dependencies
    curl -s https://downloads.filestash.app/upload/libresize_Linux-armv7l.a > libresize_linux_arm.a &
    curl -s https://downloads.filestash.app/upload/libtranscode_Linux-armv7l.a > libtranscode_linux_arm.a &
elif [ $ARCH = "arm64" ]; then
    # ARM64 dependencies build
    sh create_libresize.sh
    sh create_libtranscode.sh
fi

wait
