<# 20231024 Create a VM and get it ready for installation of Windows Server 2019 with a Internal Network
Some commands need to have Administator privilege so start with Powershell and change Set-ExecutionPolicy to Unrestricted
#>
    <# Start with the VM (Empty) #>
   Get-Date 

    <# Create the variables you need #>

    <# Create the Variables #>
    $VMname = "WinSrv10"
    $Switch = "Internal"
    $ISO = "C:\HyperV\SW_DVD9_Win_Server_STD_CORE_2019_1909.4_64Bit_English_DC_STD_MLF_X22-29333.ISO"
    $VHD = "C:\ECUtb\WinSrv"
    $RAM = "2GB"
    
    
        <# Create a VM and VHDX #>
    New-VM -Name $VMname -MemoryStartupBytes $RAM -Generation 2 -NewVHDPath "$VHD\$VMname.vhdx" -NewVHDSizeBytes 35gb
    Set-VM $VMname -ProcessorCount 3

        <# Add a Switch #>
    # Add and install a Network Card (Internal)
    Remove-VMNetworkAdapter -VMName $VMname
    New-VMSwitch -Name Internal -SwitchType Internal
    Add-VMNetworkAdapter -VMName $VMname -SwitchName Internal
    
        
        <# Add Scsi-Controller and add DVD to the Scsi-Controller #>
    Add-VMScsiController -VMName $VMname
    Add-VMDvdDrive -VMName $VMname -Path $ISO
    
    
      <# Add ISO-File, for installation, to DVD #>
    $DVDDRIVE = Get-VMDvdDrive -VMName $VMname
    
    
        <# Set the Boot to Device DVD #>
    Set-VMFirmware -VMName $VMname -FirstBootDevice $DVDDRIVE
    
        <# Start the VM and Connect to VM (with Local RDP) #>
    Start-VM -Name $VMname
    vmconnect.exe