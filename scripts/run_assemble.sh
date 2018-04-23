#!/bin/bash

# s2i fails when /tmp/src/ is empty
touch /tmp/src/.dummy

# TODO: detect overwriding files in .s2i directory in application source
/usr/libexec/s2i/assemble