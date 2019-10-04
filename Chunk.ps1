param($currDate = (Get-Date), 
       $Logfile = "PATH_TO_LOGS\log\"+$currDate.toString("yyyy-MM-dd HH-mm-ss")+"_test.log"
      )

# Logging Schema [Date - Time - Function Step]  
Function LogWrite{
    Param ([string]$logstring, $session)
    $Stamp = $currDate.toString("yyyy/MM/dd HH:mm:ss")
    Add-content $Logfile -value ('{0} {1}' -f $Stamp, $logstring)
}

#Chunksize Mimicry: From a master list, iterate over chunks of N files in folder/directory for ETL use 
function Chunks{
    param($All_Files, $ChunkSize)
    $j = 1
    for ($i=0; $i -le $All_Files.length-1; $i+=$ChunkSize){
        LogWrite Batch:' '$j
        $j++
        $CurrentBatch = $All_Files[$i..($i+1)]
        foreach($file in $CurrentBatch){
            LogWrite `t$file
        }
    }
}
