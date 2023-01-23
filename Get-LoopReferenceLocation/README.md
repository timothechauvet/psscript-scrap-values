Script to get all locations of a string referenced in a folder. 

This will output every reference to your string input in a file named "result.txt" which will be located one folder above the current one.

To use the function in PowerShell, add it to your list of functions to use it :
```powershell
. .\Get-ReferenceLocation.ps1

# The -ToString flag is optional and will output the result in PowerShell instead of a file
Get-ReferenceLocation -Text mydatabasename -ToString 
```