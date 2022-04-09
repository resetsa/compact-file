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
    Version: 0.1
    DateCreated: 08.04.2022
.EXAMPLE
    PS C:\tools\pdf-compress> .\compress-pdf.ps1 -RootDir c:\temp -AgeDays 1 -ReplaceOriginal $true -MaxProcess 3                                                                                                    04/09/2022 20:59:25:compress-pdf.ps1 - Start script
    04/09/2022 20:59:25:compress-pdf.ps1 - Set variables
    04/09/2022 20:59:25:compress-pdf.ps1 - Modify path to \\?\c:\temp
    04/09/2022 20:59:25:compress-pdf.ps1 - Clean old jobs ns.comp_pdf*
    04/09/2022 20:59:25:compress-pdf.ps1 - Enum files in \\?\c:\temp\
    04/09/2022 20:59:46:Process-job - Process \\?\c:\temp\pdfs\Diving Deep Into Kubernetes Networking.pdf OK
    04/09/2022 21:00:00:Process-job - Process \\?\c:\temp\pdfs\CIS_CentOS_Linux_7_Benchmark_v3.0.0.pdf OK
    04/09/2022 21:00:00:Process-job - Process \\?\c:\temp\pdfs\CIS_Distribution_Independent_Linux_Benchmark_v2.0.0.pdf OK
    04/09/2022 21:00:07:Process-job - Process \\?\c:\temp\pdfs\Docker Security Adrian Mouat.pdf OK
    04/09/2022 21:00:07:Process-job - Process \\?\c:\temp\pdfs\jpeg_as_pdf.pdf Error
    04/09/2022 21:00:24:Process-job - Process \\?\c:\temp\pdfs\Python Programming for Beginners. The Compl Begin Guide.pdf OK
    04/09/2022 21:00:24:compress-pdf.ps1 - Save spaces 4.59 MB
    04/09/2022 21:00:24:compress-pdf.ps1 - Work time 00:00:59.1874291
    04/09/2022 21:00:24:compress-pdf.ps1 - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-pdf.ps1 -RootDir c:\temp -AgeDays 1 -Verbose
    04/09/2022 21:11:22:compress-pdf.ps1 - Start script
    04/09/2022 21:11:22:compress-pdf.ps1 - Set variables
    04/09/2022 21:11:22:compress-pdf.ps1 - Modify path to \\?\c:\temp
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Check access to \\?\c:\temp
    04/09/2022 21:11:22:compress-pdf.ps1 - Clean old jobs ns.comp_pdf*
    04/09/2022 21:11:22:compress-pdf.ps1 - Enum files in \\?\c:\temp\
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\CIS_CentOS_Linux_7_Benchmark_v3.0.0.pdf
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\CIS_Distribution_Independent_Linux_Benchmark_v2.0.0.pdf
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\Diving Deep Into Kubernetes Networking.pdf
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\Docker Security Adrian Mouat.pdf
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Begin process file \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Run job ns.comp_pdf62598351 for process file \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
    ПОДРОБНО: 04/09/2022 21:11:22:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\Python Programming for Beginners. The Compl Begin Guide.pdf
    04/09/2022 21:11:25:Process-job - Process \\?\c:\temp\pdfs\jpeg_as_pdf.pdf Error
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Errorcode 1
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Error messsage GPL Ghostscript 9.56.1: Unrecoverable error, exit code 1
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Args: filepath_original = \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Args: filepath_temp = \\?\c:\temp\pdfs\tmp_jpeg_as_pdf.pdf
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Args: remove_original = False
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Args: alt_streamname = ns.comp_pdf
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Start process C:\tools\gs\gs9.56.1\bin\gswin64c.exe
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Start args -dBATCH -dQUIET -dNOPAUSE -dSAFER -dALLOWPSTRANSPARENCY -dEmbedAllFonts=true -dSubsetFonts=true -dPDFSETTINGS=/ebook
    -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dColorImageDownsampleThreshold=1 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dGrayImageDownsampleThreshold=1
    -dMonoImageDownsampleType=/Subsample -dMonoImageResolution=144 -dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode -dGrayImageFilter=/DCTEncode -dMonoImageFilter=/CCITTFaxEncode -sDEVICE=pdfwrite
    -sOutputFile="\\?\c:\temp\pdfs\tmp_jpeg_as_pdf.pdf" "\\?\c:\temp\pdfs\jpeg_as_pdf.pdf"
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Process exit with exitcode 1
    ПОДРОБНО: 04/09/2022 21:11:25:Process-job - ns.comp_pdf62598351 - Remove tmp file \\?\c:\temp\pdfs\tmp_jpeg_as_pdf.pdf
    04/09/2022 21:11:25:compress-pdf.ps1 - Save spaces 0 MB
    04/09/2022 21:11:25:compress-pdf.ps1 - Work time 00:00:02.8906258
    04/09/2022 21:11:25:compress-pdf.ps1 - End script
