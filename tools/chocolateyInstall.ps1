
$ErrorActionPreference = 'Stop';


$packageName= 'sbt'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.bintray.com/sbt/native-packages/sbt/0.13.9/sbt-0.13.9.2.msi'
$url64      = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Simple Build Tool'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPackage @packageArgs

















