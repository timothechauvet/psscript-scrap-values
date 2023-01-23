function Get-LoopReferenceLocation
{
<#
.SYNOPSIS
This script is used to get all references of multiple strings recursively in a folder and its locations.
Function: Get-LoopReferenceLocation
Author: Timothé Chauvet, Twitter: @TimotheChauvet
Required Dependencies: None
Optional Dependencies: None
Version: 1.0
.DESCRIPTION
This script is used to get all references of multiple strings recursively in a folder and its locations. 
This won't output anything and will write a text file as a result in the parent folder, namely "result.txt".
This will output the results if the flag -ToString is set.
.PARAMETER ToString
Switch: Outputs the data as text instead as in a file.
.PARAMETER File
String: Location of the file to loop in.
.EXAMPLE
Get-LoopReferenceLocation -File "../input.txt"
Gets string list and outputs the location of the strings that have been found in a file.
Get-LoopReferenceLocation -Text "../input.txt" -ToString
Gets string list and outputs the location of the strings that have been found as raw text.
.NOTES
This script won't output context, only the file where it has been found
.LINK
Github repo: https://github.com/timothechauvet/psscript-scrap-values
#>

    Param(
        [Parameter(Position = 0, Mandatory = $true)]
        [String]
        $File,

        [Parameter(Position = 1, Mandatory = $false)]
        [Switch]
        $ToString
    )



    if($ToString) 
    {
        Get-Content $File | ForEach-Object {
            Write-Output $_
            Get-ChildItem -Recurse -Include * | Select-String $_ -AllMatches -SimpleMatch -Context 0,0 | ForEach-Object {
                    Write-Output " -  $_.Path · Line : $_.LineNumber"
                }
        }
    }
    else
    {
        Get-Content $File | ForEach-Object {
            $_ | Out-File ../result.txt -Append
            Get-ChildItem -Recurse -Include * | Select-String $_ -AllMatches -SimpleMatch -Context 0,0 | ForEach-Object {
                    ' - ' + $_.Path + ' · Line : ' + $_.LineNumber | Out-File ../result.txt -Append
                }
        }
    }


}

