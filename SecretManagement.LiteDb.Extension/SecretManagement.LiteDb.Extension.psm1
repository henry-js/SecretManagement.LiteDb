# Necessary to correctly override and implement the existing SecretManagement functions
Using Namespace Microsoft.PowerShell.SecretManagement

# An internal function, specific to this LiteDB vault, that will be used to open the database for interaction
Function Open-Database {}

# The following five functions are the standard SecretManagement functions that we will implement
Function Get-Secret {}

Function Set-Secret {}

Function Remove-Secret {}

Function Get-SecretInfo {}

Function Test-SecretVault {}
