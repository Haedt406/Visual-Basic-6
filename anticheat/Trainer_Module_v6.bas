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

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'FEW ASM OPCODES HEX VALUES, USEFUL FOR CODE INJECTION:
'*remove if not wanted*
Public Const PUSH_BYTE  As Byte = &H6A
Public Const PUSH_DWORD As Byte = &H68
Public Const PUSHAD     As Byte = &H60
Public Const PUSH_EAX   As Byte = &H50
Public Const PUSH_ECX   As Byte = &H51
Public Const PUSH_EDX   As Byte = &H52
Public Const PUSH_EBX   As Byte = &H53
Public Const PUSH_ESP   As Byte = &H54
Public Const PUSH_EBP   As Byte = &H55
Public Const PUSH_ESI   As Byte = &H56
Public Const PUSH_EDI   As Byte = &H57
Public Const POPAD      As Byte = &H61
Public Const POP_EAX    As Byte = &H58
Public Const POP_ECX    As Byte = &H59
Public Const POP_EDX    As Byte = &H5A
Public Const POP_EBX    As Byte = &H5B
Public Const POP_ESP    As Byte = &H5C
Public Const POP_EBP    As Byte = &H5D
Public Const POP_ESI    As Byte = &H5E
Public Const POP_EDI    As Byte = &H5F
Public Const CALL_FUNC  As Byte = &HE8
Public Const RETN       As Byte = &HC3
Public Const ADD_ESP    As Integer = &HC483
Public Const JMP_LONG   As Byte = &HE9
Public Const JMP_SHORT  As Byte = &HEB

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Setup before using module:
'EX: CurrentProcess = "Delta Force 1.00.03.03P" 'DF1
'EX: CurrentProcess = "Delta Force 2,  V1.06.15" 'DF2
'EX: CurrentProcess = "Delta Force,  V1.5.0.5" 'BHD
'EX: CurrentProcess = "Jedi Knight®: Jedi Academy (MP)" 'JKA
'EX: CurrentProcess = "Delta Force Land Warrior, Demo V0.99.49"' LW_Demo
Public CurrentProcess  As String

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Public Sub WriteMemory(lngAddress As Long, lngValue As Long, intSize As Integer, Optional ByRef NumberOfBytesWritten As Long = 0)
Dim hwnd, process_handle, process_id As Long
    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        If (intSize > 4) Then intSize = 4
        If (intSize < 1) Then intSize = 1
        WriteProcessMemory process_handle, lngAddress, lngValue, intSize, NumberOfBytesWritten
        CloseHandle process_handle
    End If
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Public Sub WriteFloat(lngAddress As Long, sngValue As Single, Optional ByRef NumberOfBytesWritten As Long = 0)
Dim hwnd, process_handle, process_id As Long
    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        WriteProcessMemory process_handle, lngAddress, sngValue, 4, NumberOfBytesWritten
        CloseHandle process_handle
    End If
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Writes a byte string to the desired offset.
Public Sub WriteByteString(lngAddress As Long, strValue As String, Optional ByRef NumberOfBytesWritten As Long = 0)
Dim hwnd, process_handle, process_id As Long
Dim bytValue() As Byte

    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        ByteStringToByteArray strValue, bytValue
        WriteProcessMemory process_handle, lngAddress, bytValue(0), UBound(bytValue), NumberOfBytesWritten
        CloseHandle process_handle
    End If
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Reads the value of the desired offset.
Public Function ReadMemory(lngAddress As Long, ByRef intSize As Integer) As Long
Dim hwnd, process_handle, process_id As Long

    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        If (intSize > 4) Then intSize = 4
        If (intSize < 1) Then intSize = 1
        ReadProcessMemory process_handle, lngAddress, ReadMemory, intSize, 0&
        CloseHandle process_handle
    End If
End Function

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Reads the value of the desired offset.
Public Function ReadFloat(lngAddress As Long) As Single
Dim hwnd, process_handle, process_id As Long

    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        ReadProcessMemory process_handle, lngAddress, ReadFloat, 4, 0&
        CloseHandle process_handle
    End If
End Function

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Copys the specified numbers of bytes from one offset to another.
Public Sub ReadWriteMemory(lngSource As Long, lngDestination As Long, intSize As Integer)
Dim hwnd, process_handle, process_id As Long
Dim bytBuffer() As Byte

    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        ReDim bytBuffer((intSize - 1)) As Byte
        ReadProcessMemory process_handle, lngSource, bytBuffer(0), intSize, 0&
        WriteProcessMemory process_handle, lngDestination, bytBuffer(0), intSize, 0&
        CloseHandle process_handle
    End If
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Puts a string into a byte array.
Public Sub ByteStringToByteArray(strString As String, ByRef byteArray() As Byte)
Dim current_byte    As Byte
Dim c, d, intSize   As Integer
Dim strTemp         As String

        ReDim byteArray(0) As Byte
        
        For c = 1 To Len(strString)
            If (Mid(strString, c, 1) <> " ") Then
                strTemp = strTemp & Mid(strString, c, 1)
            End If
        Next c
        
        intSize = Round(Len(strTemp) / 2)
        ReDim Preserve byteArray(intSize) As Byte
        
        d = 0
        For c = 1 To Len(strTemp) Step 2
            current_byte = Val("&H" + Mid(strTemp, c, 2))
            byteArray(d) = current_byte
            d = d + 1
        Next c
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Reverses the inputted hex number/variable into a string so its ready to be used in WriteByteString.
Public Function ReverseHex(hexValue As String) As String
Dim strHexValue As String
Dim strTemp     As String
Dim c, intLen   As Integer
Dim intSize     As Integer
    
    strHexValue = hexValue
    intLen = Len(strHexValue)
    
    If (Len(hexValue) = 1) Then
        intSize = 1
    Else
        intSize = Round(intLen / 2)
    End If
    
    If ((intLen Mod 2) <> 0) Then
        strHexValue = "0" & Left(strHexValue, 1) & Mid(strHexValue, 2)
        intLen = Len(strHexValue)
        
        For c = intLen To 1 Step -2
            strTemp = strTemp & Mid(strHexValue, c - 1, 2)
        Next c
    Else
        For c = intLen To 1 Step -2
            strTemp = strTemp & Mid(strHexValue, c - 1, 2)
        Next c
    End If
    ReverseHex = strTemp
