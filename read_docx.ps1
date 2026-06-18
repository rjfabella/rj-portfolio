Add-Type -AssemblyName System.IO.Compression.FileSystem
$docx = 'D:\github\rj-portfolio\RFabella_CV_2026-SrTechAnalyst.docx'
$zip = [System.IO.Compression.ZipFile]::OpenRead($docx)
$docXml = $zip.Entries | Where-Object { $_.FullName -eq 'word/document.xml' }
$stream = $docXml.Open()
$reader = New-Object System.IO.StreamReader($stream)
$xmlStr = $reader.ReadToEnd()
$reader.Close()
$zip.Dispose()
$xmlStr -replace '<[^>]+>', ' ' -replace '\s+', ' '
