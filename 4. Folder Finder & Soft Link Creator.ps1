$SourceDirectory = '/fast-storage-01/study-zone/Video-Tutorials/SQLServer'
$TargetDirectory = '/stale-storage/Study-Zone'

cls
$sourcefolders = Get-ChildItem -Path $SourceDirectory -Directory
$files = Get-ChildItem -Path $TargetDirectory -Recurse;

$notFound = @()
$pointers = @()
foreach($folder in $sourcefolders) {
  $string2Find = $folder.Name
  $found = @()
  $found += $files | ? {$_.Name -like $String2Find} | Select -First 1;
  if($found.Count -gt 0) {
    #"$string2Find is found" | Write-Host -ForegroundColor Green
  }
  else {
    "$string2Find is not found" | Write-Host -ForegroundColor Red
    $notFound += $folder.FullName
  }

  $pointers += $(New-Object psobject -Property @{
                   Source = $string2Find;
                   Destination = if($found.Count -gt 0) {$found.FullName}else{$null};
                })
}

$pointers | Select Source, Destination | ft -AutoSize

foreach($dir in $pointers) {
  ln -s $dir.Destination $dir.Source
}