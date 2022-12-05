# Merge Videos
$ cat Videos-2-Merge.txt
file '/path/to/file1'
file '/path/to/file2'
file '/path/to/file3'
    
$ ffmpeg -f concat -safe 0 -i Videos-2-Merge.txt -c copy Video-After-Merging.mp4

####################################################################################
####################################################################################

# Full Convert/Compress
ffmpeg -i "InputFile.mkv" -vcodec libx265 -crf 20 "InputFile.mp4"

# Partial Convert/Compress
ffmpeg -i "InputFile.mkv" -ss 00:00:00 -to 00:02:00 -vcodec libx265 -crf 20 "InputFile.mp4"

####################################################################################
####################################################################################

# Compress All Videos in Directory
[CmdletBinding()]
Param (
  [Parameter(Mandatory=$false)]
  [String]$VideoDirectory = '/study-zone/BrentOzar-Recordings/02 - Fundamentals of Index Tuning'
)
Set-Location $VideoDirectory

$videoFiles = @()
$videoFiles += Get-ChildItem -File | Where-Object {$_.Extension -eq '.mkv'}

#$videoFiles | Select-Object * -First 1 | fl
clear
foreach($file in $videoFiles) {
  $preFile = $file.BaseName+'.mkv'
  $postFile = $file.BaseName + '.mp4'
  "Processing file '$preFile'" | Write-Host -ForegroundColor Cyan
  #$preFile = $preFile.Replace("'","\'")
  #$postFile = $postFile.Replace("'", "\'")
  #"ffmpeg -i '$preFile' -vcodec libx265 -crf 20 '$postFile';"
  #sh -c "ffmpeg -i `"$preFile`" -vcodec libx265 -crf 20 `"$postFile`";"
  ffmpeg -i `"$preFile`" -vcodec libx265 -crf 20 `"$postFile`";
  #break;
}


####################################################################################
####################################################################################

# Cut a video
ffmpeg -i input.mp4 -ss 00:00:00 -to 03:21:16 -c copy output1.mp4
ffmpeg -i input.mp4 -ss 00:10:00 -to 00:20:00 -c copy output2.mp4

/**
* -i  input file
* -ss start time in seconds or in hh:mm:ss
* -to end time in seconds or in hh:mm:ss
* -c codec to use
*/

####################################################################################
####################################################################################

