$ErrorActionPreference = 'Stop';

$packageName = 'sbt'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://github.com/sbt/sbt/releases/download/v1.1.4/sbt-1.1.4.msi'
$url64       = ''

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sbt*'

  checksum       = '83598896F849E6C863ADA9604316075E09D96F681BAAA09F2B13D25B9A2E2238'
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath -PathToInstall "$($env:SystemDrive)\Program Files (x86)\sbt\bin" -PathType 'Machine'