
::OLD VERSION

echo "listing partitions..."
@echo off
echo
echo >diskpart.txt LIST DISK
diskpart /s diskpart.txt

set /p Disk=Please enter the disk number:
if "%Disk%"=="" goto :eof
echo > diskpart.txt Select disk %disk%
echo >> diskpart.txt create partition primary size=126000
echo >> diskpart.txt select partition 1
echo >> diskpart.txt format fs=ntfs label="WINDOWS" quick
echo >> diskpart.txt assign letter=X
diskpart /s diskpart.txt
del diskpart.txt
xcopy "D:\OSImages\Partition Tool\WIN10_X64_ES" X: /E /H /C /I
echo > diskpart.txt Select disk %disk%
echo >> diskpart.txt select partition 1
echo >> diskpart.txt active
echo >> 
echo >> 
echo >> 
echo >> 
diskpart /s diskpart.txt
del diskpart.txt
X:
boot\bootsect.exe /nt60 X: