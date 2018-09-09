docker build -t empathicqubit/android-studio .
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run \ 
    --privileged \
    -it \
    -v /dev/bus/usb:/dev/bus/usb \
    -v /run/user/$(id -u)/pulse:/run/user/1000/pulse \
    -v /dev/kvm:/dev/kvm \
    -v $PWD/archie:/home/archie \
    -v $XSOCK:$XSOCK \
    -v $XAUTH:$XAUTH \
    -e XAUTHORITY=$XAUTH \
    -e DISPLAY=$DISPLAY \
    empathicqubit/android-studio
