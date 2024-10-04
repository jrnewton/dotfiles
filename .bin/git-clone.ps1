#param(
#  [Parameter(Mandatory=$false)] [string] $url,
#  [Parameter(Mandatory=$false)] [string] $targetDir
#)

$ErrorActionPreference="Stop"
$WarningPreference = "Stop"
Set-StrictMode -Version 3.0

$bare = $false
$url = $null
$targetDir = $null
$repoName = $null

if ($args.Length -eq 0) {
  Write-Host "Args required"
  exit 4
}
elseif ($args.length -eq 1) {
  $url = $args[0]
}
elseif ($args.Length -eq 2) {
  if ($args[0] -eq "--bare") {
    $bare = $true
    $url = $args[1]
  }
  else {
    $url = $args[0]
    $targetDir = $args[1]
  }
}
elseif ($args.length -eq 3) {
  if ($args[0] -eq "--bare") {
    $bare = $true
  }
  else {
    Write-Host "Unsupported first arg out of three args"
    exit 26
  }

  $url = $args[1]
  $targetDir = $args[2]
}
else {
  Write-Host "Unsupported args greater than 3"
  exit 46
}

$repoName = $($url -Split "/")[-1]

$cwd = $(Get-Location).path
if ($null -eq $targetDir) {
  $targetDir = "$($cwd)\$($repoName)"
}
else {
  $targetDir = "$($cwd)\$($targetDir)"
}

if ($bare) {
  git clone $url $targetDir
}
else {
  git clone $url $targetDir
}

if ($LastExitCode -eq 0) {
  Write-Output "$repoName $bare $targetDir $url" >> C:\work\code\git_clone_log.txt
}

