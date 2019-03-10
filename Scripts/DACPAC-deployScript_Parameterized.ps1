#-- to run this script we need to pass parameter
#-tcDir %teamcity.build.checkoutDir%
#-dacpac_location %dacpac_location%
param([string]$tcDir = "%teamcity.build.checkoutDir%")
param([string]$dacpac_location = "%dacpac_location%")
Add-Type -Path "C:\Program Files (x86)\Microsoft SQL Server\120\DAC\bin\Microsoft.SqlServer.Dac.dll"
$dacService = new-object Microsoft.SqlServer.Dac.DacServices "server=(local)"
$dacPac = [Microsoft.SqlServer.Dac.DacPackage]::Load("$tcDir\$dacpac_location")
$dacService.deploy($dacPac, "QA", "True")
