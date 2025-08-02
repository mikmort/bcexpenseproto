# PowerShell script to restructure AL files according to best practices
# This script renames files from current naming to <ObjectName>.<ObjectType>.al convention

# Function to get object name from AL file
function Get-ObjectNameFromFile {
    param([string]$FilePath)
    
    $content = Get-Content $FilePath -Raw
    if ($content -match '(table|page|codeunit|report|xmlport|query|enum)\s+\d+\s+"?([^"\r\n{]+)"?') {
        $objectType = $matches[1]
        $objectName = $matches[2].Trim('"').Trim()
        # Remove spaces and special characters for file naming
        $cleanName = $objectName -replace '[^a-zA-Z0-9]', ''
        return @{
            Type = $objectType
            Name = $cleanName
            OriginalName = $objectName
        }
    }
    return $null
}

# Get all AL files
$alFiles = Get-ChildItem -Path "src" -Filter "*.al" -Recurse

Write-Host "Found $($alFiles.Count) AL files to restructure..."

# Create mapping of old to new file names
$fileMappings = @()

foreach ($file in $alFiles) {
    $objectInfo = Get-ObjectNameFromFile $file.FullName
    if ($objectInfo) {
        $newFileName = "$($objectInfo.Name).$($objectInfo.Type.Substring(0,1).ToUpper() + $objectInfo.Type.Substring(1)).al"
        $newPath = Join-Path "src" $newFileName
        
        $fileMappings += [PSCustomObject]@{
            OldPath = $file.FullName
            NewPath = $newPath
            OldName = $file.Name
            NewName = $newFileName
            ObjectType = $objectInfo.Type
            ObjectName = $objectInfo.OriginalName
            CleanName = $objectInfo.Name
        }
        
        Write-Host "Will rename: $($file.Name) -> $newFileName ($($objectInfo.OriginalName))"
    }
}

# Show summary
Write-Host "`nSummary of changes:"
Write-Host "Tables: $($fileMappings | Where-Object {$_.ObjectType -eq 'table'} | Measure-Object | Select-Object -ExpandProperty Count)"
Write-Host "Pages: $($fileMappings | Where-Object {$_.ObjectType -eq 'page'} | Measure-Object | Select-Object -ExpandProperty Count)"

# Export mappings for reference
$fileMappings | Export-Csv -Path "file_mapping.csv" -NoTypeInformation
Write-Host "`nFile mapping saved to file_mapping.csv"
Write-Host "Review the mappings, then run the actual rename operation."
