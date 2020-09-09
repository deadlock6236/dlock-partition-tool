@echo off

echo :::DlocK partition tool:::
echo v8.9.20
echo .-------------------------------.


::Environment Variables

::The number of the disk to work on. See Disk Manager
set DISK_NUMBER=3

::Whether you want to clean the disk or not (WARNING, DEFAULT TRUE)
set CLEAN_DISK=TRUE

::Windows installation packs directory
set WIN_DATA_DIR=D:\OSImages\Windows

::Name of the Windows installation pack
set WIN_DATA_PACK=WIN10_X64_ES

::Size in MB for Windows system partition. #TODO 0 to use all space available
set WIN_PARTITION_SIZE=126000

::Create another partition for data storage. 
set DATA_PARTITION=TRUE

::The default letter for Windows system partition.
set DEFAULT_WIN_LETTER=X

::The default letter for data partition
set DEFAULT_DATA_LETTER=Z

if "%CLEAN_DISK%"=="TRUE" (
    echo .
    echo ### CLEANING DISK %DISK_NUMBER%...
    (
        echo select disk %DISK_NUMBER%
        echo clean 
    ) | diskpart
) else (
    echo .
    echo ### DISK CLEANING SKIPPED
)

::Create root Partition
(
    echo select disk %DISK_NUMBER%
    echo create partition primary size=%WIN_PARTITION_SIZE%
    echo select partition 1
    echo format fs=ntfs label="Windows" quick
    echo assign letter=X
)  | diskpart

::Copy Windows installation files to root partition
xcopy "%WIN_DATA_DIR%\%WIN_DATA_PACK%" %DEFAULT_WIN_LETTER%: /E /H /C /I

::Activate root partition
(
    echo select disk %DISK_NUMBER%
    echo select partition 1
    echo active
)  | diskpart

::Create Data partition if DATA_PARTITION=TRUE
if "%DATA_PARTITION%"=="TRUE" (
    echo .
    echo ### CREATING DATA PARTITION
    (   
        echo select disk %DISK_NUMBER%
        echo create partition primary
        echo select partition 2
        echo format fs=ntfs label="DATA" quick
        echo assign letter=%DEFAULT_DATA_LETTER%
    ) | diskpart
) else (
    echo .
    echo ### DATA PARTITION CREATION SKIPPED
)

::Switch to root drive
%DEFAULT_WIN_LETTER%:

::Nope, no idea what does this line do... yet...
boot\bootsect.exe /nt60 %DEFAULT_WIN_LETTER%:

echo .-------------------------------.
echo TASK COMPLETED