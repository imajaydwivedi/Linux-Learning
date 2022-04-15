<# Method 01: Using PoshRSJob
#>
cls
$Source = Get-ChildItem -Path "/media/saanvi/Recreation Zone/Study Materials 2/SQL Server/SQL Server 2008 Microsoft Certified Master (MCM)" -Recurse -File | Select -ExpandProperty FullName
$Destination = '/stale-storage/Study-Zone/SQL Server/SQL Server 2008 Microsoft Certified Master (MCM)'
$Threads = 4 # Decide based on CPU cores, Source & Destination storage Speed

$copyJobs = @()
$copyJobs += $Source | Start-RSjob -Name {$_} -Throttle $Threads -ScriptBlock {
    Copy-Item -Path $_ -Destination $Using:Destination -Recurse -Force
}
$copyJobs | Wait-RSJob -ShowProgress
#$copyJobs
$copyJobs | Remove-RSJob

