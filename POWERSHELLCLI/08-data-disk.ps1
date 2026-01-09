$ResourceGroupName = "rg-test-01"
$Location = "eastus"
$VmName = "vm-test-01"

$vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VmName

Add-AzVMDataDisk -VM $vm -Name "disk-test-01" -DiskSizeInGB 20 -Lun 0 -CreateOption Empty -StorageAccountType StandardSSD_LRS -Caching ReadWrite
