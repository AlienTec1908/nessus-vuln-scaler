cls
mkdir "$env:USERPROFILE\Desktop\Nessusscans\"
Write-host -ForegroundColor cyan "All Nessus Scan CSV output files must be in one directory!`n`nA new directory has been created for the evaluation:`n$($env:USERPROFILE)\Desktop\Nessusscans"
$pfad_rz1 = Read-Host "Please enter the path to the Nessus Scan CSV files:" 

$csvkomplett  = cat "$pfad_rz1\*.csv" 


$CSVcountAll = $csvkomplett.count
$CSVcountCVE = $csvkomplett | Select-String -Pattern "CVE-".count
[array]$CSVAllCVE   = $csvkomplett | Select-String -Pattern "CVE-"

cls

write-host -ForegroundColor Green "Total entries: $CSVcountAll , with $CSVcountCVE vulnerabilities" 

$FormatCVE = $( 

foreach( $CVE in $CSVAllCVE ){

    $CVE = $CVE -replace('"',"") 
    $CVE = $CVE.Split(",")  
    $CVE = $CVE[2] + " - " + $CVE[5]  + " - " + $CVE[1]    
    $CVE
}) 

$Anzahl  = $($FormatCVE | sort | unique).count
$Systeme = $($FormatCVE | sort | unique)

[array]$Windows = ("Microsoft", "Explorer", "Update", "Windows")

write-host -ForegroundColor Green "Total unique entries: $Anzahl , vulnerabilities:`n"

$Microsoft = $Systeme | select-string -Pattern "Microsoft", "Explorer" , "Windows", "MS\d+", "KB", "winSCP" 
$Microsoft = $Microsoft | where{ $_ -notmatch "Host - Name" }
$LinuxApps = @()

cls;
$LinuxApps = $Systeme | where{ $_ -notmatch "Windows" } 
$LinuxApps = $LinuxApps | where{ $_ -notmatch "winSCP" }
$LinuxApps = $LinuxApps | where{ $_ -notmatch "KB" }
$LinuxApps = $LinuxApps | where{ $_ -notmatch "Explorer" }
$LinuxApps = $LinuxApps | where{ $_ -notmatch "Microsoft" }
$LinuxApps = $LinuxApps | where{ $_ -notmatch "MS\d+" }
$LinuxApps = $LinuxApps | where{ $_ -notmatch "Host - Name" }


write-host -ForegroundColor Green "`n--------------------------------------------------------------------------------------------`n" 

write-host -ForegroundColor Green "`n`t`t`t`t$($LinuxApps.count) Linux and App vulnerabilities`n"

write-host -ForegroundColor Green "`n--------------------------------------------------------------------------------------------`n" 

$LinuxApps

write-host -ForegroundColor Green "`n--------------------------------------------------------------------------------------------`n"

write-host -ForegroundColor Yellow "`n`t`t`t`t$($Microsoft.count) Windows vulnerabilities`n" 

write-host -ForegroundColor Yellow "`n--------------------------------------------------------------------------------------------`n"
$Microsoft | Out-File "$env:USERPROFILE\Desktop\Nessusscans\Nessus - Schwachstellenliste mit Hosts sortiert.txt"

write-host -ForegroundColor Yellow "`n--------------------------------------------------------------------------------------------`n" 



 
