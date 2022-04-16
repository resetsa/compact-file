#requires -version 3.0
<#
.SYNOPSIS
    Script for compress JPG file.
.DESCRIPTION
    Compess JPG file with external tool (ImageMagickfor windows).
    Use parallel jobs and write info into alternative NTFS stream.
    Filter file for age in days.
.NOTES
    Name: compress-jpg
    Author: Stepanenko S
    Version: 0.2
    DateCreated: 15.04.2022
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-jpg.ps1 -rootDir c:\temp\pdfs -ageDays 1 -replaceOriginal $true
    04/15/2022 22:08:38:compress-jpg.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:08:38:compress-jpg.ps1 - Info - Start script
    04/15/2022 22:08:38:compress-jpg.ps1 - Info - Set variables
    04/15/2022 22:08:38:compress-jpg.ps1 - Info - Modify path to \\?\c:\temp\pdfs
    04/15/2022 22:08:38:compress-jpg.ps1 - Info - Clean old jobs ns.comp_jpg*
    04/15/2022 22:08:38:compress-jpg.ps1 - Info - Enum files in \\?\c:\temp\pdfs
    04/15/2022 22:08:39:compress-jpg.ps1 - Error - File \\?\c:\temp\pdfs\no rigths here\IMG_0642.JPG Отказано в доступе
    04/15/2022 22:08:44:Process-job\compress-jpg.ps1 - Error - Process \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\IMG_0656.JPG
    04/15/2022 22:08:44:Process-job\compress-jpg.ps1 - Error - ns.comp_jpg1710757923 - Errorcode 1
    04/15/2022 22:08:44:Process-job\compress-jpg.ps1 - Info - Process \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\tmp_IMG_0656.JPG OK
    04/15/2022 22:08:44:Process-job\compress-jpg.ps1 - Error - Process \\?\c:\temp\pdfs\no rigths here\Victoria476b.jpg
    04/15/2022 22:08:44:Process-job\compress-jpg.ps1 - Error - ns.comp_jpg1847798253 - Errorcode 1
    04/15/2022 22:08:44:compress-jpg.ps1 - Info - Save spaces 0 MB
    04/15/2022 22:08:44:compress-jpg.ps1 - Info - Work time 00:00:05.3181690
    04/15/2022 22:08:44:compress-jpg.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-jpg.ps1 -rootDir c:\temp\pdfs -ageDays 1 -Verbose
    04/15/2022 22:09:05:compress-jpg.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:09:05:compress-jpg.ps1 - Info - Start script
    04/15/2022 22:09:05:compress-jpg.ps1 - Info - Set variables
    04/15/2022 22:09:05:compress-jpg.ps1 - Info - Modify path to \\?\c:\temp\pdfs
    ПОДРОБНО: 04/15/2022 22:09:05:compress-jpg.ps1 - Verbose - Check access to \\?\c:\temp\pdfs
    04/15/2022 22:09:05:compress-jpg.ps1 - Info - Clean old jobs ns.comp_jpg*
    04/15/2022 22:09:05:compress-jpg.ps1 - Info - Enum files in \\?\c:\temp\pdfs
    ПОДРОБНО: 04/15/2022 22:09:05:compress-jpg.ps1 - Verbose - Check file \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\IMG_0656.JPG
    ПОДРОБНО: 04/15/2022 22:09:05:compress-jpg.ps1 - Verbose - Begin process file \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\IMG_0656.JPG
    ПОДРОБНО: 04/15/2022 22:09:05:compress-jpg.ps1 - Verbose - Run job ns.comp_jpg1829645567 for process file \\?\c:\temp\pdfs\long dirs\[testing]\with
    spaces\IMG_0656.JPG
    ...
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Args: force = True
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Args: filePathOriginal = \\?\c:\temp\pdfs\no rigths
    here\Victoria476b.jpg
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Args: filePathTemp = \\?\c:\temp\pdfs\no rigths
    here\tmp_Victoria476b.jpg
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Args: exePath = C:\tools\imagemagick\convert.exe
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Args: exeArgs = -resize 1920^ -strip -interlace Plane
    -sampling-factor 4:2:0 -quality 90%  "\\?\c:\temp\pdfs\no rigths here\Victoria476b.jpg" "\\?\c:\temp\pdfs\no rigths here\tmp_Victoria476b.jpg"
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Args: replaceOriginal = False
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Args: streamName = ns.comp_jpg
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Start process C:\tools\imagemagick\convert.exe
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Start args -resize 1920^ -strip -interlace Plane -sampling-factor
    4:2:0 -quality 90%  "\\?\c:\temp\pdfs\no rigths here\Victoria476b.jpg" "\\?\c:\temp\pdfs\no rigths here\tmp_Victoria476b.jpg"
    ПОДРОБНО: 04/15/2022 22:09:11:Process-job\compress-jpg.ps1 - ns.comp_jpg350218958 - Process exit with exitcode 1
    04/15/2022 22:09:11:compress-jpg.ps1 - Info - Save spaces 0 MB
    04/15/2022 22:09:11:compress-jpg.ps1 - Info - Work time 00:00:06.3750005
    04/15/2022 22:09:11:compress-jpg.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-jpg.ps1 -rootDir c:\temp\pdfs -ageDays 1 -Verbose *>&1 | out-file compress-jpg.log
