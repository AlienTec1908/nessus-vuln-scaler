$file = "$env:USERPROFILE\Desktop\Nessusscans\Auswertung.txt"
$Auswertung = cat $file
cls


$Filter = $(
foreach( $line in $Auswertung ){

         $linecut = $line[0..($line.IndexOf("-")+1)] -join ""
         $line    = $line.Replace($linecut, "") 
         $line 
})

$Filter    = $Filter | sort | unique
[array]$Filter    = $Filter | sort | ?{ $_ -notmatch '^\s*$' }

write-host -ForegroundColor Yellow "`n`t`t`t`t`t"  $Filter.Count -NoNewline
write-host -ForegroundColor Magenta " Schwachstellen `n"

foreach( $line in $Filter  ){

if($line -match "High"){

    write-host -ForegroundColor Yellow $line  
    
    } else {
    
    write-host -ForegroundColor red $line  
  }
}
