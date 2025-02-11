Import-Module ExchangeOnlineManagement
Get-MailboxJunkEmailConfiguration -Identity usersemailaddress@domain.com
Get-MailboxJunkEmailConfiguration -Identity usersemailaddress@domain.com -BlockedSendersAndDomains @{remove="usersemailaddress@domain.com"}