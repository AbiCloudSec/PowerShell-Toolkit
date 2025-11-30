# device-health-check.ps1
Get-EventLog -LogName System -Newest 50 | Where-Object { $_.EntryType -eq 'Error' } | Select-Object TimeGenerated, Source, Message | Out-File .\system_errors.txt
Write-Output 'Collected recent system errors to system_errors.txt'
