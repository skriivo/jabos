Set objFSO = CreateObject("Scripting.FileSystemObject")
objStartFolder = "C:\" '!! change this to the folder you want checked, can be a network drive as well !!
ShowSubFolders (objFSO.GetFolder(objStartFolder)) 

Wscript.Echo ShowSubFolder

function ShowSubFolders(Folder)

	Const STATE_OK          = 0
	Const STATE_WARNING     = 1
	Const STATE_CRITICAL    = 2
	Const STATE_UNKNOWN	= 3

Dim lArray	: lArray = Array("OK", "WARN", "CRIT", "SCRIPT OUTDATED")
Dim StdOut 	: Set StdOut = Wscript.Stdout
Dim strFolders()
Dim iCount
iCount = 0
lCount = 6	' !!! CHANGE THIS VALUE TO THE CORRECT AMOUNT OF FOLDERS !!!
For Each Subfolder in Folder.SubFolders
	ReDim strFolders(icount)
	strFolders(icount) = Subfolder.name
	iCount = icount + 1
	Next
    If iCount <= 1 Then
        Main = STATE_CRITICAL
    ElseIf iCount < lCount Then        
        Main = STATE_WARNING
    ElseIf iCount > lCount Then        
        Main = STATE_UNKNOWN
    Else
        Main = STATE_OK
    End If

'StdOut.WriteLine lArray(Main) & ": " & iCount & " folder(s) out of " & lCount & " were found. State = " & lArray(Main)
StdOut.WriteLine Main & " DFSCHECK - " & iCount & " folder(s) out of " & lCount & " were found. State = " & lArray(Main)

end function

' clean-up
icount = 0
iCount = 0

WScript.Quit