#requires -version 3.0

<#
.SYNOPSIS
    Script for many folders processing
.DESCRIPTION
    Config with json files, each records process with selected script
.NOTES
    Name: compress-dirs
    Author: Stepanenko S
    Version: 0.2
    DateCreated: 15.04.2022
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-dirs.ps1 -configJson .\config.json | Tee-Object -FilePath .\compress-dirs.log
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Start script
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Set variables
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Modify path to \\?\C:\temp\pdfs
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Clean old jobs ns.comp_pdf*
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/15/2022 22:57:01:Process-job\compress-pdf.ps1\compress-dirs.ps1 - Info - Process \\?\C:\temp\pdfs\aci_seminar-part1.pdf OK
    04/15/2022 22:57:47:Process-job\compress-pdf.ps1\compress-dirs.ps1 - Info - Process \\?\C:\temp\pdfs\Angliyskiy_dlya_mladshikh_shkolnikov_Uchebnik_Chast_1_-_2011.pdf OK
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\long dirs".
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Info - Save spaces 1.23 MB
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Info - Work time 00:01:00.8987111
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Info - End script
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Start script
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Set variables
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Modify path to \\?\C:\temp\pdfs
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Clean old jobs ns.comp_jpg*
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\long dirs".
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Save spaces 0 MB
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Work time 00:00:00.0156264
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - End script
.EXAMPLE
    PS C:\tools\compress-pdf> .\compress-dirs.ps1 -configJson .\config.json -Verbose
    ПОДРОБНО: 04/15/2022 23:00:16 - ageDays = 1
    ПОДРОБНО: 04/15/2022 23:00:16 - jobPrefix = ns.comp_pdf
    ПОДРОБНО: 04/15/2022 23:00:16 - mask = *.pdf
    ПОДРОБНО: 04/15/2022 23:00:16 - maxProcess = 1
    ПОДРОБНО: 04/15/2022 23:00:16 - maxRunSecond = 86400
    ПОДРОБНО: 04/15/2022 23:00:16 - replaceOriginal = True
    ПОДРОБНО: 04/15/2022 23:00:16 - rootDir = C:\temp\pdfs
    ПОДРОБНО: 04/15/2022 23:00:16 - scriptName = c:\tools\compress-pdf\compress-pdf.ps1
    ПОДРОБНО: 04/15/2022 23:00:16 - streamName = ns.comp_pdf
    ПОДРОБНО: 04/15/2022 23:00:16 - tmpPrefix = tmp_
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Start script
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Set variables
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Modify path to \\?\C:\temp\pdfs
    ПОДРОБНО: 04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Verbose - Check access to \\?\C:\temp\pdfs
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Clean old jobs ns.comp_pdf*
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    ПОДРОБНО: 04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Verbose - Check file \\?\C:\temp\pdfs\aci_seminar-part1.pdf
    ПОДРОБНО: 04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Verbose - Check file
    \\?\C:\temp\pdfs\Angliyskiy_dlya_mladshikh_shkolnikov_Uchebnik_Chast_1_-_2011.pdf
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\long dirs".
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Save spaces 0 MB
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - Work time 00:00:00.0468744
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Info - End script
    ПОДРОБНО: 04/15/2022 23:00:16 - ageDays = 1
    ПОДРОБНО: 04/15/2022 23:00:16 - jobPrefix = ns.comp_jpg
    ПОДРОБНО: 04/15/2022 23:00:16 - mask = *.jpg
    ПОДРОБНО: 04/15/2022 23:00:16 - maxProcess = 1
    ПОДРОБНО: 04/15/2022 23:00:16 - maxRunSecond = 86400
    ПОДРОБНО: 04/15/2022 23:00:16 - replaceOriginal = True
    ПОДРОБНО: 04/15/2022 23:00:16 - rootDir = C:\temp\pdfs
    ПОДРОБНО: 04/15/2022 23:00:16 - scriptName = c:\tools\compress-pdf\compress-jpg.ps1
    ПОДРОБНО: 04/15/2022 23:00:16 - streamName = ns.comp_jpg
    ПОДРОБНО: 04/15/2022 23:00:16 - tmpPrefix = tmp_
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Start script
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Set variables
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Modify path to \\?\C:\temp\pdfs
    ПОДРОБНО: 04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Verbose - Check access to \\?\C:\temp\pdfs
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Clean old jobs ns.comp_jpg*
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\long dirs".
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Save spaces 0 MB
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Work time 00:00:00.0156243
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - End script
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
