# Command Line Arguments
$user = "pheese"
$name = "azure-pwsh"
$cpu = "arm64"
$USER_ID = "1000"
$GROUP_ID = "1000"
$PS_VERSION="7.4.3"
$UBUNTU_VERSION = "22.04"

$osarchitecture = $(Get-ComputerInfo).OsArchitecture
write-host $osarchitecture

if ($osarchitecture.StartsWith("ARM"))
{
	$cpu = "arm64"
	$IMAGE_REPO ="arm64v8/ubuntu"
}
else
{
	$cpu ="x64"
	$IMAGE_REPO = "ubuntu"
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
			{@("-n", "--name" -contains $_.Split("=")[0])}
				{
					$USER_NAME = $Args[$i].Split("=")[1]
				}
			default {
				write-host $_
				write-host "*** Command line help ***"
				write-host '	-e or --enable "To run a Docker container as a non-root user"'
				write-host '	-u="{USER_ID}" or --uid="{USER_ID}"'
				write-host '	-g="{GROUP_ID}" or --gid="{GROUP_ID}"'
				write-host '	-p="{PS_VERSION}" or --pwsh={PS_VERSION}'
				write-host 'Default: root user PS_VERSION="7.4.3"'
				write-host '	'$($MyInvocation.MyCommand.Name) '-p="7.4.4"'
				write-host 'Default: non-root user USER_ID="1000" GROUP_ID="1000" PS_VERSION="7.4.3"'
				write-host '	'$($MyInvocation.MyCommand.Name) '-p="7.4.4" -u="1001" -g="1001" -e'
				exit 1
                } 
			}
		}
	}

if ($userenabled) {
	$container = @([string]::Format('docker.io/{0}/{1}:{2}', $user, $name, $cpu))
	$tag = @([string]::Format('TAG={0}', $UBUNTU_VERSION))
	$cpu_arg = @([string]::Format('CPU={0}', $cpu))
	$image = @([string]::Format('IMAGE={0}', $IMAGE_REPO))
	$grpid = @([string]::Format('GROUP_ID={0}', $GROUP_ID))
	$userid = @([string]::Format('USER_ID={0}', $USER_ID))
	$username = @([string]::Format('USER_NAME={0}', $USER_NAME)) 
	$psversion =  @([string]::Format('PS_VERSION={0}', $PS_VERSION))
	$dockerfile = @([string]::Format('dockerfile.user.{0}', $cpu))
} else {
	$container = @([string]::Format('docker.io/{0}/{1}:{2}', $user, $name, $cpu))
	$dockerfile = @([string]::Format('dockerfile.{0}', $cpu))
}

if (Test-Path $dockerfile) {

	if ($userenabled) {
		write-host "docker build -t $container --build-arg $cpu_arg --build-arg $image --build-arg $tag --build-arg $psversion --build-arg $userid --build-arg $username --build-arg $grpid -f $dockerfile ."
		docker build -t $container --build-arg $psversion --build-arg $userid --build-arg $grpid -f $dockerfile .
	}
	else {
		write-host "docker build -t $container --build-arg $psversion -f $dockerfile ."
		docker build -t $container --build-arg $psversion -f $dockerfile .
	}
}
