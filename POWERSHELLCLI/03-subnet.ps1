$ResourceGroupName = "rg-test-01"
$VNetName = "vnet-test-01"
$SubNetName = "snet-test-01"
$SubnetAddressPrefix ="10.0.0.0/24"

$VNet = Get-AzVirtualNetwork -ResourceGroupName $ResourceGroupName -Name $VNetName

Add-AzVirtualNetworkSubnetConfig -Name $SubNetName -VirtualNetwork $VNet -AddressPrefix $SubnetAddressPrefix

$VNet | Set-AzVirtualNetwork