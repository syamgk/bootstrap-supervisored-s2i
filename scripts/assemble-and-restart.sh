#!/bin/bash

set -e

# s2i fails when /tmp/src/ is empty
mkdir -p /tmp/src
touch /tmp/src/.dummy

# run s2i assemble script from source directory if it has been overridden  there
if [ -f /opt/app-root/src/.s2i/bin/assemble ]; then
    /opt/app-root/src/.s2i/bin/assemble
else
    if [[ -z "${STI_SCRIPTS_PATH}" ]]; then
        exec ${STI_SCRIPTS_PATH}/assemble
    else
        exec assemble
    fi
fi

# restart run process
supervisorctl restart run
