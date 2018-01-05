$ErrorActionPreference = 'Stop';

$packageName = 'sbt'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://github.com/sbt/sbt/releases/download/v1.0.4/sbt-1.0.4.msi'
$url64       = ''

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sbt*'

  checksum       = 'DF8941C5F6B9CDE7B8AE54574CF65932FCEA304121EAFA1BF25619D66B3DFD34'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath -PathToInstall "$($env:SystemDrive)\Program Files (x86)\sbt\bin" -PathType 'Machine'