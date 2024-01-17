# Command Line Arguments
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

$user = "pheese"
$name = "azure-pwsh"
write.host $cpu

if (Test-Path dockerfile.$cpu) {
    write-host docker build -t docker.io/$user/$name:$cpu -f dockerfile.$cpu .
}

