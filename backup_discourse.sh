#!/bin/bash

# Backup script for the discourse forum
# Don't forget to set FTP_PWD before calling the script
# Use in a crontab like this: @weekly cd /var/discourse_artilab; FTP_PWD='XXX' ./backup_discourse.sh

set +e

lftp <<EOF
set sftp:auto-confirm true
open -u sd-118654,${FTP_PWD} ftp://dedibackup-dc3.online.net
ls discourse_backups
mirror -v -e -R /var/discourse_artilab/shared/standalone/backups/default discourse_backups
EOF
