# cmd /c mklink "C:\Users\$ENV:USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" "C:\Users\$ENV:USERNAME\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"

function prompt()
{
    if($_last = Get-History | Select-Object -Last 1)
    {
        "$($_last.Duration.ToString())> "
    }
}
$ENV:STARSHIP_CONFIG = "C:\Users\$ENV:USERNAME\dotfiles\starship\.config\starship.toml"
$ENV:LEDGER_FILE = "C:\Users\$ENV:USERNAME\obsidian\finance\hledger.journal"

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias ls lsd
Set-Alias cat bat
Set-Alias trp Remove-ItemSafely

fastfetch

