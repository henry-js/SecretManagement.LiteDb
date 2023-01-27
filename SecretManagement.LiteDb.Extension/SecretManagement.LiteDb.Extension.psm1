# Necessary to correctly override and implement the existing SecretManagement functions
Using Namespace Microsoft.PowerShell.SecretManagement
Using Namespace LiteDB

# An internal function, specific to this LiteDB vault, that will be used to open the database for interaction
Function Open-Database {}

# The following five functions are the standard SecretManagement functions that we will implement
Function Get-Secret {}

Function Set-Secret {}

Function Remove-Secret {}

Function Get-SecretInfo {}

Function Test-SecretVault {}

function Open-Database {
    [CmdletBinding()]
    param (
        # The path to the actual database file on disk
        [Parameter(Mandatory)]
        [string]$Path
    )

    begin {
        # Make the vault parameters from the Register-SecretVault function available
        $modulePath = (Get-Module -Name SecretManagement.LiteDb.Extension).Path
        $liteDll = (Get-ChildItem -Filter "LiteDB.dll" -Path "$(Split-Path $modulePath | Split-Path)\assemblies").FullName
        (Get-ChildItem -Filter "LiteDB.dll" -Path "$(Split-Path $modulePath | Split-Path)\assemblies").FullName
        Add-Type -Path $liteDll -ErrorAction SilentlyContinue

        Write-Verbose "Opening Database: $Path" -Verbose:$VaultParameters.Verbose

        $Database = [LiteDatabase]::New($Path)

        If ($Database) {
            Write-Verbose "Database Opened: $($Database | Out-String)" -Verbose:$VaultParameters.Verbose

            # Output the database variable for use by consuming functions
            $Database
        } Else {
            Throw "Failed to open Database"
        }
    }

    process {
        <# Check to see if the type has already been added. If it has not, attempt to find the DLL path
            and perform an Add-Type to make the LiteDB class available #>
    }

    end {
        $Database.Dispose()
    }
}
