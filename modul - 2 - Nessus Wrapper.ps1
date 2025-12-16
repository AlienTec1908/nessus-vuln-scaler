cls
$ErrorActionPreference = "silentlycontinue"
$neustr = $null
$file = "$env:USERPROFILE\Desktop\Nessusscans\Nessus - Schwachstellenliste mit Hosts sortiert.txt"

$x = cat $file
$x > $file

function Ende([string]$titel){

         "____________________________________________________________________________________________________`n"
         
          Write-Host -ForegroundColor Yellow "                                ENDE der $titel"

         "____________________________________________________________________________________________________`n"
}

function getstring( [string]$neustr ){

    $len    = $neustr[0..$neustr.IndexOf("-")] -join ""
    $len    = $len + " "
    $neustr = $neustr.replace( $len,"")
    $neustr

}
cls

"____________________________________________________________________________________________________`n"
write-host -ForegroundColor Green "`n`n                          Anfang der Einträge und betroffenen Systeme `n" 
"____________________________________________________________________________________________________`n"

[array]$nessusHosts = cat $file | sort | ?{ $_ -notmatch '^\s*$' }
$nessusHosts 

$P = $( foreach( $line in $nessusHosts ){

         $hosts = $line[0..$line.IndexOf("-")] -join ""
          
       #[array]$hostN += $hosts | sort 
         getstring $line
})
#$hostN
$P = $P.replace("$P","")
$P = $P | sort | unique
"____________________________________________________________________________________________________`n"
         
  write-host -ForegroundColor Green "`n`n                          $($nessusHosts.Count) Einträge und $($P.count) Schwachstellen `n" 
"____________________________________________________________________________________________________`n"

$P; Ende "Schwachstellen"
$Schwachstellen = "$($P.count) Schwachstellen `n " 
 $Schwachstellen > "$env:USERPROFILE\Desktop\Nessusscans\Schwachstellenvonheute.txt"
$P >> "$env:USERPROFILE\Desktop\Nessusscans\Schwachstellenvonheute.txt" 

for( $item = 0; $item -lt $nessusHosts.count; $item++ ){
    
             $x = $item + 1
     [string]$b = $($nessusHosts[$x][0..6] -join "")
     [string]$a = $($nessusHosts[$item][0..6] -join "")
       $nessusH = "`t" + $nessusHosts[$item]
       $nessusH

     if( ! ($a | select-string -Pattern $b )){ "____________________________________________________________________________________________________`n" }

} Ende "Einträge"

$fileauswertung = "$env:USERPROFILE\Desktop\Nessusscans\Auswertung.txt"

     if( Test-Path -Path $fileauswertung ){

         Remove-Item -Path $fileauswertung -ErrorAction SilentlyContinue
     }

for( $i = 0; $i -lt $P.count; $i++ ){

     $count  = $i + 1
     $kurzer = $P[$i].Length / 2
     $kurzer = [math]::Round($kurzer,0)
     $kurzer = $P[$i][0..$kurzer] -join ""


     write-host -ForegroundColor Magenta "____________________________________________________________________________________________________`n"
     write-host -ForegroundColor Cyan "    $count ).       betroffen sind von Schwachstelle : " -NoNewline
     write-host -ForegroundColor Yellow    $kurzer 
     write-host -ForegroundColor Magenta "____________________________________________________________________________________________________`n"
         
     $Ausgabe = $nessusHosts  | Select-String -SimpleMatch $P[$i]
     
      
     $Ausgabe >> $fileauswertung 
     $Ausgabe   
     "`n`n"

} Ende "Schwachstellengruppierung" 


 