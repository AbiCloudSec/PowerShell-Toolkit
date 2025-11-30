# bulk-software-install.ps1
$packages = Import-Csv .\packages.csv
foreach ($p in $packages) {
    Start-Process -FilePath 'msiexec.exe' -ArgumentList "/i `"$($p.MSIPath)`" /qn" -Wait
    Write-Output "Installed: $($p.MSIPath)"
}
