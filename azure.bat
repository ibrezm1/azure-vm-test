REM https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-cli
REM https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-manage-vm
REM read about size setting 
REM https://docs.microsoft.com/en-us/cli/azure/vm?view=azure-cli-latest
REM https://azure.microsoft.com/pricing/details/virtual-machines/
REM Move files
REM https://engineerer.ch/2020/08/16/copy-large-files-to-an-azure-vm/
REM Access VM 
REM https://azurelessons.com/how-to-access-azure-vm/
az group create --name myResourceGroup --location eastus

REM / in bash and ^ in bat

REM list all sizes to be used 
REM az vm list-sizes --location eastus | grep Standard_DS1

az vm create ^
    --resource-group myResourceGroup ^
    --name myVM ^
    --size Standard_DS1_v2 ^
    --image Win2022AzureEditionCore ^
    --public-ip-sku Standard ^
    --nic-delete-option delete ^
    --os-disk-delete-option delete ^
    --admin-username azureuser ^
    --admin-password azurep@ssw0rd1

REM inetmgr to open iis manager

az vm run-command invoke -g MyResourceGroup -n MyVm ^
    --command-id RunPowerShellScript ^
    --scripts "Install-WindowsFeature -name Web-Server -IncludeManagementTools"

az vm open-port --port 80 --resource-group myResourceGroup --name myVM
az vm open-port --port 3389 --resource-group myResourceGroup --name myVM

REM az group delete --name myResourceGroup

REM Force deletion
REM az vm delete ^
REM     --resource-group myResourceGroup ^
REM     --name myVM ^
REM     --force-deletion

REM Next steps Terraform for azure
REM https://docs.microsoft.com/en-us/azure/developer/terraform/overview