#>

# set args and validate
[CmdletBinding()]

param(
    [string]
    [ValidateScript({Test-Path $_ -PathType "Container"})]
    [Parameter(Mandatory)]
    # Set root dir for processing
    $RootDir,
    [ValidateRange(1,[int]::MaxValue)]
    # Set days age for processing file
    [int]$AgeDays=5*360,
    # Set replace original file
    [bool]$ReplaceOriginal=$false,
    [ValidateRange(1,20)]
    # Set max parallel compress job
    [int]$MaxProcess=10,
    # Set prefix for compress jobs
    [string]$JobPrefix='ns.comp_pdf',
    # Set alternative NTFS stream name for saving info
    [string]$StreamName='ns.comp_pdf',
    # Set max run time in seconds
    [int]$MaxRunSecond=86400
)

function Get-FunctionName {
    (Get-Variable MyInvocation -Scope 1).Value.MyCommand.Name;
}

function Get-PathPre($filepath,$prefix)
    <#
    .SYNOPSIS
    Generate tmp filename
    #>
    {
    $path_array=$filepath -split '\\'
    $path_array[-1] = $prefix + $path_array[-1]
    $result = [string]::join('\',$path_array)
    return $result
    }

function Get-ReportSave ([string[]]$Files,$StreamName)
    {
    <#
    .SYNOPSIS
    Get saved bytes after compress
    #>
    $result = 0
    foreach ($name in $Files)
        {
        $CompressFilesize = $OrigFilesize = (get-item -literalpath $name).length
        if ((get-item -literalpath $name -Stream *).stream -contains $StreamName)
            {
            $OrigFilesize = (get-content -literalpath $name -Stream $StreamName | convertfrom-json).length
            }
        $result += $OrigFilesize - $CompressFilesize
        }
    return $result
    }

# Job code
$JobScript = {
    param($filepath_original,$filepath_temp,$remove_original,$alt_streamname)
    Set-StrictMode -Version Latest
    $ErrorActionPreference = 'stop'
    function Copy-Property{
        [CmdletBinding()]
        param([Parameter(ValueFromPipeline=$true)]$InputObject,
        $SourceObject,
        [string[]]$Property,
        [switch]$Passthru)
        $passthruHash=@{Passthru=$passthru.IsPresent}
        $propHash=@{}
        $property | Foreach-Object {$propHash+=@{$_=$SourceObject.$_}}
        $inputObject | Add-Member -NotePropertyMembers $propHash @passthruHash
        }

    # set variable
    $exe = 'C:\tools\gs\gs9.56.1\bin\gswin64c.exe'
    $exe_args = -join @(
        "-dBATCH -dQUIET -dNOPAUSE -dSAFER -dALLOWPSTRANSPARENCY "
        "-dEmbedAllFonts=true -dSubsetFonts=true -dPDFSETTINGS=/ebook "
        "-dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dColorImageDownsampleThreshold=1 "
        "-dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dGrayImageDownsampleThreshold=1 "
        "-dMonoImageDownsampleType=/Subsample -dMonoImageResolution=144 "
        "-dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode -dGrayImageFilter=/DCTEncode -dMonoImageFilter=/CCITTFaxEncode"
        " -sDEVICE=pdfwrite -sOutputFile=`"$filepath_temp`" `"$filepath_original`""
        )
    
    # create result hashtable
    $result=[ordered]@{}
    $result.filepath = $filepath_original
    $result.filepath_tmp = $filepath_temp
    $result.exitcode = 255
    $result.errormessage = $null
    $result.replace_original = $remove_original
    $result.log = @()
    
    # print all param
    foreach ($key in $PSBoundParameters.Keys)
        {
        $result.log += ("Args: $($key) = $($PSBoundParameters[$key])")        
        }
    
    # set process param
    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = $exe
    $pinfo.RedirectStandardError = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute = $false
    $pinfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
    # hide window
    $pinfo.CreateNoWindow = $true
    $pinfo.Arguments = $exe_args
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    try {
        $result.log += ("Start process $($pinfo.FileName)")
        $result.log += ("Start args $($pinfo.Arguments)")
        $p.Start() | Out-Null
        $p.WaitForExit()
        $result.exitcode = $p.exitcode
        # check compact ok
        if ($result.exitcode -ne 0)
            {
            $result.log += ("Process exit with exitcode $($p.exitcode)")
            $result.errormessage = $($p.StandardError.ReadToEnd().trim())
            #Clean tmp file
            if (Test-Path $filepath_temp)
                {
                $result.log += ("Remove tmp file $($filepath_temp)")
                Remove-Item $filepath_temp
                }
            }
        else
            {
            $result.log += ("Process exitcode 0")
            if ($remove_original)
                {
                $result.log += ("Select remove original file")
                $fileinfo_original = get-item -LiteralPath $filepath_original
                $fileinfo_temp = get-item -LiteralPath $filepath_temp
                $fileinfo_stream = New-Object psobject
                $fileinfo_stream | Copy-Property -SourceObject $fileinfo_original -Property fullname,length,CreationTime,LastAccessTime,LastWriteTime -Passthru | out-null
                $fileinfo_stream | Add-Member -MemberType NoteProperty -Name 'Compressed' -Value $true
                #in some case tmp file size over original (
                if  ($fileinfo_original.length -le $fileinfo_temp.length)
                    {
                    $result.log += ("Original file size smaller then temp file size")
                    $result.log += ("Write info to alt NTFS stream in file $filepath_original")
                    convertto-json $fileinfo_stream | Set-Content -LiteralPath $filepath_original -stream $alt_streamname -force
                    $result.log += ("Remove tmp file $($filepath_temp)")
                    remove-item -LiteralPath $filepath_temp
                    $result.replace_original = $false
                    }
                else 
                    {
                    $result.log += ("Write info to alt NTFS stream in file $filepath_original")
                    convertto-json $fileinfo_stream | Set-Content -LiteralPath $filepath_temp -stream $alt_streamname -force
                    $result.log += ("Move to original file $($filepath_original)")
                    Move-Item -LiteralPath $filepath_temp -Destination $filepath_original -Force
                    $result.replace_original = $true
                    }
                }
            }
        }
    catch
        {
        $result.errormessage = $Error[0].Exception.Message
        }
    finally
        {
        # Return result object
        New-Object -TypeName psobject -Property $result
        }
    }

function Process-job($Prefix)
    {
    <#
    .SYNOPSIS
    Process and output result object from jobs
    #>
    foreach ($job in (get-job -state Completed -HasMoreData $true | Where-Object{$_.name -match $Prefix}))
        {
        $result = Receive-Job $job.id
        if ($result.exitcode -eq 0)
            {
            Write-Output "$(Get-date):$(Get-FunctionName) - Process $($result.Filepath) OK"
            }
        else
            {
            Write-Output "$(Get-date):$(Get-FunctionName) - Process $($result.Filepath) Error"
            Write-Verbose "$(Get-date):$(Get-FunctionName) - $($job.name) - Errorcode $($result.Exitcode)"
            Write-Verbose "$(Get-date):$(Get-FunctionName) - $($job.name) - Error messsage $($result.Errormessage)"
            }
        foreach ($l in $result.log) { Write-Verbose "$(Get-date):$(Get-FunctionName) - $($job.name) - $l"}
        Remove-job $job.id
        }
    foreach ($job in (get-job -state Failed | Where-Object {$_.name -match $Prefix}))
        {
        Write-Verbose "$(Get-date):$(Get-FunctionName) - $($job.name) - Error - $($job.ChildJobs[0].JobStateInfo.Reason.Message)"
        Remove-job $job.id
        }
    }

#Main
Write-output "$(Get-date):$(Get-FunctionName) - Start script"
Set-StrictMode -Version Latest

Write-output "$(Get-date):$(Get-FunctionName) - Set variables"
$ErrorActionPreference = "continue"

# set vars (maybe in param)
$Mask = "*.pdf"
$TmpPrefix = 'tmp_'

$StartTime = get-date
$EstimatedStopTime = (get-date).addseconds($MaxRunSecond)

# fix for limits 256 chars in var
if ($RootDir -match '\\\\')
    {
    $RootDir = $RootDir.replace('\\','\\?\UNC\')
    }
else
    {
    $RootDir = "\\?\$RootDir"
    }

Write-output "$(Get-date):$(Get-FunctionName) - Modify path to $($RootDir)"
try {
    # simple check dir access
    Write-Verbose "$(Get-date):$(Get-FunctionName) - Check access to $($RootDir)"
    $root = Get-Item $RootDir
    if ($null -eq $root)
        {
        Throw ("Error access to $($RootDir)")
        }

    $ProcessFiles = @()

    Write-output "$(Get-date):$(Get-FunctionName) - Clean old jobs $($JobPrefix)*"
    # remove old jobs, if exists
    Get-Job | Where-Object {$_.name -match $JobPrefix} | Remove-Job -Force
    Write-output "$(Get-date):$(Get-FunctionName) - Enum files in $($root.fullname)"
    # main process cycle
    foreach ($pdf in $root.EnumerateFiles($Mask,[system.io.SearchOption]::AllDirectories))
        {
        Write-Verbose "$(Get-date):$(Get-FunctionName) - Check file $($pdf.fullname)"
        # select files for processing.
        # compare age and NTFS stream have
        if (($pdf.LastWriteTime -le $(get-date).adddays(-$AgeDays))-and((get-item -Stream * -LiteralPath "$($pdf.fullname)").stream -notcontains $StreamName))
            {
            Write-Verbose "$(Get-date):$(Get-FunctionName) - Begin process file $($pdf.fullname)"
            $FilepathTmp = Get-PathPre $pdf.fullname $TmpPrefix
            # generate name for jobs
            $JobName = $JobPrefix+$(get-random)
            Write-Verbose "$(Get-date):$(Get-FunctionName) - Run job $JobName for process file $($pdf.fullname)"
            # start processing job
            Start-job -Name $JobName -ScriptBlock $JobScript -ArgumentList $($pdf.fullname),$FilepathTmp,$ReplaceOriginal,$StreamName | out-null
            # if over MaxPorcess - wait
            while (@(get-job -state Running | Where-Object{$_.name -match $JobPrefix}).count -ge $MaxProcess)
                {
                # maybe very small?
                Start-Sleep -Seconds 5
                }
            # process complete job
            Process-job $JobPrefix
            $ProcessFiles += $pdf.FullName
            }
        # Check runtime limit
        if ($(get-date) -gt $EstimatedStopTime)
            {
            Write-output "$(Get-date):$(Get-FunctionName) - Timeout $($MaxRunSecond) seconds out. Wait all job exited and stopping"
            break
            }
        }

    # process retain jobs
    Get-Job | Where-Object{$_.name -match $JobPrefix} | Wait-Job | out-null
    Process-job $JobPrefix
    Write-output "$(Get-date):$(Get-FunctionName) - Save spaces $([math]::round((Get-ReportSave $ProcessFiles $StreamName)/1mb,2)) MB"
    }
catch
    {
    Write-Error "$(Get-date):$(Get-FunctionName) - $_"
    }
finally
    {
    $EndTime = get-date
    Write-output "$(Get-date):$(Get-FunctionName) - Work time $($EndTime-$StartTime)"
    Write-output "$(Get-date):$(Get-FunctionName) - End script"
    } 