# Setting variables and/or parameters before deploying into the Azure Portal
$grp = "RGBicepDemo"
$loc = "WestUS"


# Creating resource group with the parameteres set above and pushing it into the Azure Portal 
az group create --resource-group $grp --location $loc


# Deploying the resources of the Bicep template pointing towards the resource group
az deployment group create --resource-group (resource group) --template-file (the file of the template)


# We are using the what-if statement to see when it uses the pre-flight check to find out if the resource is already existing.
az deployment group what-if --template-file (the file of the template) --resource-group (resource group) --parameters type=(the type)


# If everything checks out, then we deploy the resource. With setting the prameter we can change the default with the @allow  
az deployment group create --template-file (the file of the template) --resource-group (resource group) --parameters type=(the type) -c


# Cleaning up the resource group by deleting the resource group and the resources that is in the group
az group delete --resource-group (resource group) --yes --no-wait


# Exporting an ARM file from the Azure Portal to VSCode
## This is a great way to grab existing working templates from the Azure Portal and have a saved file into VSCode
az group export --resource-group (resource group) > (template.json)


# Decompiling the ARM template into a easier to read BICEP file 
# After Exporting the ARM template into VSCode, You decomple the ARM file and convert it into a Bicep file
# I decided to convert the VM_Template.json to VM_Template.bicep 
az bicep decompile --file (file).json


# Building a Bicep file and vonverting it intop an ARM JSON file
# I decided to convert the VM_Template.bicep to VM_Template.json (I made sure to save the old file with a different name before converting it to compare)
az bicep build --file (file).bicep 

