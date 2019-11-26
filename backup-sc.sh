#!/bin/bash
#tar -cvf scbackup.tar web.config App_ClientConfig App_Data App_Extensions App_WebResources
name=scbackup$(date '+%Y-%m-%d')
docker stop screenconnect
tar -zcvf "$name.tar.gz" web.config App_ClientConfig App_Data App_Extensions App_WebResources
docker start screenconnect
