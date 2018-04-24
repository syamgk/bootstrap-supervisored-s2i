#!/bin/bash

# run s2i run script from source directory if it has been overridden  there
if [ -f /opt/app-root/src/.s2i/bin/run ]; then
    exec /opt/app-root/src/.s2i/bin/run``
else
    exec /usr/libexec/s2i/run
fi