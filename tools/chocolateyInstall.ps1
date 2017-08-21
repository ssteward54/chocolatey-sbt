$ErrorActionPreference = 'Stop';

$packageName = 'sbt'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://github.com/sbt/sbt/releases/download/v1.0.0/sbt-1.0.0.msi'
$url64       = ''

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sbt*'

  checksum       = 'BC8FA88882D0A2C3660A920279E7E8C1D1D75B557825B292AC474D56EA19C4F6'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
