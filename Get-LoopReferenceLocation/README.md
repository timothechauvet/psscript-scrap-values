Script to get all locations of multiple strings referenced in a folder. 

This will output every reference to your strings in the input file, in a file named "result.txt" which will be located one folder above the current one.

To use the function in PowerShell, add it to your list of functions to use it :
```powershell
. .\Get-LoopReferenceLocation.ps1

# The -ToString flag is optional and will output the result in PowerShell instead of a file
Get-LoopReferenceLocation -File "../text.txt" -ToString 
```