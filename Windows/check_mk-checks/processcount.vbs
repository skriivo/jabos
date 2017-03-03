strComputer = "."
strNameSpace = "root\cimv2"
strClass = "Win32_Thread"
iCount = 0
iSmall = 850
iBig = 1200
dim strprocess()
Dim StdOut 	: Set StdOut = Wscript.Stdout

Const STATE_OK          = 0
Const STATE_WARNING     = 1
Const STATE_CRITICAL    = 2
Const STATE_UNKNOWN		= 3

Set objClass = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\" & strNameSpace)
Set colProcesses = objClass.ExecQuery("Select * from Win32_Process")

For each objProcess in colProcesses
	redim strprocess(icount)
	strProcess(icount) = objProcess.name
	iCount = icount + 1
	Next
If iCount <= 10 Then
	Main = STATE_CRITICAL
ElseIf iCount > iBig Then        
	Main = STATE_CRITICAL
ElseIf iCount > iSmall Then        
	Main = STATE_WARNING
Else
	Main = STATE_OK
End If

wscript.echo Main & " Processcount - " & iCount & " processes were found."


' clean-up
icount = 0
iCount = 0

WScript.Quit