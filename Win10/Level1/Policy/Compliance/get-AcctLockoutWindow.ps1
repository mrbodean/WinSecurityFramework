$lockoutwindow = net accounts|Where-Object{$_ -match "Lockout observation window"}
IF($lockoutwindow.count -eq 1){
    $lockoutwindow = $lockoutwindow.split(":")
    $lockoutwindow = $lockoutwindow[1]
    $lockoutwindow =$lockoutwindow.Trim()
    $lockoutwindow
}else{
# not able to correctly retrieve Account lockout window
    "error"
}