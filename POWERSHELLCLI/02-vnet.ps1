$ResourceGroupName = "rg-test-01"
$Location = "eastus"
$VNetName = "vnet-test-01"
$AddressSpace = "10.0.0.0/16"

New-AzVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroupName -Location $Location -AddressPrefix $AddressSpace
