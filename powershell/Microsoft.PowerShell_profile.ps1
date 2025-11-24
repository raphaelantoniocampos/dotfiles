function prompt()
{
    if($_last = Get-History | Select-Object -Last 1)
    {
        "$($_last.Duration.ToString())> "
    }
}

$Env:STARSHIP_CONFIG = "C:\Users\$Env:USERNAME\.config\starship.toml"
$Env:KOMOREBI_CONFIG_HOME = "C:\Users\$Env:USERNAME\.config\komorebi"
$Env:LEDGER_FILE = "C:\Users\$Env:USERNAME\obsidian\finance\hledger.journal"

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias ls lsd
Set-Alias cat bat
Set-Alias trp Remove-ItemSafely

function uvr
{
    uv run $args
}

fastfetch

