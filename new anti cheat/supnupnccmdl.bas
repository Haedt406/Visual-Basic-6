Attribute VB_Name = "Module1"
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function Findprocess Lib "user32" Alias "FindWindowA" (ByVal Classname As String, ByVal Processname As String) As Long
Public Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Public Declare Function Openprocess Lib "kernel32" Alias "OpenProcess" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Public Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function ReadProcessMem Lib "kernel32" Alias "ReadProcessMemory" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, ByRef lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public FindGame As Long
Private Declare Function FindDebugger Lib "kernel32.dll" Alias "IsDebuggerPresent" () As Long




Public Sub WriteAInt(Address As Long, Value As Byte)
    Dim hwnd As Long, pid As Long, phandle As Long
        hwnd = Findprocess(vbNullString, "msnmsgr.exe")
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, pid
        phandle = Openprocess(&H1F0FFF, False, pid)
        WriteProcessMemory phandle, Address, Value, 2, 0&
        CloseHandle phandle
    End If
End Sub



Public Sub SpyCheck(MessageToDisplay As String)
    Dim Spy1 As Long
    Dim Spy2 As Long
    Dim Spy3 As Long
        Spy1 = Findprocess(vbNullString, "TRNSNP")
        Spy2 = Findprocess(vbNullString, "TrainerSpy XP + NT / 2000 / XP + Coded By BofeN")
        Spy3 = Findprocess(vbNullString, "OllyDbg")
            If Spy1 <> 0 Then
                MsgBox MessageToDisplay, vbCritical, "Error 24"
                End
            End If
            If Spy2 <> 0 Then
                MsgBox MessageToDisplay, vbCritical, "Error 24"
                End
            End If
            If Spy3 <> 0 Then
                MsgBox MessageToDisplay, vbCritical, "Error 24"
                End
            End If
            If (FindDebugger) Then
                MsgBox MessageToDisplay, vbCritical, "Error 15"
            End If
End Sub




Public Sub WriteAscii(StartAddress As Long, WhatToWrite As String)
    Dim Go As Long
        For Go& = 0 To (Len(WhatToWrite) - 1)
            Call WriteALong((StartAddress + Go), Asc(Mid$(WhatToWrite, Go + 1)))
        Next Go&
    Call WriteALong(StartAddress + Len(WhatToWrite), 0)
End Sub


