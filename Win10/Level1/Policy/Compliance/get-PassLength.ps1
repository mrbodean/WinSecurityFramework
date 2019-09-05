# !!! Only applies to local accounts !!!
$passlength = net accounts|Where-Object{$_ -match "Minimum password length"}
IF($passlength.count -eq 1){
    $passlength = $passlength.split(":")
    $passlength = $passlength[1]
    $passlength.Trim()
}else{
#not able to correctly retrieve Password Length
    "error"
}
