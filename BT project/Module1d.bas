Attribute VB_Name = "Module1"
Option Explicit


Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Function ReadProcessMemory Lib "kernel32" (ByVal hprocess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal Classname As String, ByVal WindowName As String) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Private Declare Function Openprocess Lib "kernel32" Alias "OpenProcess" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hprocess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function ReadProcessMem Lib "kernel32" Alias "ReadProcessMemory" (ByVal hprocess As Long, ByVal lpBaseAddress As Any, ByRef lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public FindGame As Long
Public Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
Public Const MOUSEEVENTF_LEFTDOWN = &H2
Public Const MOUSEEVENTF_LEFTUP = &H4

Public Sub SetGame(WindowCaption As String)
  FindGame = FindWindow("NLGAMECLASS", WindowCaption)
End Sub

Public Function WriteALong(Address As Long, Value As Long)
Dim pid&, phandle&
If FindGame = 0 Then Exit Function
GetWindowThreadProcessId FindGame, pid
phandle = Openprocess(&H1F0FFF, False, pid)
If phandle = 0 Then Exit Function
WriteProcessMemory phandle, Address, Value, 4, 0&
CloseHandle phandle
End Function


Public Sub LeftClick()
    LeftDown
End Sub

Public Sub LeftDown()
    mouse_event MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0
End Sub

Public Sub LeftUp()
    mouse_event MOUSEEVENTF_LEFTUP, 0, 0, 0, 0
End Sub
'Public Sub SpyCheck(MessageToDisplay As String)
   ' Dim Spy1 As Long
  '  Dim Spy2 As Long
  '  Dim Spy3 As Long
  '      Spy1 = FindWindow(vbNullString, "TRNSNP")
   '     Spy2 = FindWindow(vbNullString, "TrainerSpy XP + NT / 2000 / XP + Coded By BofeN")
   '     Spy3 = FindWindow(vbNullString, "OllyDbg")
     '       If Spy1 <> 0 Then
    '            MsgBox MessageToDisplay, vbCritical, "Error 24"
      '          End
      '      End If
      '      If Spy2 <> 0 Then
       '         MsgBox MessageToDisplay, vbCritical, "Error 24"
      '          End
         '   End If
       '     If Spy3 <> 0 Then
        '        MsgBox MessageToDisplay, vbCritical, "Error 24"
        '        End
        '    End If
'End Sub


Public Function ReadALong(Address As Long, ByteBuffer As Long)
Dim pid&, phandle&
If FindGame = 0 Then Exit Function
GetWindowThreadProcessId FindGame, pid
phandle = Openprocess(&H1F0FFF, False, pid)
If phandle = 0 Then Exit Function
ReadProcessMem phandle, Address, ByteBuffer, 4, 0&
ReadALong = ByteBuffer
CloseHandle phandle
End Function

Public Sub RawReadWrite(ReadAddress As Long, WriteAddress As Long)
Dim pid&, phandle&, Data&
Dim E As Integer
If FindGame = 0 Then Exit Sub
GetWindowThreadProcessId FindGame, pid
phandle = Openprocess(&H1F0FFF, False, pid)
If phandle = 0 Then Exit Sub
For E = 1 To 4
ReadProcessMem phandle, ReadAddress, Data, 4, 0&
WriteProcessMemory phandle, WriteAddress, Data, 4, 0&
ReadAddress = ReadAddress + 4
WriteAddress = WriteAddress + 4
Next E
End Sub
Public Sub ReadWrite(ReadAddress As Long, WriteAddress As Long, Bytes As Integer)
SetGame ("Delta Force 2,  V1.06.15")
Dim E As Integer
Dim P As Long
Dim XP As Long
Dim PX As Long
XP = WriteAddress
PX = ReadAddress
For E = 1 To (Bytes / 4)
P = ReadALong(PX, 0)
Call WriteALong(XP, P)
XP = XP + 4
PX = PX + 4
Next E
End Sub
Public Function ReadAByte(Address As Long, ByteBuffer As Byte)
Dim pid&, phandle&
If FindGame = 0 Then Exit Function
GetWindowThreadProcessId FindGame, pid
phandle = Openprocess(&H1F0FFF, False, pid)
If phandle = 0 Then Exit Function
ReadProcessMem phandle, Address, ByteBuffer, 1, 0&
ReadAByte = ByteBuffer
CloseHandle phandle
End Function

Function ReadPlayerName(Address As Long) As String
Dim hwnd As Long
Dim pid As Long
Dim phandle As Long
Dim bData As Byte
Dim lCnt As Long
Dim hprocess As Long
hwnd = FindWindow("NLGAMECLASS", "Delta Force 2,  V1.06.15")
If hwnd = 0 Then
  Exit Function
End If
GetWindowThreadProcessId hwnd, pid
phandle = Openprocess(&H1F0FFF, False, pid)
ReadPlayerName = ""
For lCnt = Address To Address + 16
    ReadProcessMemory phandle, lCnt, bData, 1, 0
    If bData = 0 Then
        Exit For
    End If
    ReadPlayerName = ReadPlayerName & Chr(bData)
Next lCnt
CloseHandle hprocess
End Function


Public Function ReadABytelong(Address As Long, ByteBuffer As Long)
Dim pid&, phandle&
If FindGame = 0 Then Exit Function
GetWindowThreadProcessId FindGame, pid
phandle = Openprocess(&H1F0FFF, False, pid)
If phandle = 0 Then Exit Function
ReadProcessMem phandle, Address, ByteBuffer, 1, 0&
ReadABytelong = ByteBuffer
CloseHandle phandle
End Function
Public Sub WriteAIntspc(Address As Long, Value As Long)
    Dim hwnd As Long, pid As Long, phandle As Long
        hwnd = FindWindow(vbNullString, "Delta Force 2,  V1.06.15")
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, pid
        phandle = Openprocess(&H1F0FFF, False, pid)
        WriteProcessMemory phandle, Address, Value, 2, 0&
        CloseHandle phandle
    End If
End Sub
Public Sub WriteAInt(Address As Long, Value As Long)
Dim hwnd As Long, pid As Long, phandle As Long
hwnd = FindWindow(vbNullString, "Delta Force 2,  V1.06.15")
If (hwnd <> 0) Then
GetWindowThreadProcessId hwnd, pid
phandle = Openprocess(&H1F0FFF, False, pid)
If (phandle <> 0) Then
WriteProcessMemory phandle, Address, Value, 2, 0&
End If
CloseHandle phandle
End If
End Sub

Public Sub WriteAscii(StartAddress As Long, WhatToWrite As String)
    Dim Go As Long
        For Go& = 0 To (Len(WhatToWrite) - 1)
            Call WriteALong((StartAddress + Go), Asc(Mid$(WhatToWrite, Go + 1)))
        Next Go&
    Call WriteALong(StartAddress + Len(WhatToWrite), 0)
End Sub
Public Function ReadA6(Address As Long, ByteBuffer As Long)
Dim pid&, phandle&
If FindGame = 0 Then Exit Function
GetWindowThreadProcessId FindGame, pid
phandle = Openprocess(&H1F0FFF, False, pid)
If phandle = 0 Then Exit Function
ReadProcessMem phandle, Address, ByteBuffer, 6, 0&
ReadA6 = ByteBuffer
CloseHandle phandle
End Function
