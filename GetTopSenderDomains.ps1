# Connect to Exchange Online
$UserCredential = Get-Credential
Connect-ExchangeOnline -Credential $UserCredential

# Get list of accepted domains
$acceptedDomains = Get-AcceptedDomain | Select-Object -ExpandProperty DomainName

# Get message trace data
$startDate = (Get-Date).AddDays(-10)
$endDate = Get-Date
$messageTraces = Get-MessageTrace -StartDate $startDate -EndDate $endDate

# Filter for internal senders and count occurrences
$internalDomainCounts = $messageTraces | 
                        Where-Object {
                            $senderDomain = ($_.SenderAddress -split "@")[1]
                            $acceptedDomains -contains $senderDomain
                        } |
                        Group-Object {($_.SenderAddress -split "@")[1]} |
                        Sort-Object Count -Descending |
                        Select-Object Name, Count -First 10
# Display the top 10 internal sending domains
$internalDomainCounts | Format-Table Name, Count -AutoSize

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
 
 