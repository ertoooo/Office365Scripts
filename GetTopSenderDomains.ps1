# Connect to Exchange Online
$UserCredential = Get-Credential
Connect-ExchangeOnline -Credential $UserCredential

# Get message trace data
$startDate = (Get-Date).AddDays(-10)
$endDate = Get-Date
$messageTraces = Get-MessageTrace -StartDate $startDate -EndDate $endDate

# Extract domains and count occurrences
$domainCounts = $messageTraces | 
                Where-Object {$_.SenderAddress -ne $null} |
                Group-Object {($_.SenderAddress -split "@")[1]} |
                Sort-Object Count -Descending |
                Select-Object Name, Count -First 10

# Display the top 10 sending domains
$domainCounts | Format-Table Name, Count -AutoSize

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false