End Function

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Reads text from the specified offset.
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

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Writes text strings to an offset.
Public Sub WriteText(lngAddress As Long, strText As String)
Dim hwnd, process_handle, process_id As Long
Dim fixedStr As String

    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        fixedStr = strText & Chr(0)
        WriteProcessMemory process_handle, lngAddress, ByVal fixedStr, Len(fixedStr), 0&
        CloseHandle process_handle
    End If
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Allocates Memory, useful for code caves.
Public Function AllocateMemory(lngSize As Long) As Long
Dim hwnd, process_handle, process_id As Long

Const MEM_COMMIT = &H1000
Const PAGE_READWRITE = &H4&

    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        AllocateMemory = VirtualAllocEx(process_handle, 0, lngSize, MEM_COMMIT, PAGE_READWRITE)
        CloseHandle process_handle
    End If
End Function

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Executes the code in the specified offset.
Public Function ExecuteCode(lngAddress As Long) As Long
Dim hwnd, process_handle, process_id As Long

    hwnd = FindWindow(vbNullString, CurrentProcess)
    If (hwnd <> 0) Then
        GetWindowThreadProcessId hwnd, process_id
        process_handle = OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
        
        ExecuteCode = CreateRemoteThread(process_handle, 0, 0, ByVal lngAddress, 0, 0, 0)

        CloseHandle process_handle
    End If
End Function

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Simulates a mouse click at the cursor position.
Public Sub MouseClick()
Const MOUSEEVENTF_LEFTDOWN = &H2
Const MOUSEEVENTF_LEFTUP = &H4
        mouse_event MOUSEEVENTF_LEFTDOWN, 0&, 0&, ByVal 0&, ByVal 0&
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Executes a hyperlink.
'EX: Hyperlink Me,"http://www.yourwebsite.com"
Public Sub Hyperlink(frm As Form, ToOpen As String)
    ShellExecute frm.hwnd, "Open", ToOpen, &O0, &O0, vbNormalFocus
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Sends a key character to the selected process.
Public Sub SendKeyChar(Key As Integer)
Const WM_KEYDOWN = &H100
Const WM_KEYUP = &H101
    PostMessage FindWindow(vbNullString, CurrentProcess), WM_KEYDOWN, Key, 0&
    PostMessage FindWindow(vbNullString, CurrentProcess), WM_KEYUP, Key, 0&
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Allows you to move the form with the mouse, when you click in any part of it.
'EX: Call MoveForm(Me) <-Just copy that code to the Form_MouseMove() event.
Public Sub MoveForm(Form As Form)
Const WM_NCLBUTTONDOWN = &HA1
Const HTCAPTION = 2
Dim lngReturnValue As Long
        Call ReleaseCapture
        lngReturnValue = SendMessage(Form.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
End Sub

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Returns a string that contains repeating strings of a specified length.
Public Function AddString(Length As Integer, strCharacter As String)
Dim strTemp As String
Dim c       As Integer
    For c = 1 To Length
        strTemp = strTemp & strCharacter
    Next c
    AddString = strTemp
End Function

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Converts a text string into a hex string.
Public Function StringToHexString(TextString As String) As String
Dim c         As Integer
Dim HexString As String
    For c = 1 To Len(TextString)
        HexString = HexString & Hex(Asc(Mid(TextString, c, 1)))
    Next c
    
    StringToHexString = Trim(HexString)
End Function

'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'Converts a hex string into a text string.
Public Function HexStringToString(HexString As String) As String
Dim c         As Integer
Dim TextString As String
    For c = 1 To Len(HexString) Step 2
        TextString = TextString & Chr(Val("&H" & Mid(HexString, c, 2)))
    Next c
    HexStringToString = Trim(TextString)
End Function
Public Sub WriteAscii(StartAddress As Long, WhatToWrite As String)
    Dim Go As Long
        For Go& = 0 To (Len(WhatToWrite) - 1)
            Call WriteALong((StartAddress + Go), Asc(Mid$(WhatToWrite, Go + 1)))
        Next Go&
    Call WriteALong(StartAddress + Len(WhatToWrite), 0)
End Sub

