VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00808080&
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Fag Blocker 3000 Beta"
   ClientHeight    =   2160
   ClientLeft      =   435
   ClientTop       =   315
   ClientWidth     =   7335
   Icon            =   "ANTICHEAT.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MousePointer    =   2  'Cross
   Picture         =   "ANTICHEAT.frx":1E26
   ScaleHeight     =   2160
   ScaleWidth      =   7335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer hotkeys 
      Interval        =   50
      Left            =   1560
      Top             =   840
   End
   Begin VB.Timer anti 
      Interval        =   1000
      Left            =   960
      Top             =   840
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   255
      Left            =   2280
      TabIndex        =   3
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H00808080&
      Caption         =   "How to Run "
      Height          =   375
      Left            =   5280
      MaskColor       =   &H00C0C0FF&
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   240
      Width           =   1695
   End
   Begin VB.Timer Timer2 
      Interval        =   5000
      Left            =   120
      Top             =   840
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00808080&
      Caption         =   "Information"
      Height          =   375
      Left            =   3480
      MaskColor       =   &H00C0C0FF&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   240
      Width           =   1695
   End
   Begin VB.Timer players 
      Interval        =   500
      Left            =   120
      Top             =   1440
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   255
      Left            =   4440
      TabIndex        =   4
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label Labelhost 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Your Name"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   2
      Top             =   240
      Width           =   2415
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WPM Lib "kernel32" Alias "WriteProcessMemory" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal Classname As String, ByVal WindowName As String) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public SetProcess As String
Public Sub SendAMessage(Message As Long)
    Dim pid&, phandle&
    Const WM_KEYDOWN = &H100
    Const WM_KEYUP = &H101
        If FindWindow(vbNullString, SetProcess) = 0 Then Exit Sub
            GetWindowThreadProcessId FindWindow(vbNullString, SetProcess), pid
            phandle = OpenProcess(&H1F0FFF, False, pid)
        If phandle = 0 Then Exit Sub
            PostMessage FindWindow(vbNullString, SetProcess), WM_KEYDOWN, Message, 0&
            PostMessage FindWindow(vbNullString, SetProcess), WM_KEYUP, Message, 0&
    CloseHandle phandle
End Sub




Private Sub anti_Timer()
Label1.Caption = ReadText(&H454708)

End Sub

Private Sub Command1_Click()
MsgBox "Project: FagControl 3000 Beta for Delta Force 2 Version 1.06.15" & vbCrLf & "" & vbCrLf & "This trainer has some pretty cool functions that are very helpful for the host." & vbCrLf & "First, Anyone that is running a sysdump, there game will be automatically crashed. Systemdump works by misplacing a face value on a character that the game cannot read and it displays it with the error sysdump.txt" & vbCrLf & "The cool part about the anti-sysdump is that anyone running a sysdumper is a cheater anyway therefor weeding out cheaters more effectively" & vbCrLf & "" & vbCrLf & "Second, Anyone who is cheating and you cannot ban is obviously running the anti-ban hack, with my anti-anti-ban it crashes there game and automatically imputs the ban command for the host(which is pointless really in this version)" & vbCrLf & "If i get hosts who actually think this program is useful i would be more than happy to keep working on this project I have tons more ideas to improve it." & vbCrLf & " Made By, The Bomb =) >-"

End Sub



Private Sub Command2_Click()
MsgBox "Pretty simple really, the 'kick' button next to the names is what you press to get rid of someone with anti-ban." & vbCrLf & " The Anti-Sysdump is always on." & vbCrLf & "" & vbCrLf & "Made by, The Bomb =)  >- " & vbCrLf & " email - pigsflyhigh3@hotmail.com"
End Sub





Private Sub Command3_Click()
Call WriteAInt(&H4211B4, &H3)
Sleep (2000)
Call SendAMessage(vbKeyT)
Sleep (50)
Call WriteAscii(&HAB045C, "works")
Sleep (50)
Call SendAMessage(vbKeyReturn)
Sleep (50)
Call WriteAInt(&H4211B4, &H1)
End Sub

Private Sub Form_Load()
SetGame ("Delta Force 2,  V1.06.15")
Call SpyCheck("FUCK OFF!!!!!!!")
Call RFATcheck("RFAT333 Not Loaded")


End Sub







Private Sub hotkeys_Timer()
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyZ) Then
Command3_Click
End If

End Sub

Private Sub players_Timer()
Dim cock As Long
    cock = FindWindow(vbNullString, "Delta Force 2,  V1.06.15")
        If cock = 0 Then Form1.Caption = "Please Load While Hosting a DF2 Server"
    If cock = 0 Then Exit Sub
If Form1.Caption = "Please Load DF2" Then Form1.Caption = "Welcome to FagControl 3000 Beta"
Labelhost.Caption = ReadText(&HC72134)


End Sub






Private Sub Timer2_Timer()

Dim hwnd As Long
Dim pid As Long
Dim phandle As Long
Dim antiadd As Long
Dim readfrom As Long

hwnd = FindWindow("NLGAMECLASS", "Delta Force 2,  V1.06.15")
If hwnd = False Then
  Exit Sub
End If
GetWindowThreadProcessId hwnd, pid
phandle = OpenProcess(&H1F0FFF, False, pid)
readfrom = &HC722A0
antiadd = &HC721FA
value = 0
For bbb = 1 To 32

    If readfrom >= &HC74520 + &H114 Then readfrom = &HC722A0
    If antiadd >= &HC7447A + &H114 Then antiadd = &HC721FA
    If ReadAByte(readfrom, 0) > 16 Then WriteProcessMemory phandle, antiadd, value, 1, 0
    If ReadAByte(readfrom, 0) < 0 Then WriteProcessMemory phandle, antiadd, value, 1, 0
    
    readfrom = readfrom + &H114
    antiadd = antiadd + &H114
Next bbb
CloseHandle hProcess

End Sub

