$ResourceGroupName = "rg-test-01"
$Location = "eastus"
$VmName = "vm-test-01"
$VmSize = "Standard_B1s"
$NicName = "nic-test-01"

$VMConfig = New-AzVMConfig -Name $VmName -VMSize $VmSize

$Credential = Get-Credential

$VMConfig = Set-AzVMSourceImage -VM $VMConfig -PublisherName "Canonical" -Offer "ubuntu-24_04-lts" -Skus "server" -Version "latest"

$Nic = Get-AzNetworkInterface -Name $NicName -ResourceGroupName $ResourceGroupName

$VMConfig = Add-AzVMNetworkInterface -VM $VMConfig -Id $Nic.Id

$VMConfig = Set-AzVMOperatingSystem -VM $VMConfig -Linux -ComputerName $vmName -Credential $Credential





New-AzVM -ResourceGroupName $ResourceGroupName -Location $Location -VM $VMConfig

