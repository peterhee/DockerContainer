# Command Line Arguments
$user = "pheese"
$name = "azure-cli"
$cpu = "arm64"
$USER_ID = "1000"
$GROUP_ID = "1000"

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
			default {
				write-host $_
				write-host "*** Command line help ***"
				write-host "Default: USER_ID=1000 GROUP_ID=1000"
				write-host '-e or --enable "To enable user in container"'
				write-host '-u="{USER_ID}" or --uid="{USER_ID}"'
				write-host '-g="{GROUP_ID}" or --gid="{GROUP_ID}"'
				exit 1
                } 
			}
		}
	}

if ($userenabled) {
	$container = @([string]::Format('docker.io/{0}/{1}:{2} --build-arg USER_ID={3} --build-arg GROUP_ID={4}', $user, $name, $cpu, $USER_ID, $GROUP_ID))
	$dockerfile = @([string]::Format('dockerfile.user.{0}', $cpu))
} else {
	$container = @([string]::Format('docker.io/{0}/{1}:{2}', $user, $name, $cpu))
	$dockerfile = @([string]::Format('dockerfile.{0}', $cpu))
}

if (Test-Path $dockerfile) {

	write-host "docker build -t $container -f $dockerfile ."
    docker build -t $container -f $dockerfile .
}
