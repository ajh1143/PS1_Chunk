# PS1_Chunk
Mimic Pandas Chunksize parameter in Powershell for use in ETL pipelines and batch jobs with logging mechanism 

## Parameters: 
Generate Current Date and Log File location for logging
```powershell
param($currDate = (Get-Date), 
       $Logfile = "PATH_TO_LOGS\log\"+$currDate.toString("yyyy-MM-dd HH-mm-ss")+"_test.log"
      )
```
## Logging Function
Logging Schema `[Date - Time - Function Step]`
```powershell  
Function LogWriter{
    Param ([string]$logstring, $session)
    $Stamp = $currDate.toString("yyyy/MM/dd HH:mm:ss")
    Add-content $Logfile -value ('{0} {1}' -f $Stamp, $logstring)
}
```

## Chunkerator 
```powershell
#Chunksize Mimicry: From a master list, iterate over chunks of N files in folder/directory for ETL use 
function Chunks{
    param($All_Files, $ChunkSize)
    $j = 1
    for ($i=0; $i -le $All_Files.length-1; $i+=$ChunkSize){
        LogWriter Batch:' '$j
        $j++
        $CurrentBatch = $All_Files[$i..($i+1)]
        foreach($file in $CurrentBatch){
            LogWriter `t$file
        }
    }
}
```
