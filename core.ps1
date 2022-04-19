#requires -version 3.0
function Write-LogMessage 
    {
    <#
    .SYNOPSIS
    Print message
    #>
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

function Get-FunctionName ([string]$delim='\')
    {
    <#
    .SYNOPSIS
    Return hierarchy module/func name
    #>
    $filters = @('<ScriptBlock>',$(Get-PSCallStack)[0].FunctionName)
    [string]::join($delim,((Get-PSCallStack).Command | Where-Object {$filters -notcontains $_}))
    }

function Get-ResultJob($Prefix)
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
            Write-LogMessage $(Get-FunctionName) 'Info' "Process $($result.filePathOriginal) OK"
            }
        else
            {
            Write-LogMessage $(Get-FunctionName) 'Error' "Process $($result.filePathOriginal)"
            Write-LogMessage $(Get-FunctionName) 'Error' "$($job.name) - Errorcode $($result.exitCode)"
            #Write-LogMessage $(Get-FunctionName) 'Error' "$($job.name) - Message $($result.errorMessage)"
            if ($null -ne $result.errorMessage) { Write-LogMessage $(Get-FunctionName) 'Error' "$($job.name) - Message $($result.errorMessage)" }
            }
        foreach ($l in $result.log) { Write-Verbose "$(Get-date):$(Get-FunctionName) - $($job.name) - $l"}
        Remove-job $job.id
        }
    foreach ($job in (get-job -state Failed | Where-Object {$_.name -match $Prefix}))
        {
        Write-LogMessage $(Get-FunctionName) 'Error' "$($job.name) - $($job.ChildJobs[0].JobStateInfo.Reason.Message)"
        Remove-job $job.id
        }
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
        if ((get-item -force -literalpath $name -Stream *).stream -contains $StreamName)
            {
            $CompressFilesize = (get-item -force -literalpath $name).length
            $OrigFilesize = (get-content -force -literalpath $name -Stream $StreamName | convertfrom-json).length
            $result += $OrigFilesize - $CompressFilesize
            }
        }
    return $result
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
function Start-ModifyFileAsync 
    {
    [CmdletBinding()]
    param(
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
        # replace tmp files
        [switch]$force
    )
    
    Set-StrictMode -Version Latest
    $ErrorActionPreference = 'stop'
     # print all param
    foreach ($key in $PSBoundParameters.Keys)
        {
        Write-LogMessage $(Get-FunctionName) 'Verbose' "Args: $($key) = $($PSBoundParameters[$key])"
        }
    $result = [ordered]@{}
    $result.filePathOriginal = $filePathOriginal
    $result.filePathTemp = $filePathTemp
    $result.proc = $null
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
    $result.proc = New-Object System.Diagnostics.Process
    $result.proc.StartInfo = $pinfo
    try 
        {
        Write-LogMessage $(Get-FunctionName) 'Verbose' "Start process for $($filePathOriginal)"
        if ($result.proc.Start() -eq $true) 
            {
            Write-LogMessage $(Get-FunctionName) 'Verbose' "Process $($result.proc.id) will process file $($filePathOriginal)"
            New-Object -TypeName psobject -Property $result    
            }
        else { throw 'Process run started' }
        }
    catch 
        {
        Write-LogMessage $(Get-FunctionName) 'Error' "$_"
        break
        }
    }

function Get-ModifyAsyncResult 
    {
    [CmdletBinding()]
    param(
        [System.Diagnostics.Process]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        # File path for processing
        $process,
        [string]
        [ValidateScript({Test-Path -LiteralPath $_ -PathType "Leaf"})]
        [Parameter(Mandatory)]
        # File path for processing
        $filePathOriginal,
        [string]
        [Parameter(Mandatory)]
        # Tmp file path
        $filePathTemp,
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
    # process result info
    try {
        Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Exit with exitcode $($process.exitcode)"
        # check compact ok
        if ($process.exitcode -ne 0)
            {
            #Clean tmp file
            if (Test-Path $filePathTemp)
                {
                Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Remove tmp file $($filePathTemp)"
                Remove-Item $filePathTemp
                }
            throw ("INVALID_ERRORLEVEL")
            }
        else
            {
            if ($replaceOriginal)
                {
                Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Selected replace original file"
                $fileinfo_original = get-item -force -LiteralPath $filePathOriginal
                $fileinfo_temp = get-item -force -LiteralPath $filePathTemp
                $fileinfo_stream = New-Object psobject
                $fileinfo_stream | Copy-Property -SourceObject $fileinfo_original -Property fullname,length,CreationTime,LastAccessTime,LastWriteTime -Passthru | out-null
                $fileinfo_stream | Add-Member -MemberType NoteProperty -Name 'Compressed' -Value $true
                #in some case tmp file size over original (
                if  ($fileinfo_original.length -le $fileinfo_temp.length)
                    {
                    Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Original file size smaller then temp file size"
                    Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Write info to alt NTFS stream in file $filePathOriginal"
                    if ($filePathOriginal.IsReadOnly) {Set-ItemProperty -LiteralPath $filePathOriginal -Name IsReadOnly -Value $false}
                    convertto-json $fileinfo_stream | Set-Content -LiteralPath $filePathOriginal -stream $streamName -force
                    Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Remove tmp file $($filePathTemp)"
                    remove-item -LiteralPath $filePathTemp
                    }
                else 
                    {
                    Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Write info to alt NTFS stream in file $filePathOriginal"
                    convertto-json $fileinfo_stream | Set-Content -LiteralPath $filePathTemp -stream $streamName -force
                    Write-LogMessage $(Get-FunctionName) 'Verbose' "$($process.id) - Move to original file $($filePathOriginal)"
                    Move-Item -LiteralPath $filePathTemp -Destination $filePathOriginal -Force
                    }
                }
            Write-LogMessage $(Get-FunctionName) 'Info' "$($process.id) - File $filePathOriginal process OK"
            }
        }
    catch
        {
        Write-LogMessage $(Get-FunctionName) 'Error' "$($process.id) - Run process for $($filePathOriginal)"
        Write-LogMessage $(Get-FunctionName) 'Error' "$($process.id) - Exit code $($process.exitcode)"
        #Write-LogMessage $(Get-FunctionName) 'Error' "$($process.id) - $_"
        }
    }

