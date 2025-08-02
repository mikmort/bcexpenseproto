# PowerShell script to perform AL file restructuring
param()

Write-Host "Starting AL file restructuring according to best practices..."

# Import the file mappings
if (-not (Test-Path "file_mapping.csv")) {
    Write-Error "file_mapping.csv not found. Run restructure_files.ps1 first."
    exit 1
}

$fileMappings = Import-Csv "file_mapping.csv"

# Perform the actual renaming
$totalFiles = $fileMappings.Count
$currentFile = 0

foreach ($mapping in $fileMappings) {
    $currentFile++
    Write-Progress -Activity "Restructuring AL files" -Status "Processing $($mapping.NewName)" -PercentComplete (($currentFile / $totalFiles) * 100)
    
    if (Test-Path $mapping.OldPath) {
        try {
            Move-Item -Path $mapping.OldPath -Destination $mapping.NewPath -Force
            Write-Host "✓ Renamed: $($mapping.OldName) -> $($mapping.NewName)"
        }
        catch {
            Write-Warning "Failed to rename $($mapping.OldName): $($_.Exception.Message)"
        }
    } else {
        Write-Warning "File not found: $($mapping.OldPath)"
    }
}

# Clean up empty folders
$foldersToCheck = @("src\Pages", "src\Tables")
foreach ($folder in $foldersToCheck) {
    if (Test-Path $folder) {
        try {
            $items = Get-ChildItem $folder -ErrorAction SilentlyContinue
            if (($items | Measure-Object).Count -eq 0) {
                Remove-Item $folder -Force
                Write-Host "✓ Removed empty folder: $folder"
            }
        }
        catch {
            Write-Warning "Could not process folder $folder: $($_.Exception.Message)"
        }
    }
}

Write-Host ""
Write-Host "✅ File restructuring complete!"
Write-Host "✅ All files now follow the ObjectName.ObjectType.al naming convention"

# Display summary
$tables = ($fileMappings | Where-Object {$_.ObjectType -eq 'table'} | Measure-Object).Count
$pages = ($fileMappings | Where-Object {$_.ObjectType -eq 'page'} | Measure-Object).Count

Write-Host ""
Write-Host "Summary:"
Write-Host "📋 Tables: $tables files"
Write-Host "📄 Pages: $pages files"
Write-Host "📁 Total: $($fileMappings.Count) files restructured"
