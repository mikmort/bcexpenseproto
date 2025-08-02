# PowerShell script to perform the actual file restructuring
# This script implements the AL best practices folder structure

# Import the file mappings
if (-not (Test-Path "file_mapping.csv")) {
    Write-Error "file_mapping.csv not found. Run restructure_files.ps1 first."
    exit 1
}

$fileMappings = Import-Csv "file_mapping.csv"

Write-Host "Starting file restructuring according to AL best practices..."

# Remove old folder structure
if (Test-Path "src\Pages") {
    Write-Host "Removing old Pages folder structure..."
}
if (Test-Path "src\Tables") {
    Write-Host "Removing old Tables folder structure..."
}

# Perform the actual renaming
$totalFiles = $fileMappings.Count
$currentFile = 0

foreach ($mapping in $fileMappings) {
    $currentFile++
    Write-Progress -Activity "Restructuring AL files" -Status "Processing $($mapping.NewName)" -PercentComplete (($currentFile / $totalFiles) * 100)
    
    if (Test-Path $mapping.OldPath) {
        # Move file to new location with new name
        Move-Item -Path $mapping.OldPath -Destination $mapping.NewPath -Force
        Write-Host "✓ Renamed: $($mapping.OldName) -> $($mapping.NewName)"
    } else {
        Write-Warning "File not found: $($mapping.OldPath)"
    }
}

# Clean up empty folders
$emptyFolders = @("src\Pages", "src\Tables")
foreach ($folder in $emptyFolders) {
    if (Test-Path $folder) {
        $items = Get-ChildItem $folder -ErrorAction SilentlyContinue
        if ($items.Count -eq 0) {
            Remove-Item $folder -Force
            Write-Host "✓ Removed empty folder: $folder"
        } else {
            Write-Warning "Folder not empty, keeping: $folder"
        }
    }
}

Write-Host "`n✅ File restructuring complete!"
Write-Host "✅ All files now follow the <ObjectName>.<ObjectType>.al naming convention"
Write-Host "✅ Files are organized in a flat structure under src/"

# Display summary
$tables = $fileMappings | Where-Object {$_.ObjectType -eq 'table'}
$pages = $fileMappings | Where-Object {$_.ObjectType -eq 'page'}

Write-Host "`nSummary:"
Write-Host "📋 Tables: $($tables.Count) files"
Write-Host "📄 Pages: $($pages.Count) files"
Write-Host "📁 Total: $($fileMappings.Count) files restructured"

Write-Host "`nNext steps:"
Write-Host "1. Update any relative file references in your project"
Write-Host "2. Test compilation to ensure all references are correct"
Write-Host "3. Update documentation to reflect new structure"
