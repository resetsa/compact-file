#requires -version 3.0

<#
.SYNOPSIS
.DESCRIPTION
.NOTES
.EXAMPLE
.EXAMPLE
#>

param(
    [string]
    [ValidateScript({Test-Path $_ -PathType "Leaf"})]
    [Parameter(Mandatory)]
    # Set root dir for processing
    $configJson="./config.json"
)

Set-StrictMode -Version Latest
function validate-json ([PSObject]$dir,[string[]]$mandatoryNames)
    {
    $result = $true
    try 
        {
        $all_prop = ($dir | get-member | Where-Object {$_.MemberType -eq 'NoteProperty'}).Name
        foreach ($prop in $all_prop)
            {
            Write-Verbose "$(Get-date) - $prop = $($dir.$prop)"
            }
        compare-object $mandatoryNames $all_prop
        if (compare-object $mandatoryNames $all_prop )
            {
            throw ("Not all fields defined")
            }
        if (-not(Test-Path $dir.rootDir -PathType 'Container'))
            {
            throw ("Root dir $($dir.rootDir) not exist")
            }
        if (-not(Test-Path $dir.scriptName))
            {
            throw ("Script to run $($dir.scriptName) not exist")
            }
        }
    catch
        {
        Write-Error "$(Get-date) - $_"
        $result = $false
        continue
        }
    $result
    }

$mandatoryFields=@("scriptName","rootDir","ageDays","replaceOriginal","maxProcess","jobPrefix","streamName","maxRunSecond","mask","tmpPrefix")
$runFields=@("rootDir","ageDays","replaceOriginal","maxProcess","jobPrefix","streamName","maxRunSecond","mask","tmpPrefix")

try
    {
    $dirs = get-content $configJson | convertfrom-json
    foreach ($dir in $dirs)
        {
        if (validate-json $dir $mandatoryFields)
            {
            $hash_param=@{}
            ForEach ($prop in $dir.psobject.properties)
                {
                if ($runFields -contains $prop.Name) 
                    {
                    $hash_param[$prop.Name] = $prop.Value
                    }
                }
            . $($dir.scriptName) @hash_param
            }
        }
    }
catch
    {
        Write-Error "$(Get-date) - $_"
    }
