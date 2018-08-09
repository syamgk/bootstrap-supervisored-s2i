#!/bin/bash

set -e

# run s2i run script from source directory if it has been overridden  there
if [ -f /opt/app-root/src/.s2i/bin/run ]; then
    exec /opt/app-root/src/.s2i/bin/run
else
    if [[ -z "${STI_SCRIPTS_PATH}" ]]; then
        exec ${STI_SCRIPTS_PATH}/run
    else
        exec run
    fi
fi