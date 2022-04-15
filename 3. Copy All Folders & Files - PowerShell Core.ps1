<# Method 01: Using PoshRSJob
#>
cls
$Source = "/fast-storage-01/study-zone/BrentOzar-Recordings"
$Target = '/stale-storage/Study-Zone/SQL Server/BrentOzar-Recordings-2'
$Threads = 8 # Decide based on CPU cores, Source & Destination storage Speed

Import-Module PoshRSJob
$startTime = Get-Date
"{0} {1,-10} {2}" -f "($((Get-Date).ToString('yyyy-MM-dd HH:mm:ss')))","(START)","Fetch all files & folder from source directory.." | Write-Host -ForegroundColor Yellow
$sourceFiles = Get-ChildItem -Path $Source -Recurse | Select -ExpandProperty FullName -First 20;
$scriptBlock = {
    $file = $_
    $targetFile = $file.Replace($Source,$Using:Target)
    Copy-Item $file -Destination $Using:Target -Recurse -Container -Force
}

#foreach($file in $sourceFiles) {
  #$file.Replace($Source,$Target)
#}
"{0} {1,-10} {2}" -f "($((Get-Date).ToString('yyyy-MM-dd HH:mm:ss')))","(INFO)","Start copy from source to target with $Threads parallel threads.." | Write-Host -ForegroundColor Cyan
$copyJobs = @()
$copyJobs += $sourceFiles | Start-RSjob -Name {"$_"} -Throttle $Threads -ScriptBlock $scriptBlock
$copyJobs | Wait-RSJob -ShowProgress
$copyJobs | Remove-RSJob

# Kill Jobs if Reqired
# $copyJobs | Stop-RSJob -Verbose

$endTime = Get-Date
$timeSpent = New-TimeSpan -Start $startTime -End $endTime
"`n`nTotal time spent in copy/paste => $($timeSpent.TotalMinutes) minutes " | Write-Host -ForegroundColor Yellow