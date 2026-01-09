$ResourceGroupName = "rg-test-01"
$Location = "eastus"
$NsgName = "nsg-test-01"
$VNetName = "vnet-test-01"
$SubNetName = "snet-test-01"

$AllowHttp = New-AzNetworkSecurityRuleConfig -Name "in-allow-http-from-internet-to-10-0-0-4" -Access Allow -Protocol Tcp -Direction Inbound -Priority 410 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix '10.0.0.4' -DestinationPortRange 80

$AllowSsh = New-AzNetworkSecurityRuleConfig -Name "in-allow-ssh-admin" -Access Allow -Protocol Tcp -Direction Inbound -Priority 400 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix '10.0.0.4' -DestinationPortRange 22

$Nsg = New-AzNetworkSecurityGroup -Name $NsgName -ResourceGroupName $ResourceGroupName -Location $Location -SecurityRules $AllowHttp,$AllowSsh

$VNet = Get-AzVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroupName

Set-AzVirtualNetworkSubnetConfig -VirtualNetwork $VNet -Name $SubnetName -AddressPrefix "10.0.0.0/24" -NetworkSecurityGroup $Nsg

Set-AzVirtualNetwork -VirtualNetwork $VNet


