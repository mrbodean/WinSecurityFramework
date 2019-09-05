# !!! Only applies to local accounts !!!
$lockoutwindow = 15
$lockoutduration = net accounts|Where-Object{$_ -match "Lockout duration"}
IF($lockoutduration.count -eq 1){
    $lockoutduration = $lockoutduration.split(":")
    $lockoutduration = $lockoutduration[1]
    $lockoutduration =$lockoutduration.Trim()
}else{
# not able to correctly retrieve Account duration
# set the lockout duration to match the lockout window to ensure we can set the threshold
    net accounts /lockoutwindow:$lockoutthreshold
}
If($lockoutduration -gt $lockoutwindow){net accounts /lockoutduration:$lockoutduration}
net accounts /lockoutwindow:$lockoutwindow