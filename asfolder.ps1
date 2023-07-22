Get-ChildItem -Filter *.mkv | ForEach-Object {
    $filename = $_.Name
    $prefix = $filename.Substring(0, $filename.IndexOf(']') + 1)
    $suffix = $filename.Substring($filename.LastIndexOf('-'))
    $name = $filename.Substring($prefix.Length, $filename.Length - $prefix.Length - $suffix.Length).TrimStart().TrimEnd()

    Write-Output "Processing file '$filename' with name '$name'"

    if (-not (Test-Path $name -PathType Container)) {
        # Write-Output "Creating directory '$name'"
        New-Item -ItemType Directory -Path $name | Out-Null
    }

    # $destination = Join-Path "$name" $filename
    # $destination = "$name\'$filename'"
    Write-Output "Moving file '$filename' to directory $name"
    Move-Item -LiteralPath $_.FullName -Destination "$name"
}
