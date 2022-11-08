
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

    $VMname = $args[0]
    $VMDiskSize = $args[1]
    $VMISOPath = $args[2]
    
    $VMInfo = @{
        Name = $VMname
        MemoryStartupBytes = 4GB
        Generation = 2
        NewVHDPath = "C:\Hyper-V\Virtual Hard Disks\$VMname.vhdx"
        VMDvdDrivePath = $VMISOPath
        NewVHDSizeBytes = $VMDiskSize * 1GB
        Path = " C:\Hyper-V\Virtual Machines\$VMname"
        SwitchName = (Get-VMswitch).Name
    }
    New-VM @VMInfo
# Virtuaali 25  C:\Windows.iso

