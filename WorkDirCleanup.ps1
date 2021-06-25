#==============================================================================
#
#   Task         : Delete files
#   Description  : Delete folders, or files older than N days defined in $DaysBack
#   Version      : None
#
#==============================================================================


$Path = "Enter\Path\here"
$DaysBack = "-1" 
$CurrentDate = Get-Date
$DatetoDelete = $CurrentDate.AddDays($DaysBack)

Write-Host " ***** Delete files from $Path directory that are older than $Daysback "

Get-ChildItem -Path $Path -Include * -Exclude tools -Recurse | Where-Object {$_.LastWriteTime -lt $DatetoDelete} | Remove-Item -ErrorAction SilentlyContinue -Recurse -Force
# Delete files older than 12 hours "| where {$_.Lastwritetime -lt (date).addhours(-12)} | remove-item"

Write-Host " ***** Script End ***** "


