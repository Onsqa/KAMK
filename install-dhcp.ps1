#Asennetaan Windows serverille DHCP. Server managerissa pittää completee sit tän jälkeen se securitygroup homma painamal vaa complete, sitä en hokannu
try {
    #Alku kyssärit
    $ip = Read-Host "Aseta ip osoite"
    $DefaultGW = Read-Host "Aseta Default Gateway"
    $DNSip = Read-Host "Aseta DNS ip osoite"
    
    $ScopeName = Read-Host "DHCP scopen nimi"
    $StartRange = Read-Host "Aseta startrange scopelle"
    $EndRange = Read-Host "Asaeta endrange scopelle"
    $SubnetMask = Read-Host "Aseta aliverkon maski"
    
    # Asetetaan staattinen ip 
    New-NetIPAddress -IPAddress $ip -DefaultGateway $DefaultGW -PrefixLength 24 -InterfaceIndex (Get-NetAdapter).InterfaceIndex
    Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses $DNSip
    

    # Asennetaan DHCP palvelimelle
    Install-WindowsFeature DHCP -IncludeManagementTools
    #Write-Host("DHCP on asennettu palvelimelle")
    
    # Luodaan DHCP security groupit
    netsh dhcp add securitygroups
    
    
    #Luodaan ja määritetään scopelle asetukset
    Add-DhcpServerv4Scope -name $ScopeName -StartRange $StartRange -EndRange $EndRange -SubnetMask $SubnetMask -State Active
    Set-DhcpServerV4OptionValue -DnsServer $DNSip -Router $DefaultGW
    
    #Restartataan DHCP server
    Restart-Service dhcpserver
} catch {
    Write-Host "Virhe: $_"
} finally {
    Write-Host "Asennus suoritettu."
}
