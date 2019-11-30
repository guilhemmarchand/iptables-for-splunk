#!/usr/bin/env bash
# set -x

PWD=`pwd`
app="iptables"
version=`grep 'version =' iptables/default/app.conf | awk '{print $3}' | sed 's/\.//g'`

tar -czf ${app}_${version}.tgz --exclude=iptables/local --exclude=iptables/metadata/local.meta --exclude=iptables/lookups/lookup_file_backups iptables
echo "Wrote: ${app}_${version}.tgz"

exit 0
