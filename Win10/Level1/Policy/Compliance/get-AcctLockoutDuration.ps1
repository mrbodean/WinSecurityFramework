$lockoutdur = net accounts|Where-Object{$_ -match "Lockout duration"}
IF($lockoutdur.count -eq 1){
    $lockoutdur = $lockoutdur.split(":")
    $lockoutdur = $lockoutdur[1]
    $lockoutdur.Trim()
}else{
#not able to correctly retrieve Account lockout duration
    "error"
}