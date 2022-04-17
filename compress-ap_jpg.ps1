#requires -version 3.0
<#
.SYNOPSIS
    Script for compress JPG file.
.DESCRIPTION
    Compess JPG file with external tool (ImageMagickfor windows).
    Use process run and write info into alternative NTFS stream.
    Filter file for age in days.
.NOTES
    Name: compress-ap_jpg
    Author: Stepanenko S
    Version: 0.1
    DateCreated: 17.04.2022
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-ap_jpg.ps1 -rootDir C:\temp\pdfs\ -MaxProcess 5 -ageDays 1
    04/17/2022 20:53:40:compress-ap_jpg.ps1 - Info - Core module C:\tools\compress-pdf\core.ps1 load
    04/17/2022 20:53:40:compress-ap_jpg.ps1 - Info - Start script
    04/17/2022 20:53:40:compress-ap_jpg.ps1 - Info - Set variables
    04/17/2022 20:53:40:compress-ap_jpg.ps1 - Info - Modify path to C:\temp\pdfs\
    04/17/2022 20:53:40:compress-ap_jpg.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/17/2022 20:53:51:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 13156 - Run process for \\?\C:\temp\pdfs\FW96655A.jpg
    04/17/2022 20:53:51:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 13156 - Exit code 1
    04/17/2022 20:53:51:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 13156 - convert.exe: Not a JPEG file: starts with 0x42 0x43 `\\?\C:\temp\pdfs\FW96655A.jpg' @ error/jpeg.c/JPEGErrorHandler/347.
    convert.exe: NoImagesDefined `\\?\C:\temp\pdfs\tmp_FW96655A.jpg' @ error/convert.c/ConvertImageCommand/3325.
    04/17/2022 20:53:51:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 15512 - File \\?\C:\temp\pdfs\IMG_20200410_181834.jpg process OK
    04/17/2022 20:53:51:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 2456 - File \\?\C:\temp\pdfs\IMG_20220109_134813.jpg process OK
    04/17/2022 20:53:51:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 7976 - File \\?\C:\temp\pdfs\IMG_20220109_134822.jpg process OK
    04/17/2022 20:53:51:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 7956 - File \\?\C:\temp\pdfs\_norigths\1648200331923.jpg process OK
    04/17/2022 20:53:51:compress-ap_jpg.ps1 - Info - Save spaces 0 MB
    04/17/2022 20:53:51:compress-ap_jpg.ps1 - Info - Work time 00:00:11.0034378
    04/17/2022 20:53:51:compress-ap_jpg.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-ap_jpg.ps1 -rootDir C:\temp\pdfs\ -MaxProcess 5 -ageDays 1 -replaceOriginal $true
    04/17/2022 20:54:23:compress-ap_jpg.ps1 - Info - Core module C:\tools\compress-pdf\core.ps1 load
    04/17/2022 20:54:23:compress-ap_jpg.ps1 - Info - Start script
    04/17/2022 20:54:23:compress-ap_jpg.ps1 - Info - Set variables
    04/17/2022 20:54:23:compress-ap_jpg.ps1 - Info - Modify path to C:\temp\pdfs\
    04/17/2022 20:54:23:compress-ap_jpg.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/17/2022 20:54:35:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 17368 - Run process for \\?\C:\temp\pdfs\FW96655A.jpg
    04/17/2022 20:54:35:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 17368 - Exit code 1
    04/17/2022 20:54:35:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 17368 - convert.exe: Not a JPEG file: starts with 0x42 0x43 `\\?\C:\temp\pdfs\FW96655A.jpg' @ error/jpeg.c/JPEGErrorHandler/347.
    convert.exe: NoImagesDefined `\\?\C:\temp\pdfs\tmp_FW96655A.jpg' @ error/convert.c/ConvertImageCommand/3325.
    04/17/2022 20:54:35:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 6672 - File \\?\C:\temp\pdfs\IMG_20200410_181834.jpg process OK
    04/17/2022 20:54:35:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 15668 - File \\?\C:\temp\pdfs\IMG_20220109_134813.jpg process OK
    04/17/2022 20:54:35:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 17132 - File \\?\C:\temp\pdfs\IMG_20220109_134822.jpg process OK
    04/17/2022 20:54:35:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Info - 16088 - File \\?\C:\temp\pdfs\_norigths\1648200331923.jpg process OK
    04/17/2022 20:54:36:compress-ap_jpg.ps1 - Info - Save spaces 9.63 MB
    04/17/2022 20:54:36:compress-ap_jpg.ps1 - Info - Work time 00:00:12.2818861
    04/17/2022 20:54:36:compress-ap_jpg.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-ap_jpg.ps1 -rootDir C:\temp\pdfs\ -MaxProcess 1 -ageDays 1 -replaceOriginal $true -Verbose
    04/17/2022 20:55:21:compress-ap_jpg.ps1 - Info - Core module C:\tools\compress-pdf\core.ps1 load
    04/17/2022 20:55:21:compress-ap_jpg.ps1 - Info - Start script
    04/17/2022 20:55:21:compress-ap_jpg.ps1 - Info - Set variables
    04/17/2022 20:55:21:compress-ap_jpg.ps1 - Info - Modify path to C:\temp\pdfs\
    ПОДРОБНО: 04/17/2022 20:55:21:compress-ap_jpg.ps1 - Verbose - Check access to \\?\C:\temp\pdfs\
    04/17/2022 20:55:21:compress-ap_jpg.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    ПОДРОБНО: 04/17/2022 20:55:21:compress-ap_jpg.ps1 - Verbose - Check file \\?\C:\temp\pdfs\FW96655A.jpg
    ПОДРОБНО: 04/17/2022 20:55:21:compress-ap_jpg.ps1 - Verbose - Begin process file \\?\C:\temp\pdfs\FW96655A.jpg
    ПОДРОБНО: 04/17/2022 20:55:21:compress-ap_jpg.ps1 - Verbose - Run for process file \\?\C:\temp\pdfs\FW96655A.jpg
    ПОДРОБНО: 04/17/2022 20:55:21:Start-ModifyFileAsync\compress-ap_jpg.ps1 - Verbose - Args: force = True
    ПОДРОБНО: 04/17/2022 20:55:21:Start-ModifyFileAsync\compress-ap_jpg.ps1 - Verbose - Args: filePathOriginal = \\?\C:\temp\pdfs\FW96655A.jpg
    ПОДРОБНО: 04/17/2022 20:55:21:Start-ModifyFileAsync\compress-ap_jpg.ps1 - Verbose - Args: filePathTemp = \\?\C:\temp\pdfs\tmp_FW96655A.jpg
    ПОДРОБНО: 04/17/2022 20:55:21:Start-ModifyFileAsync\compress-ap_jpg.ps1 - Verbose - Args: exePath = C:\tools\imagemagick\convert.exe
    ПОДРОБНО: 04/17/2022 20:55:21:Start-ModifyFileAsync\compress-ap_jpg.ps1 - Verbose - Args: exeArgs = -resize 1920^ -strip -interlace Plane -sampling-factor 4:2:0 -quality 90%  "\\?\C:\temp\pdfs\FW96655A.jpg"
    "\\?\C:\temp\pdfs\tmp_FW96655A.jpg"
    ПОДРОБНО: 04/17/2022 20:55:21:Start-ModifyFileAsync\compress-ap_jpg.ps1 - Verbose - Start process for \\?\C:\temp\pdfs\FW96655A.jpg
    ПОДРОБНО: 04/17/2022 20:55:21:Start-ModifyFileAsync\compress-ap_jpg.ps1 - Verbose - Process 16912 will process file \\?\C:\temp\pdfs\FW96655A.jpg
    ПОДРОБНО: 04/17/2022 20:55:21:compress-ap_jpg.ps1 - Verbose - Maxprocess 1 was reached. Waiting finish running process
    ПОДРОБНО: 04/17/2022 20:55:31:compress-ap_jpg.ps1 - Verbose - Process result from 16912
    ПОДРОБНО: 04/17/2022 20:55:31:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Verbose - 16912 - Exit with exitcode 1
    04/17/2022 20:55:31:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 16912 - Run process for \\?\C:\temp\pdfs\FW96655A.jpg
    04/17/2022 20:55:31:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 16912 - Exit code 1
    04/17/2022 20:55:31:Get-ModifyAsyncResult\compress-ap_jpg.ps1 - Error - 16912 - convert.exe: Not a JPEG file: starts with 0x42 0x43 `\\?\C:\temp\pdfs\FW96655A.jpg' @ error/jpeg.c/JPEGErrorHandler/347.
    convert.exe: NoImagesDefined `\\?\C:\temp\pdfs\tmp_FW96655A.jpg' @ error/convert.c/ConvertImageCommand/3325.
    ПОДРОБНО: 04/17/2022 20:55:31:compress-ap_jpg.ps1 - Verbose - Check file \\?\C:\temp\pdfs\IMG_20200410_181834.jpg
    ПОДРОБНО: 04/17/2022 20:55:31:compress-ap_jpg.ps1 - Verbose - Check file \\?\C:\temp\pdfs\IMG_20220109_134813.jpg
    ПОДРОБНО: 04/17/2022 20:55:31:compress-ap_jpg.ps1 - Verbose - Check file \\?\C:\temp\pdfs\IMG_20220109_134822.jpg
    ПОДРОБНО: 04/17/2022 20:55:31:compress-ap_jpg.ps1 - Verbose - Check file \\?\C:\temp\pdfs\_norigths\1648200331923.jpg
    04/17/2022 20:55:31:compress-ap_jpg.ps1 - Info - Save spaces 0 MB
    04/17/2022 20:55:31:compress-ap_jpg.ps1 - Info - Work time 00:00:10.1089085
    04/17/2022 20:55:31:compress-ap_jpg.ps1 - Info - End script
