Attribute VB_Name = "Trainer_Module_v6"
Option Explicit
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal Classname As String, ByVal WindowName As String) As Long
Public Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Public Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Const PROCESS_ALL_ACCESS = &H1F0FFF
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, ByRef lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Sub ReleaseCapture Lib "user32" ()
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal _
                                                                             nShowCmd As Long) As Long
Private Declare Function VirtualAllocEx Lib "kernel32" (ByVal hProcess As Long, ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Private Declare Function CreateRemoteThread Lib "kernel32" (ByVal hProcess As Long, lpThreadAttributes As Long, ByVal dwStackSize As Long, lpStartAddress As Long, lpParameter As Any, ByVal dwCreationFlags As Long, _
                                                                                                                                                                                               lpThreadId As Long) As Long
Public Declare Function GetKeyPress Lib "user32" Alias "GetAsyncKeyState" (ByVal Key As Long) As Integer
Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'EX: CurrentProcess = "Delta Force 2,  V1.06.15" 'DF2

Public CurrentProcess  As String


Public Function ReadText(address As Long) As String
Dim hwnd, process_handle, process_id As Long
Dim Data            As Byte
Dim current_byte    As Integer
Dim lCnt As Long

    Data = 0
    current_byte = 0
    For lCnt = address To address + 16


    hwnd = FindWindow(vbNullString, "Delta Force 2,  V1.06.15")
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        Do
        
            ReadProcessMemory process_handle, (lCnt), Data, 1, 0&
            ReadText = ReadText & Chr(Data)
        Loop While ((ReadMemory(lCnt, 1)) <> 0)
        CloseHandle process_handle
    End If
    Next lCnt
End Function

Public Function ReadMemory(lngAddress As Long, ByRef intSize As Integer) As Long
Dim hwnd, process_handle, process_id As Long

    hwnd = FindWindow(vbNullString, "Delta Force 2,  V1.06.15")
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        If (intSize > 4) Then intSize = 4
        If (intSize < 1) Then intSize = 1
        ReadProcessMemory process_handle, lngAddress, ReadMemory, intSize, 0&
        CloseHandle process_handle
    End If
End Function

Public Sub MouseClick()
Const MOUSEEVENTF_LEFTDOWN = &H2
Const MOUSEEVENTF_LEFTUP = &H4
        mouse_event MOUSEEVENTF_LEFTDOWN, 0&, 0&, ByVal 0&, ByVal 0&
End Sub
Public Sub WriteAscii(StartAddress As Long, WhatToWrite As String)
    Dim Go As Long
        For Go& = 0 To (Len(WhatToWrite) - 1)
            Call WriteALong((StartAddress + Go), Asc(Mid$(WhatToWrite, Go + 1)))
        Next Go&
    Call WriteALong(StartAddress + Len(WhatToWrite), 0)
End Sub

