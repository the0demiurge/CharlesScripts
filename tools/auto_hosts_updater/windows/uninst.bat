@powershell set-executionpolicy default
schtasks /delete /tn Update-Hosts
del %SystemRoot%\System32\drivers\etc\update-hosts.ps1
del %SystemRoot%\System32\drivers\etc\hosts
ipconfig /flushdns