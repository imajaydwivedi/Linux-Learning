[CmdletBinding()]
Param (
  [Parameter(Mandatory=$false)]
  [String]$VideoCourseDirectory = '/hyperactive/Mastering AI Agents for Databases'
)
<#
    Function: Loop through all files and folders in VideoCourseDirectory, and convert *.mkv files to compressed *.mp4
#>

$videoFiles = @()
$videoFiles += Get-ChildItem $VideoCourseDirectory -File -Recurse | Where-Object {$_.Extension -eq '.mkv'} | Sort-Object FullName

#$videoFiles | Select-Object * -First 1 | fl
clear
"'$($videoFiles.Count)' files to process.." | Write-Host -ForegroundColor Yellow

foreach($file in $videoFiles)
{
  $fileDirectory = $file.Directory
  $preFile = $file.BaseName+'.mkv'
  $postFile = $file.BaseName + '.mp4'

  "`nProcessing file '$preFile'..`n" | Write-Host -ForegroundColor Cyan

  # Remove any special character in file name
  #$preFile = $preFile.Replace("'","\'")
  #$postFile = $postFile.Replace("'", "\'")

  "ffmpeg -i '$fileDirectory/$preFile' -y -vcodec libx265 -crf 20 '$fileDirectory/$postFile';"
  sh -c "ffmpeg -i `"$fileDirectory/$preFile`" -y -vcodec libx265 -crf 20 `"$fileDirectory/$postFile`";"
  #break;
}

<#
    ***** Move All *.mkv files after compression ************
    ---------------------------------------------------------


VideoCourseDirectory='/hyperactive/Mastering AI Agents for Databases'

mkdir -p "$VideoCourseDirectory/MKV_Files"
find "$VideoCourseDirectory" -type f -name "*.mkv" -exec mv -t "$VideoCourseDirectory/MKV_Files" {} +

#>