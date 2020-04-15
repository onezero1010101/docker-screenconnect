screenconnectPath="/opt/screenconnect"

unset IFS
export PATH="$screenconnectPath/App_Runtime/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export MONO_PATH="$screenconnectPath/App_Runtime/lib"
export MONO_CFG_DIR="$screenconnectPath/App_Runtime/etc"
export XDG_CONFIG_HOME="$screenconnectPath/App_Runtime/etc"
export MONO_XMLSERIALIZER_THS=no
export MONO_ASPNET_WEBCONFIG_CACHESIZE=50000
export MONO_MANAGED_WATCHER=true

#added to allow needed
#sysctl fs.inotify.max_user_instances=100000
export DOTNET_USE_POLLING_FILE_WATCHER=true

mono "$screenconnectPath/Bin/ScreenConnect.Service.exe" startservices 7 12345 10
