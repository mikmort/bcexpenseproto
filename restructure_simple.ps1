# Simple PowerShell script to restructure AL files
Write-Host "Starting AL file restructuring..."

# Import the mappings
$fileMappings = Import-Csv "file_mapping.csv"

# Rename each file
foreach ($mapping in $fileMappings) {
    if (Test-Path $mapping.OldPath) {
        Move-Item -Path $mapping.OldPath -Destination $mapping.NewPath -Force
        Write-Host "Renamed: $($mapping.OldName) -> $($mapping.NewName)"
    }
}

# Remove empty directories
if (Test-Path "src\Pages") {
    $pageItems = Get-ChildItem "src\Pages" -ErrorAction SilentlyContinue
    if ($pageItems.Count -eq 0) {
        Remove-Item "src\Pages" -Force
        Write-Host "Removed empty Pages folder"
    }
}

if (Test-Path "src\Tables") {
    $tableItems = Get-ChildItem "src\Tables" -ErrorAction SilentlyContinue  
    if ($tableItems.Count -eq 0) {
        Remove-Item "src\Tables" -Force
        Write-Host "Removed empty Tables folder"
    }
}

Write-Host "Restructuring complete!"
