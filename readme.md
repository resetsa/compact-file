# Скрипты сжатия PDF/JPG

В процессе разработки.

## TODO

- [x] Обьединить скрипты
- [x] Создать отдельный файл функция и подключать его
- [ ] Автотесты?
- [x] Вынести хардкод параметры в параметры функции
- [x] Создать файл настроек (JSON)

## Используемые модули

- GhostScript (<https://www.ghostscript.com/releases/gsdnld.html>)
- ImageMagick (<https://imagemagick.org/script/download.php>)

## Краткое описание

Работает на Windows с ФС NTFS.

Для работы использует утилиты GhostScript/ImageMagick.

Используется паралльное выполнения с помощью Powershell Job.

Для хранения информации о параметрах исходного файла использует NTFS stream.

Дополнительно, ограничивается примерное время исполнения скрипта (ожидается окончание всех запущенных заданий, 
а это может занимать много времени)

Описание параметров в Get-Help

## Описание

В комплекте скрипты:

0. func.ps1 - корневой модуль для хранения вспомогательных функций.
1. compress-jpg.ps1 - скрипт для сжатия JPEG.
2. compress-pdf.ps1 - скрипт для сжатия PDF.
3. compress-dirs.ps1 - скрипт для сжатия множества директорий + PDF/JPG.
4. config.json - пример файла конфигурация для compress-dirs.ps1

## Пример запуска в самих скриптах

``` powershell
PS C:\tools\compress-pdf> get-help .\compress-dirs.ps1 -Examples

NAME
    C:\tools\compress-pdf\compress-dirs.ps1

SYNOPSIS
    Script for many folders processing

    -------------------------- EXAMPLE 1 --------------------------

    PS C:\tools\compress-pdf>.\compress-dirs.ps1 -configJson .\config.json | Tee-Object -FilePath .\compress-dirs.log
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Start script
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Set variables
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Modify path to \\?\C:\temp\pdfs
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Clean old jobs ns.comp_pdf*
    04/15/2022 22:56:46:compress-pdf.ps1\compress-dirs.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/15/2022 22:57:01:Process-job\compress-pdf.ps1\compress-dirs.ps1 - Info - Process \\?\C:\temp\pdfs\aci_seminar-part1.pdf OK
    04/15/2022 22:57:47:Process-job\compress-pdf.ps1\compress-dirs.ps1 - Info - Process \\?\C:\temp\pdfs\Angliyskiy_dlya_mladshikh_shkolnikov_Uchebnik_Chast_1_-_2011.pdf OK
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\longdirs".
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Info - Save spaces 1.23 MB
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Info - Work time 00:01:00.8987111
    04/15/2022 22:57:47:compress-pdf.ps1\compress-dirs.ps1 - Info - End script
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Func module C:\tools\compress-pdf\func.ps1 check
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Start script
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Set variables
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Modify path to \\?\C:\temp\pdfs
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Clean old jobs ns.comp_jpg*
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Enum files in \\?\C:\temp\pdfs
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\longdirs".
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Save spaces 0 MB
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - Work time 00:00:00.0156264
    04/15/2022 22:57:47:compress-jpg.ps1\compress-dirs.ps1 - Info - End script

    -------------------------- EXAMPLE 2 --------------------------

    PS C:\tools\compress-pdf>.\compress-dirs.ps1 -configJson .\config.json -Verbose
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
    04/15/2022 23:00:16:compress-pdf.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\longdirs".
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
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Error - Отказано в доступе по пути "\\?\C:\temp\pdfs\longdirs".
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Save spaces 0 MB
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - Work time 00:00:00.0156243
    04/15/2022 23:00:16:compress-jpg.ps1\compress-dirs.ps1 - Info - End script
```
