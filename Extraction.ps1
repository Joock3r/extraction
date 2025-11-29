# Full path to 7z.exe (adjust if needed)
$sevenZip = "C:\Program Files\7-Zip\7z.exe"

# List of source folders
$folders = @(
    "C:\Folder1",
    "D:\Folder2",
    "E:\Folder3"
)

# Central output folder
$centralOut = "D:\Output"

foreach ($folder in $folders) {
    Get-ChildItem -Path $folder -Recurse -Filter *.rar | ForEach-Object {
        # Create a subfolder named after the archive (without extension) to avoid overwrites
        $archiveName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        $target = Join-Path $centralOut $archiveName

        & $sevenZip x $_.FullName -o"$target" -y
    }
}