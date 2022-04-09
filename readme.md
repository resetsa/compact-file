Скрипт сжатия PDF
===================================

## В процессе разработки

### Используемые модули:

* GhostScript (<https://www.ghostscript.com/releases/gsdnld.html>)

### Краткое описание
Работает на Windows с ФС NTFS.

Для работы использует утилиты GhostScript.

Используется паралльное выполнения с помощью Job Powershell.

Хранения информации о параметрах исходного файла использует NTFS stream.

Дополнительно, ограничивается примерное время исполнения скрипта (ожидается окончание всех запущенных заданий, 
а это может занимать много времени)

Описание параметров в Get-Help

### Инструкция по запуску и применению

compress-pdf.ps1 - получение информации о версия ПО.

```powershell
PS C:\tools\pdf-compress> .\compress-pdf.ps1 -RootDir c:\temp -AgeDays 1 -ReplaceOriginal $true -MaxProcess 3
04/09/2022 20:59:25:compress-pdf.ps1 - Start script
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
```

```powershell
PS C:\tools\compress-pdf> .\compress-pdf.ps1 -RootDir c:\temp -AgeDays 1 -Verbose
04/09/2022 21:40:49:compress-pdf.ps1 - Start script
04/09/2022 21:40:49:compress-pdf.ps1 - Set variables
04/09/2022 21:40:49:compress-pdf.ps1 - Modify path to \\?\c:\temp
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Check access to \\?\c:\temp
04/09/2022 21:40:49:compress-pdf.ps1 - Clean old jobs ns.comp_pdf*
04/09/2022 21:40:49:compress-pdf.ps1 - Enum files in \\?\c:\temp\
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\CIS_CentOS_Linux_7_Benchmark_v3.0.0.pdf
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\CIS_Distribution_Independent_Linux_Benchmark_v2.0.0.pdf
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\Diving Deep Into Kubernetes Networking.pdf
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\Docker Security Adrian Mouat.pdf
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Begin process file \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Run job ns.comp_pdf1652957695 for process file \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
ПОДРОБНО: 04/09/2022 21:40:49:compress-pdf.ps1 - Check file \\?\c:\temp\pdfs\Python Programming for Beginners. The Compl Begin Guide.pdf
04/09/2022 21:40:52:Process-job - Process \\?\c:\temp\pdfs\jpeg_as_pdf.pdf Error
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Errorcode 1
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Error messsage GPL Ghostscript 9.56.1: Unrecoverable error, exit code 1
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Args: filepath_original = \\?\c:\temp\pdfs\jpeg_as_pdf.pdf
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Args: filepath_temp = \\?\c:\temp\pdfs\tmp_jpeg_as_pdf.pdf
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Args: remove_original = False
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Args: alt_streamname = ns.comp_pdf
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Start process C:\tools\gs\gs9.56.1\bin\gswin64c.exe
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Start args -dBATCH -dQUIET -dNOPAUSE -dSAFER -dALLOWPSTRANSPARENCY -dEmbedAllFonts=true -dSubsetFonts=true -dPDFSETTINGS=/ebook
-dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dColorImageDownsampleThreshold=1 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dGrayImageDownsampleThreshold=1
-dMonoImageDownsampleType=/Subsample -dMonoImageResolution=144 -dPassThroughJPEGImages=false -dColorImageFilter=/DCTEncode -dGrayImageFilter=/DCTEncode -dMonoImageFilter=/CCITTFaxEncode -sDEVICE=pdfwrite
-sOutputFile="\\?\c:\temp\pdfs\tmp_jpeg_as_pdf.pdf" "\\?\c:\temp\pdfs\jpeg_as_pdf.pdf"
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Process exit with exitcode 1
ПОДРОБНО: 04/09/2022 21:40:52:Process-job - ns.comp_pdf1652957695 - Remove tmp file \\?\c:\temp\pdfs\tmp_jpeg_as_pdf.pdf
04/09/2022 21:40:52:compress-pdf.ps1 - Save spaces 0 MB
04/09/2022 21:40:52:compress-pdf.ps1 - Work time 00:00:03.3593763
04/09/2022 21:40:52:compress-pdf.ps1 - End script
```
