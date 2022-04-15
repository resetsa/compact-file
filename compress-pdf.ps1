#requires -version 3.0
<#
.SYNOPSIS
    Script for compress pdf file.
.DESCRIPTION
    Compess PDF file with external tool (GhostScript for windows).
    Use parallel jobs and write info into alternative NTFS stream.
    Filter file for age in days.
.NOTES
    Name: compress-pdf
    Author: Stepanenko S
    Version: 0.2
    DateCreated: 15.04.2022
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-pdf.ps1 -rootDir c:\temp\pdfs -ageDays 1
    04/15/2022 22:13:26:compress-pdf.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:13:26:compress-pdf.ps1 - Info - Start script
    04/15/2022 22:13:26:compress-pdf.ps1 - Info - Set variables
    04/15/2022 22:13:26:compress-pdf.ps1 - Info - Modify path to \\?\c:\temp\pdfs
    04/15/2022 22:13:26:compress-pdf.ps1 - Info - Clean old jobs ns.comp_pdf*
    04/15/2022 22:13:26:compress-pdf.ps1 - Info - Enum files in \\?\c:\temp\pdfs
    04/15/2022 22:13:56:Process-job\compress-pdf.ps1 - Error - Process \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\aci_seminar-part2.pdf
    04/15/2022 22:13:56:Process-job\compress-pdf.ps1 - Error - ns.comp_pdf1860102518 - Errorcode 1
    04/15/2022 22:13:56:Process-job\compress-pdf.ps1 - Info - Process \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\tmp_aci_seminar-part2.pdf OK
    04/15/2022 22:13:56:Process-job\compress-pdf.ps1 - Error - Process \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\very long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over limit namesdirs\and this name use veru rare\admin never view in this place\but stupid users create file\in this place\anything also + test\bubum names\what length this\aci_seminar-part1.pdf
    04/15/2022 22:13:56:Process-job\compress-pdf.ps1 - Error - ns.comp_pdf618502194 - Errorcode 1
    04/15/2022 22:13:56:Process-job\compress-pdf.ps1 - Info - Process \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\very long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over limit namesdirs\and this name use veru rare\admin never view in this place\but stupid users create file\in this place\anything also + test\bubum names\what length this\tmp_aci_seminar-part1.pdf OK
    04/15/2022 22:13:56:compress-pdf.ps1 - Info - Save spaces 0 MB
    04/15/2022 22:13:56:compress-pdf.ps1 - Info - Work time 00:00:30.0431390
    04/15/2022 22:13:56:compress-pdf.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-pdf.ps1 -rootDir c:\temp\pdfs -ageDays 1 -Verbose
    04/15/2022 22:14:18:compress-pdf.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:14:18:compress-pdf.ps1 - Info - Start script
    04/15/2022 22:14:18:compress-pdf.ps1 - Info - Set variables
    04/15/2022 22:14:18:compress-pdf.ps1 - Info - Modify path to \\?\c:\temp\pdfs
    ПОДРОБНО: 04/15/2022 22:14:18:compress-pdf.ps1 - Verbose - Check access to \\?\c:\temp\pdfs
    04/15/2022 22:14:18:compress-pdf.ps1 - Info - Clean old jobs ns.comp_pdf*
    04/15/2022 22:14:18:compress-pdf.ps1 - Info - Enum files in \\?\c:\temp\pdfs
    ПОДРОБНО: 04/15/2022 22:14:18:compress-pdf.ps1 - Verbose - Check file \\?\c:\temp\pdfs\aci_seminar-part4.pdf
    ПОДРОБНО: 04/15/2022 22:14:18:compress-pdf.ps1 - Verbose - Check file \\?\c:\temp\pdfs\certificate.pdf
    ПОДРОБНО: 04/15/2022 22:14:18:compress-pdf.ps1 - Verbose - Check file \\?\c:\temp\pdfs\certificate_kasp.pdf
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf2016995540 - Args: force = True
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf2016995540 - Args: filePathOriginal = \\?\c:\temp\pdfs\long
    dirs\[testing]\with spaces\aci_seminar-part2.pdf
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf2016995540 - Args: filePathTemp = \\?\c:\temp\pdfs\long dirs\[testing]\with
    spaces\tmp_aci_seminar-part2.pdf
    ...
    04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - Info - Process \\?\c:\temp\pdfs\long dirs\[testing]\with spaces\very long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over limit namesdirs\and this name use veru rare\admin never view in this place\but stupid users create file\in this place\anything also + test\bubum names\what length this\tmp_aci_seminar-part1.pdf OK
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Args: force = True
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Args: filePathOriginal = \\?\c:\temp\pdfs\long dirs\[testing]\with
     spaces\very long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over limit namesdirs\and this name use veru
    rare\admin never view in this place\but stupid users create file\in this place\anything also + test\bubum names\what length
    this\tmp_aci_seminar-part1.pdf
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Args: filePathTemp = \\?\c:\temp\pdfs\long dirs\[testing]\with
    spaces\very long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over limit namesdirs\and this name use veru
    rare\admin never view in this place\but stupid users create file\in this place\anything also + test\bubum names\what length
    this\tmp_tmp_aci_seminar-part1.pdf
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Args: exePath = C:\tools\gs\gs9.56.1\bin\gswin64c.exe
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Args: exeArgs = -dBATCH -dQUIET -dNOPAUSE -dSAFER
    -dALLOWPSTRANSPARENCY -dEmbedAllFonts=true -dSubsetFonts=true -dPDFSETTINGS=/ebook -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144
    -dColorImageDownsampleThreshold=1 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dGrayImageDownsampleThreshold=1
    -dMonoImageDownsampleType=/Subsample -dMonoImageResolution=144 -dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode
    -dGrayImageFilter=/DCTEncode -dMonoImageFilter=/CCITTFaxEncode -sDEVICE=pdfwrite -sOutputFile="\\?\c:\temp\pdfs\long dirs\[testing]\with spaces\very
    long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over limit namesdirs\and this name use veru rare\admin never
     view in this place\but stupid users create file\in this place\anything also + test\bubum names\what length this\tmp_tmp_aci_seminar-part1.pdf"
    "\\?\c:\temp\pdfs\long dirs\[testing]\with spaces\very long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over
    limit namesdirs\and this name use veru rare\admin never view in this place\but stupid users create file\in this place\anything also + test\bubum
    names\what length this\tmp_aci_seminar-part1.pdf"
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Args: replaceOriginal = False
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Args: streamName = ns.comp_pdf
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Start process C:\tools\gs\gs9.56.1\bin\gswin64c.exe
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Start args -dBATCH -dQUIET -dNOPAUSE -dSAFER -dALLOWPSTRANSPARENCY
     -dEmbedAllFonts=true -dSubsetFonts=true -dPDFSETTINGS=/ebook -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144
    -dColorImageDownsampleThreshold=1 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dGrayImageDownsampleThreshold=1
    -dMonoImageDownsampleType=/Subsample -dMonoImageResolution=144 -dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode
    -dGrayImageFilter=/DCTEncode -dMonoImageFilter=/CCITTFaxEncode -sDEVICE=pdfwrite -sOutputFile="\\?\c:\temp\pdfs\long dirs\[testing]\with spaces\very
    long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over limit namesdirs\and this name use veru rare\admin never
     view in this place\but stupid users create file\in this place\anything also + test\bubum names\what length this\tmp_tmp_aci_seminar-part1.pdf"
    "\\?\c:\temp\pdfs\long dirs\[testing]\with spaces\very long string descriptions\this is process name\clients identifcations\+100Clinetnames\also over
    limit namesdirs\and this name use veru rare\admin never view in this place\but stupid users create file\in this place\anything also + test\bubum
    names\what length this\tmp_aci_seminar-part1.pdf"
    ПОДРОБНО: 04/15/2022 22:14:50:Process-job\compress-pdf.ps1 - ns.comp_pdf933385859 - Process exitcode 0
    04/15/2022 22:14:50:compress-pdf.ps1 - Info - Save spaces 0 MB
    04/15/2022 22:14:50:compress-pdf.ps1 - Info - Work time 00:00:31.5830729
    04/15/2022 22:14:50:compress-pdf.ps1 - Info - End script
