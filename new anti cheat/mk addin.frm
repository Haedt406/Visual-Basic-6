VERSION 5.00
Begin VB.Form trainer 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Have Fun!    =)     >-------------"
   ClientHeight    =   7065
   ClientLeft      =   1575
   ClientTop       =   1710
   ClientWidth     =   10740
   ForeColor       =   &H00D1CD1B&
   Icon            =   "mk addin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   124.619
   ScaleMode       =   6  'Millimeter
   ScaleWidth      =   189.442
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command7 
      Appearance      =   0  'Flat
      BackColor       =   &H00404000&
      Caption         =   "Off"
      Height          =   255
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   840
      Width           =   495
   End
   Begin VB.CommandButton Command6 
      Appearance      =   0  'Flat
      BackColor       =   &H00404000&
      Caption         =   "On"
      Height          =   255
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   960
      Width           =   495
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800080&
      Height          =   615
      Left            =   5760
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "mk addin.frx":17CE
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00CA991A&
      Caption         =   "Information"
      BeginProperty Font 
         Name            =   "MS Reference Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4200
      MaskColor       =   &H0000C000&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblname 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "(+) Your Name (+)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00D1CD1B&
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   3855
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00008080&
      X1              =   33.867
      X2              =   120.65
      Y1              =   35.983
      Y2              =   35.983
   End
End
Attribute VB_Name = "trainer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function Openprocess Lib "kernel32" Alias "OpenProcess" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WPM Lib "kernel32" Alias "WriteProcessMemory" (ByVal hprocess As Long, ByVal lpBaseAddress As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public SetProcess As String
Dim YourName As String
Dim PlayerX As Long
Dim Team As Long
Dim color As Byte
Dim Alive As Byte
Dim Dead As Long
Dim CountDeadTime As Long
Dim Face As Byte
Dim addy As Long
Dim tmc As Long
Dim Value As Byte
Dim Trueaddy As Long
Dim CountTime As Integer
Dim chewey As Integer
Dim a As Long
Dim B As Long
Dim c As Long
Dim D As Long
Dim E As Long
Dim f As Long
Dim g As Long
Dim h As Long
Dim i As Long
Dim j As Long
Dim k As Long
Dim l As Long
Dim m As Long
Dim n As Long
Dim o As Long
Dim P As Long
Dim q As Long
Dim r As Long
Dim s As Long
Dim t As Long
Dim u As Long
Dim v As Long
Dim w As Long
Dim x As Long
Dim y As Long
Dim z As Long
Dim ab As Long
Dim bb As Long
Dim cb As Long
Dim db As Long
Dim eb As Long
Dim fb As Long
Dim gb As Long
Dim hb As Long
Dim ib As Long
Dim jb As Long

Dim namezz As Long
Dim GTZ As Long
Dim gt As Long





Private Sub Command6_Click()
Call WriteAInt(&H4211B4, &H5)
Sleep (50)
Call SendAMessage(vbKeyT)
Sleep (50)
Call WriteAscii(&HAB045C, "works")
Sleep (50)
Call SendAMessage(vbKeyReturn)
Call WriteAInt(&H4211B4, &H5)
End Sub

Private Sub Command1_Click()
MsgBox "Have fun with my trainer and please use it RESPONSIBLY" & vbCrLf & "Dedicated to the niggars that was down with me from day one." & vbCrLf & "" & vbCrLf & "TeleStatchels, GPS, Anti-sysdump, and AutoNades are already on" & vbCrLf & "" & vbCrLf & "Flooder:" & vbCrLf & "Start - Shift + Insert   Stop - Shift + Delete" & vbCrLf & "" & vbCrLf & "True Fly:" & vbCrLf & "On - Shift + A  Off - Shift + S" & vbCrLf & "" & vbCrLf & "Change Team Color: Shift + I" & vbCrLf & "" & vbCrLf & "Outsider Eye:" & vbCrLf & "On - V + Z     Off - V + X" & vbCrLf & "" & vbCrLf & "Elevation: " & vbCrLf & "On - Shift + H ; Off - H ; Raise - Shift + U ; Lower - Shift + J" & vbCrLf & "" & vbCrLf & "E-mail me some day 1138, so much in life has come and passed." & vbCrLf & "Made By, The Bomb =)  >- , AKA, Ñâþâlm Ìs Gøød , AKA, NAS-" & vbCrLf & "email - pigsflyhigh3@hotmail.com"
End Sub




Private Sub prone_Click()
Call WriteAInt(&H4B5DF0, &H9F)
Call WriteAInt(&H4B5CA0, &HA2)
Call WriteAInt(&H4B5E14, &H10)
Call WriteAInt(&H4B5CC4, &H22)
End Sub







Private Sub tmrHotkeys_Timer()
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyA) Then
Command6_Click
End If
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyS) Then
Command7_Click
End If
End Sub


