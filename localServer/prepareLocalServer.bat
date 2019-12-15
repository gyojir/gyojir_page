@REM https://qiita.com/cd01/items/82829ba0ec0f59e1b04d
@powershell -NoProfile -ExecutionPolicy Unrestricted  "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 2})-join\"`n\");& Start-Process powershell -Verb runas -ArgumentList $s" %*&goto:eof

netsh interface portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectaddress=$(wsl --exec ip addr show eth0 | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1)

wsl --exec sudo service docker start
wsl --exec sudo sysctl -w vm.max_map_count=262144

Read-Host "OK"