.EXAMPLE
    .\compress-pdf.ps1 -rootDir c:\temp\pdfs -ageDays 1 -Verbose *>&1 | out-file compress-pdf.log 
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
    [bool]$ReplaceOriginal,
    [ValidateRange(1,20)]
    # Set max parallel compress job
    [int]$MaxProcess=10,
    # Set prefix for compress jobs
    [string]$JobPrefix='ns.comp_pdf',
    # Set alternative NTFS stream name for saving info
    [string]$StreamName='ns.comp_pdf',
    # Set max run time in seconds
    [int]$MaxRunSecond=86400,
    # Set mask for processing files
    [string]$mask = "*.pdf",
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
$exePath = 'C:\tools\gs\gs9.56.1\bin\gswin64c.exe'
$exeArgs = -join @(
    "-dBATCH -dQUIET -dNOPAUSE -dSAFER -dALLOWPSTRANSPARENCY "
    "-dEmbedAllFonts=true -dSubsetFonts=true -dPDFSETTINGS=/ebook "
    "-dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dColorImageDownsampleThreshold=1 "
    "-dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dGrayImageDownsampleThreshold=1 "
    "-dMonoImageDownsampleType=/Subsample -dMonoImageResolution=144 "
    "-dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode -dGrayImageFilter=/DCTEncode -dMonoImageFilter=/CCITTFaxEncode"
    )
$StartTime = get-date
$EstimatedStopTime = (get-date).addseconds($MaxRunSecond)
# fix for limits 256 chars in path
if ($RootDir -match '\\\\')
    {
    $RootDir = $RootDir.replace('\\','\\?\UNC\')
    }
else
    {
    $RootDir = "\\?\$RootDir"
    }
Print-Message $(Get-FunctionName) 'Info' "Modify path to $($RootDir)"
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
                $exeArgsForFile = "$($exeArgs) -sDEVICE=pdfwrite -sOutputFile=`"$filePathTemp`" `"$($fileSelect.fullname)`""
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
            continue
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
    Get-Job | Where-Object{$_.name -match $JobPrefix} | Wait-Job | Out-null
    Process-job $JobPrefix
    Print-Message $(Get-FunctionName) 'Info' "Save spaces $([math]::round((Get-ReportSave $ProcessFiles $StreamName)/1mb,2)) MB"
    $EndTime = get-date
    Print-Message $(Get-FunctionName) 'Info' "Work time $($EndTime-$StartTime)"
    Print-Message $(Get-FunctionName) 'Info' "End script"
    }