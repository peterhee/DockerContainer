$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$targetNugetExe = "$rootPath\nuget.exe"
Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
Set-Alias nuget $targetNugetExe -Scope Global -Verbose
nuget install Selenium.WebDriver.ChromeDriver -ExcludeVersion
Copy-Item  Selenium.WebDriver.ChromeDriver\driver\win32\chromedriver.exe . -force