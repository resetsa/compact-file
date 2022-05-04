#requires -version 3.0
<#
.SYNOPSIS
    Script for compress pdf file.
.DESCRIPTION
    Compess PDF file with external tool (GhostScript for windows).
    Use parallel process run and write info into alternative NTFS stream.
    Filter file for age in days.
.NOTES
    Name: compress-ap_pdf
    Author: Stepanenko S
    Version: 0.1
    DateCreated: 17.04.2022
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-ap_pdf.ps1 -rootDir C:\temp\pdfs\ -MaxProcess 4 -ageDays 1
    04/17/2022 20:59:31:compress-ap_pdf.ps1 - Info - Core module C:\tools\compress-pdf\core.ps1 load
    04/17/2022 20:59:31:compress-ap_pdf.ps1 - Info - Start script
    04/17/2022 20:59:31:compress-ap_pdf.ps1 - Info - Set variables
    04/17/2022 20:59:31:compress-ap_pdf.ps1 - Info - Modify path to C:\temp\pdfs\
    04/17/2022 20:59:31:compress-ap_pdf.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/17/2022 20:59:31:compress-ap_pdf.ps1 - Error - File \\?\C:\temp\pdfs\gsdll64.pdf Отказано в доступе
    04/17/2022 20:59:42:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 2964 - File \\?\C:\temp\pdfs\longdir\certificate_f.pdf process OK
    04/17/2022 20:59:42:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 4760 - File \\?\C:\temp\pdfs\longdir\thisfavoriteplace\whereusersislocaledownfiles\yes, with spaces\and certain spec symbols\as[]\nameas\my very favorite clients\full organisation name\AppForm_84789157.pdf process OK
    04/17/2022 20:59:42:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 15076 - File \\?\C:\temp\pdfs\otherdirs\Cisco Catalyst 1000.pdf process OK
    04/17/2022 20:59:52:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 10968 - File \\?\C:\temp\pdfs\aci_seminar-part1.pdf process OK
    04/17/2022 20:59:52:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 12468 - File \\?\C:\temp\pdfs\testdir\aci_seminar-part4.pdf process OK
    04/17/2022 21:00:02:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 1008 - File \\?\C:\temp\pdfs\testdir\aci_seminar-part3.pdf process OK
    04/17/2022 21:00:02:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 216 - File \\?\C:\temp\pdfs\testdir\certificate_kasp.pdf process OK
    04/17/2022 21:00:02:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 4612 - Run process for \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    04/17/2022 21:00:02:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 4612 - Exit code 1
    04/17/2022 21:00:02:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 4612 - GPL Ghostscript 9.56.1: Unrecoverable error, exit code 1
    04/17/2022 21:00:12:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 9764 - File \\?\C:\temp\pdfs\testdir\aci_seminar-part2.pdf process OK
    04/17/2022 21:00:12:compress-ap_pdf.ps1 - Info - Save spaces 0 MB
    04/17/2022 21:00:12:compress-ap_pdf.ps1 - Info - Work time 00:00:40.8370678
    04/17/2022 21:00:12:compress-ap_pdf.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-ap_pdf.ps1 -rootDir C:\temp\pdfs\ -MaxProcess 4 -ageDays 1 -ReplaceOriginal $true
    04/17/2022 21:00:41:compress-ap_pdf.ps1 - Info - Core module C:\tools\compress-pdf\core.ps1 load
    04/17/2022 21:00:41:compress-ap_pdf.ps1 - Info - Start script
    04/17/2022 21:00:41:compress-ap_pdf.ps1 - Info - Set variables
    04/17/2022 21:00:41:compress-ap_pdf.ps1 - Info - Modify path to C:\temp\pdfs\
    04/17/2022 21:00:41:compress-ap_pdf.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/17/2022 21:00:41:compress-ap_pdf.ps1 - Error - File \\?\C:\temp\pdfs\gsdll64.pdf Отказано в доступе
    04/17/2022 21:00:51:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 2420 - File \\?\C:\temp\pdfs\longdir\certificate_f.pdf process OK
    04/17/2022 21:00:51:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 13832 - File \\?\C:\temp\pdfs\longdir\thisfavoriteplace\whereusersislocaledownfiles\yes, with spaces\and certain spec symbols\as[]\nameas\my very favorite clients\full organisation name\AppForm_84789157.pdf process OK
    04/17/2022 21:00:51:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 14568 - File \\?\C:\temp\pdfs\otherdirs\Cisco Catalyst 1000.pdf process OK
    04/17/2022 21:01:01:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 1960 - File \\?\C:\temp\pdfs\aci_seminar-part1.pdf process OK
    04/17/2022 21:01:01:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 13768 - File \\?\C:\temp\pdfs\testdir\aci_seminar-part4.pdf process OK
    04/17/2022 21:01:12:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 7612 - File \\?\C:\temp\pdfs\testdir\certificate_kasp.pdf process OK
    04/17/2022 21:01:13:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 5580 - Run process for \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    04/17/2022 21:01:14:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 5580 - Exit code 1
    04/17/2022 21:01:14:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 5580 - GPL Ghostscript 9.56.1: Unrecoverable error, exit code 1
    04/17/2022 21:01:24:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 17036 - File \\?\C:\temp\pdfs\testdir\aci_seminar-part2.pdf process OK
    04/17/2022 21:01:24:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Info - 4600 - File \\?\C:\temp\pdfs\testdir\aci_seminar-part3.pdf process OK
    04/17/2022 21:01:25:compress-ap_pdf.ps1 - Info - Save spaces 6.95 MB
    04/17/2022 21:01:25:compress-ap_pdf.ps1 - Info - Work time 00:00:43.6349861
    04/17/2022 21:01:25:compress-ap_pdf.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-ap_pdf.ps1 -rootDir C:\temp\pdfs\ -MaxProcess 1 -ageDays 1 -ReplaceOriginal $true -Verbose
    04/17/2022 21:02:16:compress-ap_pdf.ps1 - Info - Core module C:\tools\compress-pdf\core.ps1 load
    04/17/2022 21:02:16:compress-ap_pdf.ps1 - Info - Start script
    04/17/2022 21:02:16:compress-ap_pdf.ps1 - Info - Set variables
    04/17/2022 21:02:16:compress-ap_pdf.ps1 - Info - Modify path to C:\temp\pdfs\
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check access to \\?\C:\temp\pdfs\
    04/17/2022 21:02:16:compress-ap_pdf.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\aci_seminar-part1.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\gsdll64.pdf
    04/17/2022 21:02:16:compress-ap_pdf.ps1 - Error - File \\?\C:\temp\pdfs\gsdll64.pdf Отказано в доступе
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\tmp_aci_seminar-part5.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\longdir\certificate_f.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\longdir\thisfavoriteplace\whereusersislocaledownfiles\yes, with spaces\and certain spec symbols\as[]\nameas\my very
    favorite clients\full organisation name\AppForm_84789157.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\otherdirs\Cisco Catalyst 1000.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\testdir\aci_seminar-part2.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\testdir\aci_seminar-part3.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\testdir\aci_seminar-part4.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\testdir\certificate_kasp.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Check file \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Begin process file \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Run for process file \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:Start-ModifyFileAsync\compress-ap_pdf.ps1 - Verbose - Args: force = True
    ПОДРОБНО: 04/17/2022 21:02:16:Start-ModifyFileAsync\compress-ap_pdf.ps1 - Verbose - Args: filePathOriginal = \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:Start-ModifyFileAsync\compress-ap_pdf.ps1 - Verbose - Args: filePathTemp = \\?\C:\temp\pdfs\_norigths\tmp_blackhatpython.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:Start-ModifyFileAsync\compress-ap_pdf.ps1 - Verbose - Args: exePath = C:\tools\gs\gs9.56.1\bin\gswin64c.exe
    ПОДРОБНО: 04/17/2022 21:02:16:Start-ModifyFileAsync\compress-ap_pdf.ps1 - Verbose - Args: exeArgs = -dBATCH -dQUIET -dNOPAUSE -dSAFER -dALLOWPSTRANSPARENCY -dEmbedAllFonts=true -dSubsetFonts=true
    -dPDFSETTINGS=/ebook -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dColorImageDownsampleThreshold=1 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144
    -dGrayImageDownsampleThreshold=1 -dMonoImageDownsampleType=/Subsample -dMonoImageResolution=144 -dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode -dGrayImageFilter=/DCTEncode
    -dMonoImageFilter=/CCITTFaxEncode -sDEVICE=pdfwrite -sOutputFile="\\?\C:\temp\pdfs\_norigths\tmp_blackhatpython.pdf" "\\?\C:\temp\pdfs\_norigths\blackhatpython.pdf"
    ПОДРОБНО: 04/17/2022 21:02:16:Start-ModifyFileAsync\compress-ap_pdf.ps1 - Verbose - Start process for \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:Start-ModifyFileAsync\compress-ap_pdf.ps1 - Verbose - Process 4996 will process file \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    ПОДРОБНО: 04/17/2022 21:02:16:compress-ap_pdf.ps1 - Verbose - Maxprocess 1 was reached. Waiting finish running process
    ПОДРОБНО: 04/17/2022 21:02:26:compress-ap_pdf.ps1 - Verbose - Process result from 4996
    ПОДРОБНО: 04/17/2022 21:02:26:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Verbose - 4996 - Exit with exitcode 1
    ПОДРОБНО: 04/17/2022 21:02:26:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Verbose - 4996 - Remove tmp file \\?\C:\temp\pdfs\_norigths\tmp_blackhatpython.pdf
    04/17/2022 21:02:26:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 4996 - Run process for \\?\C:\temp\pdfs\_norigths\blackhatpython.pdf
    04/17/2022 21:02:26:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 4996 - Exit code 1
    04/17/2022 21:02:26:Get-ModifyAsyncResult\compress-ap_pdf.ps1 - Error - 4996 - GPL Ghostscript 9.56.1: Unrecoverable error, exit code 1
    04/17/2022 21:02:26:compress-ap_pdf.ps1 - Info - Save spaces 0 MB
    04/17/2022 21:02:26:compress-ap_pdf.ps1 - Info - Work time 00:00:10.1608420
    04/17/2022 21:02:26:compress-ap_pdf.ps1 - Info - End script
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
    [int]$ageDays=1,
    # Set replace original file
    [bool]$ReplaceOriginal,
    [ValidateRange(1,20)]
    # Set max parallel compress job
    [int]$MaxProcess=1,
    # Set prefix for compress jobs
    [string]$JobPrefix='ns.comp_pdf',
    # Set alternative NTFS stream name for saving info
    [string]$StreamName='ns.comp_pdf',
    # Set max run time in seconds
    [int]$MaxRunSecond=86400,
    # Set mask for processing files
    [string]$mask = "*.pdf",
    # Set prefix name for files
    $tmpPrefix = 'tmp_',
    [ValidateScript({if (Test-Path -LiteralPath $_ -PathType "Leaf") {$true} else {throw "Path $_ not found"}})]
    # Set path to exe
    [string]$exePath = 'C:\tools\gs\gs9.56.1\bin\gswin64c.exe',
    [ValidateSet(72,100,144,150,300)]
    # Set DPI
    [int]$dpi=144
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
$exeArgs = -join @(
    "-dBATCH -dQUIET -dNOPAUSE -dSAFER -dALLOWPSTRANSPARENCY "
    "-dEmbedAllFonts=true -dSubsetFonts=true -dPDFSETTINGS=/ebook "
    "-dColorImageDownsampleType=/Bicubic -dColorImageResolution=$($dpi) -dColorImageDownsampleThreshold=1 "
    "-dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=$($dpi) -dGrayImageDownsampleThreshold=1 "
#    "-dMonoImageDownsampleType=/Subsample -dMonoImageResolution=$($dpi) "
    "-dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode -dGrayImageFilter=/DCTEncode -dMonoImageFilter=/CCITTFaxEncode"
    )
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
                # modify args and fix % for gswin64c
                $exeArgsForFile = "$($exeArgs) -sDEVICE=pdfwrite -sOutputFile=`"$($filePathTemp -replace "%","%%")`" `"$($fileSelect.fullname)`""
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
            $ProcessFiles += $proc.filePathOriginal
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
        $ProcessFiles += $proc.filePathOriginal
        }
    Write-LogMessage $(Get-FunctionName) 'Info' "Save spaces $([math]::round((Get-ReportSave $ProcessFiles $StreamName)/1mb,2)) MB"
    $EndTime = get-date
    Write-LogMessage $(Get-FunctionName) 'Info' "Work time $($EndTime-$StartTime)"
    Write-LogMessage $(Get-FunctionName) 'Info' "End script"
    }