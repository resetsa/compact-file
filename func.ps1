#requires -version 3.0

function Print-Message 
    {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$module,
        [Parameter(Mandatory)]
        [ValidateSet("Info","Error","Verbose")]
        [string]$level,
        [Parameter(Mandatory)]
        [string]$message
        )
    if ($level -eq 'Verbose') 
        {
        Write-Verbose "$(get-date):$module - $level - $message"
        }
    else
        {
        Write-Output "$(get-date):$module - $level - $message"
        }
    }

function Get-FunctionName {
        (Get-Variable MyInvocation -Scope 1).Value.MyCommand.Name;
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
        $CompressFilesize = $OrigFilesize = (get-item -force -literalpath $name).length
        if ((get-item -force -literalpath $name -Stream *).stream -contains $StreamName)
            {
            $OrigFilesize = (get-content -force -literalpath $name -Stream $StreamName | convertfrom-json).length
            }
        $result += $OrigFilesize - $CompressFilesize
        }
    return $result
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
            Print-Message $(Get-FunctionName) 'Info' "Process $($result.filePathOriginal) OK"
            }
        else
            {
            Print-Message $(Get-FunctionName) 'Error' "Process $($result.filePathOriginal)"
            Print-Message $(Get-FunctionName) 'Error' "$($job.name) - Errorcode $($result.exitCode)"
            Print-Message $(Get-FunctionName) 'Error' "$($job.name) - Message $($result.errorMessage)"
            }
        foreach ($l in $result.log) { Write-Verbose "$(Get-date):$(Get-FunctionName) - $($job.name) - $l"}
        Remove-job $job.id
        }
    foreach ($job in (get-job -state Failed | Where-Object {$_.name -match $Prefix}))
        {
        Print-Message $(Get-FunctionName) 'Error' "$($job.name) - $($job.ChildJobs[0].JobStateInfo.Reason.Message)"
        Remove-job $job.id
        }
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
function start-modify {
    [CmdletBinding()]
    param(
        [switch]$force,
        [string]
        [ValidateScript({Test-Path -LiteralPath $_ -PathType "Leaf"})]
        [Parameter(Mandatory)]
        # File path for processing
        $filePathOriginal,
        [string]
        [ValidateScript({(-not(Test-Path $_))-or($PSBoundParameters.Keys -contains 'force')})]
        [Parameter(Mandatory)]
        # Tmp file path
        $filePathTemp,
        [string]
        [ValidateScript({Test-Path $_ -PathType "Leaf"})]
        [Parameter(Mandatory)]
        # Program to run
        $exePath,
        [Parameter(Mandatory)]
        # Program to run
        $exeArgs,
        # Set replace original file
        [bool]$replaceOriginal=$false,
        # Set alternative NTFS stream name for saving info
        [string]$streamName='ns.mod'

    )

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

    # create result hashtable
    $result=[ordered]@{}
    $result.filePathOriginal = $filePathOriginal
    $result.filePathTemp = $filePathTemp
    $result.exitCode = 255
    $result.errorMessage = $null
    $result.replaceOriginal = $replaceOriginal
    $result.log = @()

    # print all param
    foreach ($key in $PSBoundParameters.Keys)
        {
        $result.log += ("Args: $($key) = $($PSBoundParameters[$key])")        
        }
    
    # set process param
    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = $exePath
    $pinfo.RedirectStandardError = $false
    $pinfo.RedirectStandardOutput = $false
    $pinfo.UseShellExecute = $false
    $pinfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
    # hide window
    $pinfo.CreateNoWindow = $true
    $pinfo.Arguments = $exeArgs
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
            #$result.errormessage = $($p.StandardError.ReadToEnd().trim())
            #Clean tmp file
            if (Test-Path $filePathTemp)
                {
                $result.log += ("Remove tmp file $($filePathTemp)")
                Remove-Item $filePathTemp
                }
            }
        else
            {
            $result.log += ("Process exitcode 0")
            if ($replaceOriginal)
                {
                $result.log += ("Select remove original file")
                $fileinfo_original = get-item -LiteralPath $filePathOriginal
                $fileinfo_temp = get-item -LiteralPath $filePathTemp
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
                    $result.replaceOriginal = $false
                    }
                else 
                    {
                    $result.log += ("Write info to alt NTFS stream in file $filePathOriginal")
                    convertto-json $fileinfo_stream | Set-Content -LiteralPath $filePathTemp -stream $streamName -force
                    $result.log += ("Move to original file $($filePathOriginal)")
                    Move-Item -LiteralPath $filePathTemp -Destination $filePathOriginal -Force
                    $result.replaceOriginal = $true
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

