#Chunksize Mimicry: From a master list, iterate over chunks of N files in folder/directory for ETL use 
function Chunks{
    param($All_Files)
    $j = 1
    for ($i=0; $i -le $All_Files.length-1; $i+=2){
        LogWrite Batch:' '$j
        $j++
        $CurrentBatch = $All_Files[$i..($i+1)]
        foreach($file in $CurrentBatch){
            LogWrite `t$file
        }
    }
}
