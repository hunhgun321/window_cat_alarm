rem This file is to create a alert to tell me lunch time and time to leave
@echo off

rem this console will be terminated very soon after it starts. The remaining of the program is actually depended on the cmd opened by the START command.
rem In order to terminate the program immediately, you can do > taskkill /f /t /pid [the pid of the cmd]. The relevant pid should be in the PID_main.txt  
Rem tasklist /v /fo csv | findstr /i "controller_for_cat" >> PID_main.txt
rem the line below start a new session of cmd.exe, such that it won't stop the current program
rem and the program will be running in minimize mode by setting /MIN for the start command
rem the title command set the name of the program such that u can search it in tasklist through its name
rem the & symbol of the command list for START command is used for running multiple commands in order from left to right
Rem start /MIN cmd.exe /c "powershell.exe -File main.ps1 -ExecutionPolicy bypass & title "controller_for_cat" & echo "Base terminal\n" > PID_main.txt"


Rem the code is the original with the program that you can see the console in the taskbar in windows
echo > PID_main.txt
CScript ".\hide_program.vbs"