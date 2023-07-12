Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "powershell -executionpolicy bypass -noexit -file C:\Users\hkykleun\Desktop\startupProgram\main.ps1", 0
Rem The code below set the webshell variable to Nothing. It is not a MUST but it is generally the lore in VB community
Set WshShell = Nothing