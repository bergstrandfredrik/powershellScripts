
<# Will be the best script ever #>

$Switch = "Internal"

New-VM -Name "NewWinSrv11" -MemoryStartupBytes 2GB -Generation 2 -BootDevice VHD -VHDPath "C:\HyperV\Image_for_PS\WinServ11.vhdx"

Set-VMProcessor -VMName "NewWinSrv11" -Count 2

Connect-VMNetworkAdapter -VMName "NewWinSrv11" -SwitchName "Private"

 <# Add a Switch #>
    # Add and install a Network Card (Internal)
    Remove-VMNetworkAdapter -VMName NewWinSrv11
    New-VMSwitch -Name Internal -SwitchType Internal
    Add-VMNetworkAdapter -VMName NewWinSrv11 -SwitchName Internal

    New-VMSwitch -Name Internal -SwitchType Private
    Connect-VMNetworkAdapter -VMName "NewWinSrv11" -SwitchName "Private"

   

Start-VM -Name "NewWinSrv11"

