Connect-AzAccount -AuthScope MicrosoftGraphEndpointResourceId


# Definieren der Gruppeneigenschaften
$groupName = "GroupName"
$groupDescription = "Nice Group Description"
$groupMailNickname = "GroupMailNickname"

# Erstellen der Gruppe
New-AzADGroup -DisplayName $groupName -MailNickname $groupMailNickname -SecurityEnabled:$true -MailEnabled:$false -Description $groupDescription

Write-Host "Gruppe '$groupName' wurde erfolgreich erstellt."

