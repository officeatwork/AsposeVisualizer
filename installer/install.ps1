$myDocuments = [environment]::getfolderpath("mydocuments")
$visualStudio2012Folder = Get-ChildItem $myDocuments -Filter "Visual Studio 2012"
$visualStudio2013Folder = Get-ChildItem $myDocuments -Filter "Visual Studio 2013"

if (($visualStudio2012Folder -eq $null) -and ($visualStudio2013Folder -eq $null)) {
    Write-Host "Could not install Aspose.Words Debugger Visualizer. None of the supported Visual Studio Versions (2012, 2013) were found" -Foreground red

    Write-Output "Press any key to continue ..."
    $host.UI.RawUI.ReadKey() | Out-Null
    return
}

Set-Location $PSScriptRoot
Write-Output "Downloading Aspose.Words from NuGet"
.\NuGet.exe install Aspose.Words -Version 14.11.0 -ExcludeVersion -NoCache -NonInteractive -OutputDirectory .

if ($visualStudio2012Folder -ne $null) {
    Write-Output "Installing Aspose.Words Debugger Visualizer for Visual Studio 2012."
    Copy-Item "$PSScriptRoot\AsposeVisualizer.2012.dll" -Destination "$($visualStudio2012Folder.FullName)\Visualizers"
    Copy-Item "$PSScriptRoot\AsposeWordsSupport.dll" -Destination "$($visualStudio2012Folder.FullName)\Visualizers"
    Copy-Item "$PSScriptRoot\Aspose.Words\lib\net3.5-client\Aspose.Words.dll" -Destination "$($visualStudio2012Folder.FullName)\Visualizers"
    Write-Host "Installed Aspose.Words Debugger Visualizer for Visual Studio 2012 successfully" -Foreground green
}

if ($visualStudio2013Folder -ne $null) {
    Write-Output "Installing Aspose.Words Debugger Visualizer for Visual Studio 2013."
    Copy-Item "$PSScriptRoot\AsposeVisualizer.2013.dll" -Destination "$($visualStudio2013Folder.FullName)\Visualizers"
    Copy-Item "$PSScriptRoot\AsposeWordsSupport.dll" -Destination "$($visualStudio2013Folder.FullName)\Visualizers"
    Copy-Item "$PSScriptRoot\Aspose.Words\lib\net3.5-client\Aspose.Words.dll" -Destination "$($visualStudio2013Folder.FullName)\Visualizers"
    Write-Host "Installed Aspose.Words Debugger Visualizer for Visual Studio 2013 successfully" -Foreground green
}

Remove-Item -Recurse -Force "$PSScriptRoot\Aspose.Words"

Write-Output "Press any key to continue ..."
$host.UI.RawUI.ReadKey() | Out-Null