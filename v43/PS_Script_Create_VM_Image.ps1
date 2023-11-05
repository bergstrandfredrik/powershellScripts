<# Create a VM from an already existing VM image #>

<# Create Variables #>
$VmName = "NewWin10"
$ImagePath = "C:\HyperV\Image_for_PS\Win10.vhdx"
$Switch = "Private"

<# Create a new VM from Image #>
New-VM -Name $VmName -MemoryStartupBytes 2GB -Generation 2 -BootDevice VHD -VHDPath $ImagePath

Set-VMProcessor -VMName $VmName -Count 2

Connect-VMNetworkAdapter -VMName $VmName -SwitchName $Switch

Start-VM -Name $VmName