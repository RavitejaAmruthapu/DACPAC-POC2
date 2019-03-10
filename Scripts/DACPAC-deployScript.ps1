param([string]$tcDir = "C:\Users\Teja\Documents\Visual Studio 2015\Projects\DACPAC-POC2\DACPAC-POC2\bin\Debug")
Add-Type -Path "C:\Program Files (x86)\Microsoft SQL Server\120\DAC\bin\Microsoft.SqlServer.Dac.dll"
$dacService = new-object Microsoft.SqlServer.Dac.DacServices "server=(local)"
$dacPac = [Microsoft.SqlServer.Dac.DacPackage]::Load("$tcDir\DACPAC-POC2.dacpac")
$dacService.deploy($dacPac, "QA", "True")