#>

# set args and validate
[CmdletBinding()]
param(
    [string]
    [ValidateScript({if (Test-Path -LiteralPath $_ -PathType "Container") {$true} else {throw "Dir $_ not found"}})]
    [Parameter(Mandatory)]
    # Set root dir for processing
    $rootDir,
    [ValidateRange(1,[int]::MaxValue)]
    # Set days age for processing file
    [int]$ageDays=5*360,
    # Set replace original file
    [bool]$replaceOriginal,
    [ValidateRange(1,20)]
    # Set max parallel compress job
    [int]$maxProcess=10,
    # Set prefix for compress jobs
    [string]$jobPrefix='ns.comp_jpg',
    # Set alternative NTFS stream name for saving info
    [string]$streamName='ns.comp_jpg',
    # Set max run time in seconds
    [int]$maxRunSecond=86400,
    # Set mask for processing files
    [string]$mask = "*.jp*g",
    # Set prefix name for files
    $tmpPrefix = 'tmp_',
    [ValidateScript({if (Test-Path -LiteralPath $_ -PathType "Leaf") {$true} else {throw "Path $_ not found"}})]
    # Set path to exe
    $exePath = 'C:\tools\imagemagick\convert.exe',
    [ValidateSet(1024,1280,1920,2048)]
    # Set DPI
    [int]$size=1920
)

