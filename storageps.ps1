Param($pClientId, $pKey,$pTenantId,$pSubscriptionId, $pStorageAccountName)
Install-Module -Name Az.Storage -force

$clientID = $pClientId
$key = $pKey
$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $clientID, $SecurePassword
$tenantID = $pTenantId
$subscriptionId = $pSubscriptionId
$storageAccountName = $pStorageAccountName

$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $clientID, $SecurePassword

Connect-AzAccount -Credential $cred -TenantId $tenantID -ServicePrincipal
Select-AzSubscription -SubscriptionId $subscriptionId

$resourceGroupName = "synapse3Apr2022RG"
Enable-AzStorageBlobDeleteRetentionPolicy -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName -RetentionDays 7
