# !!! Only applies to local accounts !!!
$passhistory = net accounts|Where-Object{$_ -match "Length of password history maintained"}
IF($passhistory.count -eq 1){
    $passhistory = $passhistory.split(":")
    $passhistory = $passhistory[1]
    $passhistory.Trim()
}else{
#not able to correctly retrieve Account lockout duration
    "error"
}
