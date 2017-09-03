@powershell set-executionpolicy unrestricted
schtasks /create /tn update-hosts /sc daily /ru "NT Authority\System" /tr %SystemRoot%\System32\drivers\etc\update-hosts.ps1

#update-hosts.ps1
echo mkdir %TEMP%\hosts > %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo $client = new-object System.Net.WebClient >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
rem echo $client.DownloadFile('https://github.com/googlehosts/hosts/raw/master/hosts-files/hosts') >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
rem echo $client.DownloadFile('https://github.com/vokins/yhosts/raw/master/hosts') >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo $client.DownloadFile('https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts') >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo $client.DownloadFile('https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts-ad') >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo cat %TEMP%\hosts\* ^> %SystemRoot%\System32\drivers\etc\hosts >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo rm -recurse %TEMP%\hosts >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1

echo updating hosts
powershell %SystemRoot%\System32\drivers\etc\update-hosts.ps1
ipconfig /flushdns
echo 'done'
