#!/bin/bash

set -e

# s2i fails when /tmp/src/ is empty
mkdir -p /tmp/src
touch /tmp/src/.dummy

# run s2i assemble script from source directory if it has been overridden  there
if [ -f /opt/app-root/src/.s2i/bin/assemble ]; then
    /opt/app-root/src/.s2i/bin/assemble
else
    /usr/libexec/s2i/assemble
fi

# restart run process
supervisorctl restart run
