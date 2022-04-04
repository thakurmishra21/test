﻿Param($pClientId, $pKey,$pTenantId,$pSubscriptionId)
Install-Module -Name Az.Storage -force

$clientID = $pClientId
$key = $pKey
$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $clientID, $SecurePassword
$tenantID = $pTenantId
$subscriptionId = $pSubscriptionId


$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $clientID, $SecurePassword

Connect-AzAccount -Credential $cred -TenantId $tenantID -ServicePrincipal
Select-AzSubscription -SubscriptionId $subscriptionId

$resourceGroupName = "synapse3Apr2022RG"
$storageAccountName = "str4Apr2022uv2cydvukcmeq"
Enable-AzStorageBlobDeleteRetentionPolicy -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName -RetentionDays 7