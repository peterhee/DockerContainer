# Command Line Arguments
$user = "pheese"
$name = "cmd-docfx"

if ($osarchitecture.StartsWith("ARM"))
{
	$cpu = "arm64"
}
else
{
	$cpu ="amd64"
}

$container = @([string]::Format('docker.io/{0}/{1}:{2}', $user, $name, $cpu))
$dockerfile = @([string]::Format('dockerfile.{0}', $cpu))
if (Test-Path $dockerfile) {
    docker build -t $container -f $dockerfile .
}
