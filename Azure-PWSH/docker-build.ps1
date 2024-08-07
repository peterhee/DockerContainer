# Command Line Arguments
$user = "pheese"
$name = "azure-pwsh"
$cpu = "arm64"
$USER_ID = "1000"
$GROUP_ID = "1000"
$PS_VERSION="7.4.3"

$osarchitecture = $(Get-ComputerInfo).OsArchitecture
write-host $osarchitecture

if ($osarchitecture.StartsWith("ARM"))
{
	$cpu = "arm64"
}
else
{
	$cpu ="amd64"
}


for ($i = 0; $i -le $Args.count; $i++ ) {
	If ($Args[$i].Length -gt 0)
		{
		Switch ($Args[$i].ToLower())
			{
			{@("-e", "--enable" -contains $_)}
				{
					$userenabled = $true
				}
			{@("-u", "--uid" -contains $_.Split("=")[0])}
				{
					$USER_ID = $Args[$i].Split("=")[1]
				}
			{@("-g", "--gid" -contains $_.Split("=")[0])}
				{
					$GROUP_ID = $Args[$i].Split("=")[1]
				}
			{@("-p", "--pwsh" -contains $_.Split("=")[0])}
				{
					$PS_VERSION = $Args[$i].Split("=")[1]
				}
			default {
				write-host $_
				write-host "*** Command line help ***"
				write-host 'Default: USER_ID="1000" GROUP_ID="1000" PS_VERSION="7.4.4"'
				write-host '-e or --enable "To enable user in container"'
				write-host '-u="{USER_ID}" or --uid="{USER_ID}"'
				write-host '-g="{GROUP_ID}" or --gid="{GROUP_ID}"'
				write-host '-p="{PS_VERSION}" or --pwsh={PS_VERSION}'
				write-host 'docker-build.ps1 -p="7.4.4" -u="1000" -g="1000" -e'
				write-host 'docker-build.ps1 -p="7.4.4"'
				exit 1
                } 
			}
		}
	}

if ($userenabled) {
	$container = @([string]::Format('docker.io/{0}/{1}:{2}', $user, $name, $cpu))
	$grpid = @([string]::Format('GROUP_ID={0}', $GROUP_ID))
	$userid = @([string]::Format('USER_ID={0}', $USER_ID))
	$ps =  @([string]::Format('PS_VERSION={0}', $PS_VERSION))
	$dockerfile = @([string]::Format('dockerfile.user.{0}', $cpu))
} else {
	$container = @([string]::Format('docker.io/{0}/{1}:{2}', $user, $name, $cpu))
	$dockerfile = @([string]::Format('dockerfile.{0}', $cpu))
}

if (Test-Path $dockerfile) {

	if ($userenabled) {
		write-host "docker build -t $container --build-arg $ps --build-arg $userid --build-arg $grpid -f $dockerfile ."
		docker build -t $container --build-arg $ps --build-arg $userid --build-arg $grpid -f $dockerfile .
	}
	else {
		write-host "docker build -t $container --build-arg $ps -f $dockerfile ."
		docker build -t $container --build-arg $ps -f $dockerfile .
	}
}
