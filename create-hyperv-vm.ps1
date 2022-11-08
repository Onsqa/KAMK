
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    $VMname = Read-Host "Syötä virtuaalikoneen nimi (esim. Win10-Testi)"
    # $VMDiskSize = Read-Host "Syötä virtuaalikoneen levytila (GB) (esim. 50)"
    # $VMRamSize = Read-Host "Syötä virtuaalikoneen RAM-määrä (GB) (esim. 4)"
    $VMISOPath = Read-Host "Syötä virtuaalikoneen asennusmedia (ISO) polku (esim. C:\Windows.iso)"

New-VM -Name $VMname -MemoryStartupBytes 4GB -Path "C:\Hyper-V\Virtual Machines\$VMname" -NewVHDPath "C:\Hyper-V\Virtual Hard Disks\$VMname.vhdx" -NewVHDSizeBytes 30GB -Generation 2 -SwitchName "Default Switch"


