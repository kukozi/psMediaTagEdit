clear
$path = $PWD.Path
#$taglib = “\taglib-sharp.dll”
#$taglibpath = $path + $taglib
$taglibpath= "file:///C:\Users\kukozi\Downloads\Career Paths Psychology Audio\taglib-sharp.dll"
[System.Reflection.Assembly]::LoadFrom($taglibpath) | out-null
$files = Get-ChildItem -Path $path | Where-Object {$_.Extension -eq '.mp3'}
foreach ($filename in $files){
$media = [TagLib.File]::Create($filename)
#$title = $media.Tag.Title
$title = $filename -replace "CP PSYCHOLOGY CD1 Track", "CP Psy"
$media.Tag.Title = $title
$media.Save()
}
