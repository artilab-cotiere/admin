#!/bin/bash

# Deploy the artilab website to OVH. Make sure to set ARTILAB_PWD before running it

set +e
echo "lftp ends with a segfault, but apart from that all seems to work properly"

lftp <<EOF
set sftp:auto-confirm true
open -u artilabcpt,${ARTILAB_PWD} sftp://ftp.cluster021.hosting.ovh.net
ls www
mirror -v -e --exclude=.git -R ../www www
EOF
