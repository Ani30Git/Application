$ResourceGroupName = "rg-test-01"
$Location = "eastus"
$NicName = "nic-test-01"
$VNetName = "vnet-test-01"

$VNet = Get-AzVirtualNetwork -ResourceGroupName $ResourceGroupName -Name $VNetName

$Subnet = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VNet

New-AzNetworkInterface -Name $NicName -ResourceGroupName $ResourceGroupName -Location $Location -Subnet $Subnet -IpConfigurationName "ipconfig-test-01"