#>

# set args and validate
[CmdletBinding()]
param(
    [string]
    [ValidateScript({Test-Path $_ -PathType "Container"})]
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
    $tmpPrefix = 'tmp_'
)
# Job code
$JobScript = {
    param($filePathOriginal,$filePathTemp,$exePath,$exeArgs,$replaceOriginal,$streamName)
    Set-StrictMode -Version Latest
    $ErrorActionPreference = 'stop'
    start-modify $filePathOriginal $filePathTemp $exePath $exeArgs $replaceOriginal $streamName -force
    }
#Main
$funcModule="$($PSScriptRoot)\func.ps1"
try {
    # Load func module
    . $funcModule
    Print-Message $(Get-FunctionName) 'Info' "Func module $($funcModule) check"
    $InitScript = get-command $funcModule | Select-Object -ExpandProperty ScriptBlock
    }
catch
    {
    Print-Message (Get-FunctionName) 'Error' $_
    }
Print-Message $(Get-FunctionName) 'Info' "Start script"
Set-StrictMode -Version Latest
Print-Message $(Get-FunctionName) 'Info' "Set variables"
$ErrorActionPreference = "continue"
# set vars (maybe in param)
$exePath = 'C:\tools\imagemagick\convert.exe'
$exeArgs = "-resize 1920^ -strip -interlace Plane -sampling-factor 4:2:0 -quality 90% "
$StartTime = get-date
$EstimatedStopTime = (get-date).addseconds($MaxRunSecond)

# fix for limits 256 chars in path
# posh 7 not support \\?\ syntax
if ($host.version.Major -lt 7)
    {
    Print-Message $(Get-FunctionName) 'Info' "Modify path to $($RootDir)"
    if ($RootDir -match '\\\\')
        {
        $RootDir = $RootDir.replace('\\','\\?\UNC\')
        }
    else
        {
        $RootDir = "\\?\$RootDir"
        }
    }

try {
    # simple check dir access
    Print-Message $(Get-FunctionName) 'Verbose' "Check access to $($RootDir)"
    $root = Get-Item -force $RootDir
    if ($null -eq $root)
        {
        Throw ("Error access to $($RootDir)")
        }
    $ProcessFiles = @()
    Print-Message $(Get-FunctionName) 'Info' "Clean old jobs $($JobPrefix)*"
    # remove old jobs, if exists
    Get-Job | Where-Object {$_.name -match $JobPrefix} | Remove-Job -Force
    Print-Message $(Get-FunctionName) 'Info' "Enum files in $($root.fullname)"
    # main process cycle
    foreach ($fileSelect in $root.EnumerateFiles($Mask,[system.io.SearchOption]::AllDirectories))
        {
        Print-Message $(Get-FunctionName) 'Verbose' "Check file $($fileSelect.fullname)"
        try 
            {
            # select files for processing.
            # compare age and NTFS stream have
            if (($fileSelect.LastWriteTime -le $(get-date).adddays(-$AgeDays))-and((get-item -Force -Stream * -LiteralPath "$($fileSelect.fullname)").stream -notcontains $StreamName))
                {
                Print-Message $(Get-FunctionName) 'Verbose' "Begin process file $($fileSelect.fullname)"
                $filePathTemp = Get-PathPre $fileSelect.fullname $TmpPrefix
                # generate name for jobs
                $JobName = $JobPrefix+$(get-random)
                # modify args
                $exeArgsForFile = "$($exeArgs) `"$($fileSelect.fullname)`" `"$filePathTemp`""
                Print-Message $(Get-FunctionName) 'Verbose' "Run job $JobName for process file $($fileSelect.fullname)"
                # start processing job
                Start-job -Name $JobName -InitializationScript $InitScript -ScriptBlock $JobScript -ArgumentList $($fileSelect.fullname),$filePathTemp,$exePath,$exeArgsForFile,$replaceOriginal,$streamName | out-null
                # if over MaxPorcess - wait
                while (@(get-job -state Running | Where-Object{$_.name -match $JobPrefix}).count -ge $MaxProcess)
                    {
                    # maybe very small?
                    Start-Sleep -Seconds 5
                    }
                # process complete job
                Process-job $JobPrefix
                $ProcessFiles += $fileSelect.FullName
                }
            }
        catch
            {
            Print-Message $(Get-FunctionName) 'Error' "File $($fileSelect.fullname) $_"
            }
        # Check runtime limit
        if ($(get-date) -gt $EstimatedStopTime)
            {
            Print-Message $(Get-FunctionName) 'Info' "Timeout $($MaxRunSecond) seconds out. Wait all job exited and stopping"
            break
            }
        }

    }
catch
    {
    Print-Message $(Get-FunctionName) 'Error' "$_"
    }
finally
    {
    # process retain jobs
    Get-Job | Where-Object{$_.name -match $JobPrefix} | Wait-Job | out-null
    Process-job $JobPrefix
    Print-Message $(Get-FunctionName) 'Info' "Save spaces $([math]::round((Get-ReportSave $ProcessFiles $StreamName)/1mb,2)) MB"
    $EndTime = get-date
    Print-Message $(Get-FunctionName) 'Info' "Work time $($EndTime-$StartTime)"
    Print-Message $(Get-FunctionName) 'Info' "End script"
    } 