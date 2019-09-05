# !!! Only applies to local accounts !!!
$lockoutduration = 15
$lockoutwindow = net accounts|Where-Object{$_ -match "Lockout observation window"}
IF($lockoutwindow.count -eq 1){
    $lockoutwindow = $lockoutwindow.split(":")
    $lockoutwindow = $lockoutwindow[1]
    $lockoutwindow =$lockoutwindow.Trim()
}else{
# not able to correctly retrieve Account lockout window
# set the lockout window to match the lockout threshold to ensure we can set the threshold
    net accounts /lockoutwindow:$lockoutthreshold
}
If($lockoutwindow -gt $lockoutduration){net accounts /lockoutwindow:$lockoutduration}
net accounts /lockoutduration:$lockoutduration