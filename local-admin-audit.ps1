# local-admin-audit.ps1
param([string[]]$computers = @('localhost'))
foreach ($c in $computers) {
    Write-Output "Checking $c for local admins"
    $admins = Invoke-Command -ComputerName $c -ScriptBlock { Get-LocalGroupMember -Group 'Administrators' } -ErrorAction SilentlyContinue
    $admins | Select-Object @{Name='Computer';Expression={$c}}, Name, ObjectClass | Export-Csv .\local_admins.csv -Append -NoTypeInformation
}
