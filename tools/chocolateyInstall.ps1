$ErrorActionPreference = 'Stop';

$packageName = 'sbt'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.msi'
$url64       = ''

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sbt*'

  checksum       = '845FBE684CE88462F76F7AD5180931326096BC40325113295B8CDF725771CD26'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
