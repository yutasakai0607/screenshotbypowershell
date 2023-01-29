$path = "C:\Program Files\Google\Chrome\Application\chrome.exe"
#リンク先
$url = "https://google.com"

$browser = start $path $url

#SendKeysを使うため、System.Windows.Forms名前空間読込
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Start-Sleep 2

[System.Windows.Forms.SendKeys]::SendWait("aaa")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")


$sc=[Windows.Forms.Screen]::PrimaryScreen
$bmp=New-Object System.Drawing.Bitmap($sc.Bounds.width, ($sc.Bounds.height - 200))

([System.Drawing.Graphics]::FromImage($bmp)).CopyFromscreen(0,100,0,0,$bmp.size)
$bmp.Save("C:\tmp\test.png")
$bmp.Dispose()