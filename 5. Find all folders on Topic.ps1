$Source = '/stale-storage/Study-Zone'

cls
$folders = Get-ChildItem -Path $Source -Directory -Recurse 
                | Where-Object {$_.FullName -notlike '/stale-storage/Study-Zone/SQL Server*' -and $_.Name -like '*sql server*'}
$folders | Select-Object -ExpandProperty FullName