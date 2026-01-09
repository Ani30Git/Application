$ResourceGroupName = "rg-test-01"
$Location = "eastus"
$PublicIpName = "pip-test-01"
$NicName = "nic-test-01"
$IpConfigName = "ipconfig-test-01"

$Pip = New-AzPublicIpAddress -Name $PublicIPName -ResourceGroupName $ResourceGroupName -Location $Location -Sku Standard -AllocationMethod Static

$Nic = Get-AzNetworkInterface -Name $NicName -ResourceGroupName $ResourceGroupName

Set-AzNetworkInterfaceIpConfig -Name $IpConfigName -NetworkInterface $Nic -PublicIpAddress $Pip | Out-Null

Set-AzNetworkInterface -NetworkInterface $Nic
