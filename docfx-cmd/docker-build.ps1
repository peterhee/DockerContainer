# Command Line Arguments
$user = "pheese"
$name = "cmd-docfx"
$cpu = "arm64"
for ($i = 0; $i -le $Args.count; $i++ ) {
	If ($Args[$i].Length -gt 0)
		{
		Switch ($Args[$i].ToLower())
			{
			"amd64" {
					$cpu = [String]$Args[$i]}
			default {
                $cpu = "arm64"
                } 
			}
		}
	}


$container = @([string]::Format('docker.io/{0}/{1}:{2}', $user, $name, $cpu))
$dockerfile = @([string]::Format('dockerfile.{0}', $cpu))
if (Test-Path $dockerfile) {
    docker build -t $container -f $dockerfile .
}
