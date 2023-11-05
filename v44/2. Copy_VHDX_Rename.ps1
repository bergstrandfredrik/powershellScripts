# Copy-Item "C:\Folder1\Folder2\Virtual Hard Disks\DiskFileName.vhdx" -Destination "C:\HyperV\Image_for_PS"

Copy-Item "C:\ECUtb\WinSrv\WinSrv.vhdx" -Destination "C:\HyperV\Image_for_PS"
Rename-Item "C:\HyperV\Image_for_PS\WinSrv.vhdx" -NewName "WinServ11.vhdx"