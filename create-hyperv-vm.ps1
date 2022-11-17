Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

    $VMname = Read-Host "Syötä virtuaalikoneen nimi (esim. Win10-Testi)"
    $VMISOPath = Read-Host "Syötä virtuaalikoneen asennusmedia (ISO) polku (esim. C:\Windows.iso)"

New-VM -Name $VMname -MemoryStartupBytes 4GB -Path "C:\Hyper-V\Virtual Machines\$VMname" -NewVHDPath "C:\Hyper-V\Virtual Hard Disks\$VMname.vhdx"  -NewVHDSizeBytes 30GB -Generation 2 -SwitchName "Default Switch"
Add-VMDvdDrive -VMName $VMname -Path $VMISOPath
