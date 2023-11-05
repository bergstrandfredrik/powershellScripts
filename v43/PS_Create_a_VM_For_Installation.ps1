<#Create a VM and get it ready for installation of Windows Server 2019 with a Internal Network
Some commands need to have Administator privilege so start with Powershell and change Set-ExecutionPolicy to Unrestricted
#>
<# Start with the VM (Empty) #>

<# Create the variables you need #>

<# Create the Variables #>
$VMname = "WinServ"
$Switch = "Internal"
$ISO = "C:\HyperV\SW_DVD9_Win_Server_STD_CORE_2019_1909.4_64Bit_English_DC_STD_MLF_X22-29333.ISO"
$VHD = "C:\ECutbildning\WinServ"
$VHDsize = "40GB"
$RAM = "2GB"
    
    
<# Create a VM and VHDX #>
New-VM -Name $VMname -MemoryStartupBytes 2GB -Generation 2 -NewVHDPath "$VHD\WinServ.vhdx" -NewVHDSizeBytes 60gb
    
<# Add a Switch #>
New-VMSwitch -Name Internal -SwitchType $Switch
    
<# Add Scsi-Controller and add DVD to the Scsi-Controller#>
Add-VMScsiController -VMName $VMname
Add-VMDvdDrive -VMName -ControllerNumber  -ControllerLocation 0 -Path $ISO -
    
<# Add ISO-File, for installation, to DVD #>
# $DVDDRIVE = Get-VMDvdDrive -VMName "WinServ"
$DVDDRIVE = Add-VMDvdDrive -VMName $VMname -Path $ISO
    
<# Set the Boot to Device DVD #>
Set-VMFirmware -VMName WinServ -FirstBootDevice $DVDDRIVE
    
<# Start the VM and Connect to VM (with Local RDP) #>
Start-VM -Name $VMname
vmconnect.exe