$coreModule="$($PSScriptRoot)\core.ps1"
try {
    # Load func module
    . $coreModule
    Write-LogMessage $(Get-FunctionName) 'Info' "Core module $($coreModule) load"
    }
catch
    {
    Write-Error $_
    }

Write-LogMessage $(Get-FunctionName) 'Info' "Start script"
#Set-StrictMode -Version Latest
Write-LogMessage $(Get-FunctionName) 'Info' "Set variables"
#$ErrorActionPreference = "stop"
$exeArgs = "-resize $($size)^ -strip -interlace Plane -sampling-factor 4:2:0 -quality 90% "
$StartTime = get-date
$EstimatedStopTime = (get-date).addseconds($MaxRunSecond)

# fix for limits 256 chars in path
# posh 7 not support \\?\ syntax
if ($host.version.Major -lt 7)
    {
    Write-LogMessage $(Get-FunctionName) 'Info' "Modify path to $($RootDir)"
    if ($RootDir -match '\\\\')
        {
        $RootDir = $RootDir.replace('\\','\\?\UNC\')
        }
    else
        {
        $RootDir = "\\?\$RootDir"
        }
    }

# simple check dir access
Write-LogMessage $(Get-FunctionName) 'Verbose' "Check access to $($RootDir)"
$root = Get-Item -force $RootDir
if ($null -eq $root)
    {
    Throw ("Error access to $($RootDir)")
    }

$ProcessFiles = @()
[System.Collections.ArrayList]$StartedProcess = @()
Write-LogMessage $(Get-FunctionName) 'Info' "Enum files in $($root.fullname)"
# main process cycle
try
    {
    foreach ($fileSelect in $root.EnumerateFiles($Mask,[system.io.SearchOption]::AllDirectories))
        {
        try
            {
            Write-LogMessage $(Get-FunctionName) 'Verbose' "Check file $($fileSelect.fullname)"
            # select files for processing.
            # compare age and NTFS stream have
            if (($fileSelect.LastWriteTime -le $(get-date).adddays(-$AgeDays))-and((get-item -Force -Stream * -LiteralPath "$($fileSelect.fullname)").stream -notcontains $StreamName))
                {
                Write-LogMessage $(Get-FunctionName) 'Verbose' "Begin process file $($fileSelect.fullname)"
                $filePathTemp = Get-PathPre $fileSelect.fullname $TmpPrefix
                # modify args
                $exeArgsForFile = "$($exeArgs) `"$($fileSelect.fullname)`" `"$filePathTemp`""
                Write-LogMessage $(Get-FunctionName) 'Verbose' "Run for process file $($fileSelect.fullname)"
                # start processing job
                [void]$StartedProcess.Add($(Start-ModifyFileAsync $($fileSelect.fullname) $filePathTemp $exePath $exeArgsForFile -force))
                }
            }
        catch
            {
            # if error process file - skip this file
            Write-LogMessage $(Get-FunctionName) 'Error' "File $($fileSelect.fullname) $_"
            continue
            }
            # if over MaxPorcess - wait
        while (@($StartedProcess | Where-Object{$_.proc.hasExited -eq $false}).count -ge $MaxProcess)
            {
            # maybe very small?
            Write-LogMessage $(Get-FunctionName) 'Verbose' "Maxprocess $($MaxProcess) was reached. Waiting finish running process"
            Start-Sleep -Seconds 10
            }
        # process complete job
        foreach ($proc in @($StartedProcess | Where-Object{$_.proc.hasExited -eq $true}))
            {
            Write-LogMessage $(Get-FunctionName) 'Verbose' "Process result from $($proc.proc.id)"
            Get-ModifyAsyncResult $proc.proc $proc.filePathOriginal $proc.filePathTemp $replaceOriginal $streamName
            [void]$StartedProcess.Remove($proc)
            $ProcessFiles += $fileSelect.FullName
            }
        # Check runtime limit
        if ($(get-date) -gt $EstimatedStopTime)
            {
            Write-LogMessage $(Get-FunctionName) 'Info' "Timeout $($MaxRunSecond) seconds out. Wait all job exited and stopping"
            break
            }
        }
    }
catch 
    {
    Write-LogMessage $(Get-FunctionName) 'Error' "$_"
    continue
    }
finally
    {
    # wait finish process
    while (@($StartedProcess | Where-Object{$_.proc.hasExited -ne $true}).count -ge 1)
        {
        # maybe very small?
        Start-Sleep -Seconds 10
        Write-LogMessage $(Get-FunctionName) 'Verbose' "Waiting end remaining process"
        }

    # process complete job
    foreach ($proc in @($StartedProcess | Where-Object{$_.proc.hasExited -eq $true}))
        {
        Write-LogMessage $(Get-FunctionName) 'Verbose' "Process result from $($proc.proc.id)"
        Get-ModifyAsyncResult $proc.proc $proc.filePathOriginal $proc.filePathTemp $replaceOriginal $streamName
        [void]$StartedProcess.Remove($proc)
        $ProcessFiles += $fileSelect.FullName
        }
    Write-LogMessage $(Get-FunctionName) 'Info' "Save spaces $([math]::round((Get-ReportSave $ProcessFiles $StreamName)/1mb,2)) MB"
    $EndTime = get-date
    Write-LogMessage $(Get-FunctionName) 'Info' "Work time $($EndTime-$StartTime)"
    Write-LogMessage $(Get-FunctionName) 'Info' "End script"
    }