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
PS C:\tools\pdf-compress> .\compress-pdf.ps1 -RootDir c:\temp -AgeDays 1 -ReplaceOriginal $true
04/09/2022 20:58:44:compress-pdf.ps1 - Start script
04/09/2022 20:58:44:compress-pdf.ps1 - Set variables
04/09/2022 20:58:44:compress-pdf.ps1 - Modify path to \\?\c:\temp
04/09/2022 20:58:44:compress-pdf.ps1 - Clean old jobs ns.comp_pdf*
04/09/2022 20:58:44:compress-pdf.ps1 - Enum files in \\?\c:\temp\
04/09/2022 20:58:47:Process-job - Process \\?\c:\temp\pdfs\jpeg_as_pdf.pdf Error
04/09/2022 20:58:47:compress-pdf.ps1 - Save spaces 0 MB
04/09/2022 20:58:47:compress-pdf.ps1 - Work time 00:00:03.5156247
04/09/2022 20:58:47:compress-pdf.ps1 - End script
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
