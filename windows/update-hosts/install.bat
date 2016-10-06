@powershell set-executionpolicy unrestricted
copy ./update-hosts.ps1 %SystemRoot%\System32\drivers\etc\
schtasks /create /tn update-hosts /sc weekly /ru "NT Authority\System" /tr %SystemRoot%\System32\drivers\etc\update-hosts.ps1

#update-hosts.ps1
echo mkdir %TEMP%\hosts > %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo $client = new-object System.Net.WebClient >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo $client.DownloadFile('https://coding.net/u/Elaine_ni/p/hosts/git/raw/master/hosts.txt', '%TEMP%\hosts\hosts2') >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo $client.DownloadFile('https://raw.githubusercontent.com/racaljk/hosts/master/hosts', '%TEMP%\hosts\hosts3') >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo cat %TEMP%\hosts\* ^> %SystemRoot%\System32\drivers\etc\hosts >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1
echo rm -recurse %TEMP%\hosts >> %SystemRoot%\System32\drivers\etc\update-hosts.ps1

echo updating hosts
powershell %SystemRoot%\System32\drivers\etc\update-hosts.ps1
ipconfig /flushdns
echo 'done'