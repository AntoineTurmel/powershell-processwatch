$target = "firefox"
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}

while ($true)
{
while (!($process))
{
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
start-sleep -s 5
}
if ($process)
{
#echo "Place action on process start here"
$process.WaitForExit()
start-sleep -s 2
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
#echo "Place action on process exit here"
New-BurntToastNotification -AppLogo "C:\Users\Antoine\dev\process_watch\Fx-Browser-icon-oneColor-white.png" -Text "Firefox is closed" , "No more firefox.exe"
}
}