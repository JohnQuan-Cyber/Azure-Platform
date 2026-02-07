param location string = resourceGroup().location

@minLength(3)
@maxLength(24)
param strname string = 'thisisateststoragelab'


@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_ZRS'
])
param type string = 'Standard_LRS'

var containerName = 'images'

resource stacc 'Microsoft.Storage/storageAccounts@2025-06-01' = {
 name: strname
 location: location
 kind: 'StorageV2'
 sku:{
  name: type 
 }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  name: '${stacc.name}/default/${containerName}'
  properties: {
    publicAccess: 'None'
  }
}

output storageId string = stacc.id 
