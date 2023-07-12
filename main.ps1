chcp 437
echo "Inside the main.ps1" >> PID_main.txt
echo "$(Get-Date)__PID: $PID" >> PID_main.txt
$time_for_lunch = 0
$time_to_leave = 0

while(1){
        echo "run loop" >> PID_main.txt
        $the_time = get-date -Format "HH:mm"
        if (($the_time.substring(0,2) -eq "12"))
        {
                echo "12 loop" >> PID_main.txt
               
                # $(...) is used for parsing command nested with command and return the final output of the commands
                if(($([int]$the_time.substring($the_time.length - 2)) -gt 45) -and ($time_for_lunch -lt 1) ){
                        echo "should run the cat" >> PID_main.txt
                        & ".\testing.ps1" "C:\\Users\\hkykleun\\Desktop\\startupProgram\\ezgif.com-gif-maker.gif"
                        $time_for_lunch += 1
                        # using the line below can execute a new ps1 script in new process without interrupting the current flow of the program
                        # which the current program will not be stopped running
                        # start / start-process command in powershell has an argument that can hide the window for the program that is going to start
                        #IEX -Command "start -windowstyle hidden powershell -ArgumentList '-File .\testing.ps1'"
                }
        }
        elseif ($the_time.substring(0,2) -eq "17")
        {
                if(($([int]$the_time.substring($the_time.length - 2)) -gt 45) -and ($time_to_leave -lt 1) ){
                        & ".\testing.ps1" "C:\\Users\\hkykleun\\Desktop\\startupProgram\\goHome.gif"
                        $time_to_leave += 1
                }
        }
        else
        {
                $time_for_lunch = 0
                $time_to_leave = 0
        }
        Start-Sleep 60
}