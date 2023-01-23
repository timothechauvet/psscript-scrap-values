function Get-ReferenceLocation
{
<#
.SYNOPSIS
This script is used to get all references of a string recursively in a folder and its locations.
Function: Get-ReferenceLocation
Author: Timothé Chauvet, Twitter: @TimotheChauvet
Required Dependencies: None
Optional Dependencies: None
Version: 1.0
.DESCRIPTION
This script is used to get all references of a string recursively in a folder and its locations. 
This won't output anything and will write a text file as a result in the parent folder, namely "result.txt".
This will output the results if the flag -ToString is set.
.PARAMETER ToString
Switch: Outputs the data as text instead as in a file.
.PARAMETER Text
String: String of text or Regex command to lookup for.
.EXAMPLE
Get-ReferenceLocation -Text DATABASENAME
Gets string and outputs the location of the strings that have been found in a file.
Get-ReferenceLocation -Text DATABASENAME -ToString
Gets string and outputs the location of the strings that have been found as raw text.
.NOTES
This script will output context
.LINK
Github repo: https://github.com/timothechauvet/psscript-scrap-values
#>

    Param(
        [Parameter(Position = 0, Mandatory = $true)]
        [String]
        $Text,

        [Parameter(Position = 1, Mandatory = $false)]
        [Switch]
        $ToString
    )



    if($ToString) 
    {
        Get-ChildItem -Recurse | ForEach-Object {
            $_ | Select-String $Text -AllMatches -SimpleMatch -Context 6,6 | ForEach-Object {
                Write-Output $_
            }
            Write-Output "---"
        }
    }
    else
    {
        Get-ChildItem -Recurse | ForEach-Object {
            $_ | Select-String $Text -AllMatches -SimpleMatch -Context 6,6 | ForEach-Object {
                $_ | Out-File ../result.txt -Append
            }
            Out-File ../result.txt -Append
        }
    }


}

