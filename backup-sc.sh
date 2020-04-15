#!/bin/bash
#tar -cvf scbackup.tar web.config App_ClientConfig App_Data App_Extensions App_WebResources
name=~/scbackup_$(date '+%Y-%m-%d')
cd /var/lib/docker/volumes/screenconnect_vol/_data/
docker stop screenconnect
tar -zcvf "$name.tar.gz" web.config App_ClientConfig App_Data App_Extensions App_WebResources App_Themes
docker start screenconnect
ls -1 /root/scbackup_* | sort -r | tail -n +6 | xargs rm > /dev/null 2>&1
