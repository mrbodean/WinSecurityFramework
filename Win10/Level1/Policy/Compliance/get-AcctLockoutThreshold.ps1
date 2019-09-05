$lockoutthreshold = net accounts|Where-Object{$_ -match "Lockout threshold"}
IF($lockoutthreshold.count -eq 1){
    $lockoutthreshold = $lockoutthreshold.split(":")
    $lockoutthreshold = $lockoutthreshold[1]
    $lockoutthreshold = $lockoutthreshold.Trim()
    # If the value is Never to is set to 0. However for the
    # CI compliance check to allow a more restrictive setting it will check
    # for a value equal to or less than the baseline value. So Never is replaced
    # with a artifical value  
    If($lockoutthreshold -eq "Never"){$lockoutthreshold = 999999} 
    $lockoutthreshold
}else{
#not able to correctly retrieve Account Lockout threshold
    "error"
}