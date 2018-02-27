#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mohammad/Documents/CMU/RED/catkin_ws/src/rqt_safeguard"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mohammad/Documents/CMU/RED/catkin_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mohammad/Documents/CMU/RED/catkin_ws/install/lib/python2.7/dist-packages:/home/mohammad/Documents/CMU/RED/catkin_ws/build/rqt_safeguard/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mohammad/Documents/CMU/RED/catkin_ws/build/rqt_safeguard" \
    "/usr/bin/python" \
    "/home/mohammad/Documents/CMU/RED/catkin_ws/src/rqt_safeguard/setup.py" \
    build --build-base "/home/mohammad/Documents/CMU/RED/catkin_ws/build/rqt_safeguard" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/mohammad/Documents/CMU/RED/catkin_ws/install" --install-scripts="/home/mohammad/Documents/CMU/RED/catkin_ws/install/bin"
