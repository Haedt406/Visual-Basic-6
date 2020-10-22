VERSION 5.00
Begin VB.Form trainer 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Have Fun!    =)     >-------------"
   ClientHeight    =   4620
   ClientLeft      =   1575
   ClientTop       =   1710
   ClientWidth     =   7650
   ForeColor       =   &H00D1CD1B&
   Icon            =   "mk addin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   81.492
   ScaleMode       =   6  'Millimeter
   ScaleWidth      =   134.938
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command8 
      Caption         =   "Command8"
      Height          =   495
      Left            =   4680
      TabIndex        =   12
      Top             =   2400
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton elevationoff 
      Caption         =   "Command11"
      Height          =   255
      Left            =   1560
      TabIndex        =   14
      Top             =   2400
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton Command9 
      Caption         =   "Command9"
      Height          =   495
      Left            =   5160
      TabIndex        =   13
      Top             =   3360
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Timer Timer3 
      Interval        =   10000
      Left            =   3240
      Top             =   3240
   End
   Begin VB.CommandButton SAToff 
      BackColor       =   &H0003521F&
      Caption         =   "Off"
      Height          =   255
      Left            =   5280
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   960
      Width           =   375
   End
   Begin VB.Timer SATon 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   2640
      Top             =   2640
   End
   Begin VB.CommandButton Command5 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C0C0&
      Caption         =   "No Fog"
      Height          =   375
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   1560
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Appearance      =   0  'Flat
      BackColor       =   &H0003521F&
      Caption         =   "Show All Tags"
      Height          =   375
      Left            =   3960
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton specialcrosshair 
      Appearance      =   0  'Flat
      BackColor       =   &H00800000&
      Caption         =   "Special Crosshair"
      Height          =   375
      Left            =   3960
      Style           =   1  'Graphical
      TabIndex        =   8
      ToolTipText     =   "Credits go out to 1138 for this very special easter egg"
      Top             =   1560
      Width           =   1335
   End
   Begin VB.CommandButton prone 
      Appearance      =   0  'Flat
      BackColor       =   &H000000C0&
      Caption         =   "Super Prone"
      Height          =   375
      Left            =   6000
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H00216D92&
      Caption         =   "Change Team Color Tag"
      Height          =   495
      Left            =   720
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   3240
      Visible         =   0   'False
      Width           =   1215
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
      TabIndex        =   2
      Text            =   "mk addin.frx":26592
      Top             =   120
      Width           =   1695
   End
   Begin VB.Timer tmrHotkeys 
      Interval        =   80
      Left            =   2280
      Top             =   3480
   End
   Begin VB.Timer tmrRespawn 
      Interval        =   1000
      Left            =   2760
      Top             =   3240
   End
   Begin VB.Timer tmrReloadData 
      Interval        =   1000
      Left            =   3240
      Top             =   2640
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00CA991A&
      Caption         =   "Information"
      BeginProperty Font 
         Name            =   "Arial"
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
   Begin VB.CommandButton changeName 
      Appearance      =   0  'Flat
      BackColor       =   &H0000FF00&
      Caption         =   "Change Name"
      Height          =   315
      Left            =   1200
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1560
      Width           =   1335
   End
   Begin VB.TextBox Text4 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FFFF&
      Height          =   285
      Left            =   360
      MaxLength       =   15
      TabIndex        =   4
      Text            =   "Input Name Here"
      Top             =   1200
      Width           =   3255
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "In Game Name Editor"
      ForeColor       =   &H008080FF&
      Height          =   1215
      Left            =   120
      TabIndex        =   5
      Top             =   840
      Width           =   3735
   End
   Begin VB.Timer tmrAntiDump 
      Interval        =   5000
      Left            =   3600
      Top             =   2640
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00008080&
      X1              =   2.117
      X2              =   88.9
      Y1              =   10.583
      Y2              =   10.583
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
      TabIndex        =   1
      Top             =   120
      Width           =   3855
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






Private Sub colortimer_Timer()
Call ReadALong(&H67CC00, namezz)
Call ReadALong(&HC72248, a)
Call ReadALong(&HC7235C, B)
Call ReadALong(&HC72470, c)
Call ReadALong(&HC72584, D)
Call ReadALong(&HC72698, E)
Call ReadALong(&HC727AC, f)
Call ReadALong(&HC728C0, g)
Call ReadALong(&HC729D4, h)
Call ReadALong(&HC72AE8, i)
Call ReadALong(&HC72BFC, j)
Call ReadALong(&HC72D10, k)
Call ReadALong(&HC72E24, l)
Call ReadALong(&HC72F38, m)
Call ReadALong(&HC7304C, n)
Call ReadALong(&HC73160, o)
Call ReadALong(&HC73274, P)
Call ReadALong(&HC73388, q)
Call ReadALong(&HC7349C, r)
Call ReadALong(&HC735B0, s)
Call ReadALong(&HC736C4, t)
Call ReadALong(&HC737D8, u)
Call ReadALong(&HC738EC, v)
Call ReadALong(&HC73A00, w)
Call ReadALong(&HC73B14, x)
Call ReadALong(&HC73C28, y)
Call ReadALong(&HC73D3C, z)
Call ReadALong(&HC73E50, ab)
Call ReadALong(&HC73F64, bb)
Call ReadALong(&HC74078, cb)
Call ReadALong(&HC7418C, db)
Call ReadALong(&HC742A0, eb)
Call ReadALong(&HC743B4, fb)
Call ReadALong(&HC744C8, gb)
Call ReadALong(&HC745DC, hb)
Call ReadALong(&HC746F0, ib)
Call ReadALong(&HC74804, jb)


If a = namezz Then
Call ReadABytelong(&HC7225C, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If B = namezz Then
Call ReadABytelong(&HC72370, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0

End If
If c = namezz Then
Call ReadABytelong(&HC72484, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If D = namezz Then
Call ReadABytelong(&HC72598, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0

End If
If E = namezz Then
Call ReadABytelong(&HC726AC, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If f = namezz Then
Call ReadABytelong(&HC727C0, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If g = namezz Then
Call ReadABytelong(&HC728D4, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If h = namezz Then
Call ReadABytelong(&HC729E8, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If i = namezz Then
Call ReadABytelong(&HC72AFC, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If j = namezz Then
Call ReadABytelong(&HC72C10, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If k = namezz Then
Call ReadABytelong(&HC72D24, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If l = namezz Then
Call ReadABytelong(&HC72E38, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If m = namezz Then
Call ReadABytelong(&HC72F4C, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If n = namezz Then
Call ReadABytelong(&HC73060, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If o = namezz Then
Call ReadABytelong(&HC73174, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If P = namezz Then
Call ReadABytelong(&HC73288, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If q = namezz Then
Call ReadABytelong(&HC7339C, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If r = namezz Then
Call ReadABytelong(&HC734B0, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If s = namezz Then
Call ReadABytelong(&HC735C4, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If t = namezz Then
Call ReadABytelong(&HC736D8, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If u = namezz Then
Call ReadABytelong(&HC737EC, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If v = namezz Then
Call ReadABytelong(&HC73900, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If w = namezz Then
Call ReadABytelong(&HC73A14, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If x = namezz Then
Call ReadABytelong(&HC73B28, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If y = namezz Then
Call ReadABytelong(&HC73C3C, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If z = namezz Then
Call ReadABytelong(&HC73D50, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If ab = namezz Then
Call ReadABytelong(&HC73E64, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If bb = namezz Then
Call ReadABytelong(&HC73F78, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If cb = namezz Then
Call ReadABytelong(&HC7408C, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If db = namezz Then
Call ReadABytelong(&HC741A0, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If eb = namezz Then
Call ReadABytelong(&HC742B4, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If fb = namezz Then
Call ReadABytelong(&HC743C8, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If gb = namezz Then
Call ReadABytelong(&HC744DC, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If hb = namezz Then
Call ReadABytelong(&HC745F0, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If ib = namezz Then
Call ReadABytelong(&HC74704, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If
If jb = namezz Then
Call ReadABytelong(&HC74818, GTZ)
    If GTZ = 1 Then gt = 2
    If GTZ = 2 Then gt = 1
    If GTZ = &H1A Then gt = 0
End If

End Sub







Private Sub Command10_Click()
Call WriteAInt(&H446D34, &H909090)
End Sub





Private Sub Command13_Click()
Call WriteAInt(&H446D34, &H8B5E64)
End Sub

Private Sub Command2_Click()
Call ReadALong(&H67CC00, namezz)
Call ReadALong(&HC72248, a)
Call ReadALong(&HC7235C, B)
Call ReadALong(&HC72470, c)
Call ReadALong(&HC72584, D)
Call ReadALong(&HC72698, E)
Call ReadALong(&HC727AC, f)
Call ReadALong(&HC728C0, g)
Call ReadALong(&HC729D4, h)
Call ReadALong(&HC72AE8, i)
Call ReadALong(&HC72BFC, j)
Call ReadALong(&HC72D10, k)
Call ReadALong(&HC72E24, l)
Call ReadALong(&HC72F38, m)
Call ReadALong(&HC7304C, n)
Call ReadALong(&HC73160, o)
Call ReadALong(&HC73274, P)
Call ReadALong(&HC73388, q)
Call ReadALong(&HC7349C, r)
Call ReadALong(&HC735B0, s)
Call ReadALong(&HC736C4, t)
Call ReadALong(&HC737D8, u)
Call ReadALong(&HC738EC, v)
Call ReadALong(&HC73A00, w)
Call ReadALong(&HC73B14, x)
Call ReadALong(&HC73C28, y)
Call ReadALong(&HC73D3C, z)
Call ReadALong(&HC73E50, ab)
Call ReadALong(&HC73F64, bb)
Call ReadALong(&HC74078, cb)
Call ReadALong(&HC7418C, db)
Call ReadALong(&HC742A0, eb)
Call ReadALong(&HC743B4, fb)
Call ReadALong(&HC744C8, gb)
Call ReadALong(&HC745DC, hb)
Call ReadALong(&HC746F0, ib)
Call ReadALong(&HC74804, jb)
Call WriteAscii(&HA695C4, Text4)
Call WriteAscii(&H67CC00, Text4)
If a = namezz Then
Call WriteAscii(&HC72248, Text4)
End If
If B = namezz Then
Call WriteAscii(&HC7235C, Text4)
End If
If c = namezz Then
Call WriteAscii(&HC72470, Text4)
End If
If D = namezz Then
Call WriteAscii(&HC72584, Text4)
End If
If E = namezz Then
Call WriteAscii(&HC72696, Text4)
End If
If f = namezz Then
Call WriteAscii(&HC727AC, Text4)
End If
If g = namezz Then
Call WriteAscii(&HC728C0, Text4)
End If
If h = namezz Then
Call WriteAscii(&HC729D4, Text4)
End If
If i = namezz Then
Call WriteAscii(&HC72AE8, Text4)
End If
If j = namezz Then
Call WriteAscii(&HC72CFC, Text4)
End If
If k = namezz Then
Call WriteAscii(&HC72D10, Text4)
End If
If l = namezz Then
Call WriteAscii(&HC72E24, Text4)
End If
If m = namezz Then
Call WriteAscii(&HC72F48, Text4)
End If
If n = namezz Then
Call WriteAscii(&HC7304C, Text4)
End If
If o = namezz Then
Call WriteAscii(&HC73160, Text4)
End If
If P = namezz Then
Call WriteAscii(&HC73274, Text4)
End If
If q = namezz Then
Call WriteAscii(&HC73388, Text4)
End If
If r = namezz Then
Call WriteAscii(&HC7349C, Text4)
End If
If s = namezz Then
Call WriteAscii(&HC735B0, Text4)
End If
If t = namezz Then
Call WriteAscii(&HC736C4, Text4)
End If
If u = namezz Then
Call WriteAscii(&HC737D8, Text4)
End If
If v = namezz Then
Call WriteAscii(&HC739EC, Text4)
End If
If w = namezz Then
Call WriteAscii(&HC73A00, Text4)
End If
If x = namezz Then
Call WriteAscii(&HC73B14, Text4)
End If
If y = namezz Then
Call WriteAscii(&HC73C28, Text4)
End If
If z = namezz Then
Call WriteAscii(&HC73D3C, Text4)
End If
If ab = namezz Then
Call WriteAscii(&HC73E50, Text4)
End If
If bb = namezz Then
Call WriteAscii(&HC73F64, Text4)
End If
If cb = namezz Then
Call WriteAscii(&HC74078, Text4)
End If
If db = namezz Then
Call WriteAscii(&HC7418C, Text4)
End If
If eb = namezz Then
Call WriteAscii(&HC742A0, Text4)
End If
If fb = namezz Then
Call WriteAscii(&HC743B4, Text4)
End If
If gb = namezz Then
Call WriteAscii(&HC744C8, Text4)
End If
If hb = namezz Then
Call WriteAscii(&HC745D4, Text4)
End If
If ib = namezz Then
Call WriteAscii(&HC747F0, Text4)
End If
If jb = namezz Then
Call WriteAscii(&HC74804, Text4)
End If

End Sub


'Private Sub changeName_Click()

'End Sub

Private Sub Command5_Click()
Call WriteAInt(&H535ADC, &H0)
End Sub



Private Sub Command6_Click()
Call WriteAIntspc(&H447054, &H11)
End Sub

Private Sub Command7_Click()
Call WriteAIntspc(&H447054, &H0)
End Sub




'Private Sub Command8_Click()
'Dim shitbrains As Byte
'Call ReadAByte(&H44CA7C, shitbrains)
'Call WriteAInt(&H44CA7C, shitbrains + &H5)
'End Sub

'Private Sub Command9_Click()
'Dim shitforbrains As Byte
'Call ReadAByte(&H44CA7C, shitforbrains)
'Call WriteAInt(&H44CA7C, shitforbrains - &H5)
'End Sub





'Private Sub elevationoff_Click()
'Call WriteAInt(&H44CA7C, &H0)
'End Sub

'Private Sub elevationon_Click()
'Call WriteAInt(&H44CA7C, &H48)
'End Sub







Private Sub SAToff_Click()
SATon.Enabled = False
End Sub

Private Sub SATon_Timer()
Call WriteAInt(&HC7225C, &H1)
Call WriteAInt(&HC72370, &H1)
Call WriteAInt(&HC72484, &H1)
Call WriteAInt(&HC72598, &H1)
Call WriteAInt(&HC726AC, &H1)
Call WriteAInt(&HC727C0, &H1)
Call WriteAInt(&HC728D4, &H1)
Call WriteAInt(&HC729E8, &H1)
Call WriteAInt(&HC72AFC, &H1)
Call WriteAInt(&HC72C10, &H1)
Call WriteAInt(&HC72D24, &H1)
Call WriteAInt(&HC72E38, &H1)
Call WriteAInt(&HC72F4C, &H1)
Call WriteAInt(&HC73060, &H1)
Call WriteAInt(&HC73174, &H1)
Call WriteAInt(&HC73288, &H1)
Call WriteAInt(&HC7339C, &H1)
Call WriteAInt(&HC734B0, &H1)
Call WriteAInt(&HC735C4, &H1)
Call WriteAInt(&HC736D8, &H1)
Call WriteAInt(&HC737EC, &H1)
Call WriteAInt(&HC73A14, &H1)
Call WriteAInt(&HC73B28, &H1)
Call WriteAInt(&HC73C3C, &H1)
Call WriteAInt(&HC73D50, &H1)
Call WriteAInt(&HC73E64, &H1)
Call WriteAInt(&HC73F78, &H1)
Call WriteAInt(&HC7408C, &H1)
Call WriteAInt(&HC741A0, &H1)
Call WriteAInt(&HC742B4, &H1)
Call WriteAInt(&HC743C8, &H1)
Call WriteAInt(&HC744DC, &H1)
Call WriteAInt(&HC745F0, &H1)
Call WriteAInt(&HC74704, &H1)
Call WriteAInt(&HC74818, &H1)
Call WriteAInt(&HC7492C, &H1)
Call WriteAInt(&HC74A40, &H1)
Call WriteAInt(&HC74B54, &H1)
Call WriteAInt(&HC74C68, &H1)
Call WriteAInt(&HC74D7C, &H1)
Call WriteAInt(&HC74E90, &H1)
Call WriteAInt(&HC74FA4, &H1)


End Sub

Private Sub spamtimer_Timer()

End Sub

Private Sub specialcrosshair_Click()
Call WriteAIntspc(&H67CD55, &H3B)
End Sub

Private Sub Command4_Click()
Call WriteAInt(&HC7225C, &H1)
Call WriteAInt(&HC72370, &H1)
Call WriteAInt(&HC72484, &H1)
Call WriteAInt(&HC72598, &H1)
Call WriteAInt(&HC726AC, &H1)
Call WriteAInt(&HC727C0, &H1)
Call WriteAInt(&HC728D4, &H1)
Call WriteAInt(&HC729E8, &H1)
Call WriteAInt(&HC72AFC, &H1)
Call WriteAInt(&HC72C10, &H1)
Call WriteAInt(&HC72D24, &H1)
Call WriteAInt(&HC72E38, &H1)
Call WriteAInt(&HC72F4C, &H1)
Call WriteAInt(&HC73060, &H1)
Call WriteAInt(&HC73174, &H1)
Call WriteAInt(&HC73288, &H1)
Call WriteAInt(&HC7339C, &H1)
Call WriteAInt(&HC734B0, &H1)
Call WriteAInt(&HC735C4, &H1)
Call WriteAInt(&HC736D8, &H1)
Call WriteAInt(&HC737EC, &H1)
Call WriteAInt(&HC73A14, &H1)
Call WriteAInt(&HC73B28, &H1)
Call WriteAInt(&HC73C3C, &H1)
Call WriteAInt(&HC73D50, &H1)
Call WriteAInt(&HC73E64, &H1)
Call WriteAInt(&HC73F78, &H1)
Call WriteAInt(&HC7408C, &H1)
Call WriteAInt(&HC741A0, &H1)
Call WriteAInt(&HC742B4, &H1)
Call WriteAInt(&HC743C8, &H1)
Call WriteAInt(&HC744DC, &H1)
Call WriteAInt(&HC745F0, &H1)
Call WriteAInt(&HC74704, &H1)
Call WriteAInt(&HC74818, &H1)
Call WriteAInt(&HC7492C, &H1)
Call WriteAInt(&HC74A40, &H1)
Call WriteAInt(&HC74B54, &H1)
Call WriteAInt(&HC74C68, &H1)
Call WriteAInt(&HC74D7C, &H1)
Call WriteAInt(&HC74E90, &H1)
Call WriteAInt(&HC74FA4, &H1)
SATon.Enabled = True



End Sub

Private Sub Form_Load()
SetGame ("Delta Force 2,  V1.06.15")
addy = &HC72134
Alive = 1
Value = &H9
Randomize
'Call SpyCheck("FUCK OFF!!!")
End Sub
Public Sub SendAMessage(Message As Long)
    Dim pid&, phandle&
    Const WM_KEYDOWN = &H100
    Const WM_KEYUP = &H101
        If FindWindow(vbNullString, SetProcess) = 0 Then Exit Sub
            GetWindowThreadProcessId FindWindow(vbNullString, SetProcess), pid
            phandle = Openprocess(&H1F0FFF, False, pid)
        If phandle = 0 Then Exit Sub
            PostMessage FindWindow(vbNullString, SetProcess), WM_KEYDOWN, Message, 0&
            PostMessage FindWindow(vbNullString, SetProcess), WM_KEYUP, Message, 0&
    CloseHandle phandle
End Sub








Private Sub Command1_Click()
MsgBox "Have fun with my trainer and please use it RESPONSIBLY" & vbCrLf & "Dedicated to the niggars that was down with me from day one." & vbCrLf & "" & vbCrLf & "GPS and Anti-sysdump are always on." & vbCrLf & "" & vbCrLf & "No Fog: Shift + N" & vbCrLf & "" & vbCrLf & "Change Team Color: Shift + I" & vbCrLf & "" & vbCrLf & "Elevation: " & vbCrLf & "On - Shift + H | Off - H | Raise - Shift + U | Lower - Shift + J" & vbCrLf & "" & vbCrLf & "Special Crosshair: Shift + C" & vbCrLf & "" & vbCrLf & "Super Prone: Shift + P" & vbCrLf & "" & vbCrLf & "Show all tags: On - Shift + 9 | Off - Shift + 0" & vbCrLf & "" & vbCrLf & "E-mail me some day 1138, so much in life has come and passed." & vbCrLf & "Made By, The Bomb =)  >- , AKA, Ñâþâlm Ìs Gøød , AKA, NAS-" & vbCrLf & "email - pigsflyhigh3@hotmail.com"
End Sub



Private Sub prone_Click()
Call WriteAInt(&H4B5DF0, &H9F)
Call WriteAInt(&H4B5CA0, &HA2)
Call WriteAInt(&H4B5E14, &H10)
Call WriteAInt(&H4B5CC4, &H22)
End Sub



Private Sub Timer3_Timer()
Call WriteAIntspc(&H79A5F4, &H38)
Call WriteAIntspc(&H79A468, &H28)
Call WriteAIntspc(&H79A568, &H1)
If gt = 1 Then lblname.ForeColor = &HFF
If gt = 2 Then lblname.ForeColor = &HC00000
If gt = 0 Then lblname.ForeColor = &H93CFEA

Call WriteAIntspc(&H42697C, &H9090)
End Sub

Private Sub tmrAutoPlay_Timer()

End Sub

Private Sub tmrReloadData_Timer()
Dim refreshaddy As Long
Dim faceaddy As Long
SetGame ("Delta Force 2,  V1.06.15")
Face = ReadAByte(&H67CC10, 0)
YourName = ReadPlayerName(&H67CC00)
lblname.Caption = YourName


refreshaddy = &HC72134
faceaddy = &HC7218C
For r = 1 To 33
    If refreshaddy >= &HC743B4 + &H114 Then refreshaddy = C72134
    If faceaddy >= &HC7440C + &H114 Then faceaddy = &HC7218C
    If YourName = ReadPlayerName(refreshaddy) And ReadAByte(faceaddy, 0) = Face Then PlayerX = refreshaddy - &H30
    refreshaddy = refreshaddy + &H114
    faceaddy = faceaddy + &H114
    Next r
    
End Sub

Private Sub tmrAntiDump_Timer()
Dim hwnd As Long
Dim pid As Long
Dim phandle As Long
'Dim antiadd As Long

hwnd = FindWindow("NLGAMECLASS", "Delta Force 2,  V1.06.15")
If hwnd = False Then
  Exit Sub
End If
GetWindowThreadProcessId hwnd, pid
phandle = Openprocess(&H1F0FFF, False, pid)
Call WriteAInt(&HA67C98, &H90)
Call WriteAInt(&HA67C99, &H90)
Call WriteAInt(&HA67C9A, &H90)
Call WriteAInt(&HA67C9B, &H90)
'antiadd = &HC7218C
'Value = 1
'For bbb = 1 To 32
   ' If antiadd >= &HC7440C + &H114 Then antiadd = &HC7218C
   '   WriteProcessMemory phandle, antiadd, Value, 1, 0
   '
   ' antiadd = antiadd + &H114
'Next bbb
CloseHandle hprocess

End Sub





Private Sub tmrHotkeys_Timer()

If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyI) Then
Command3_Click
End If
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyA) Then
Command6_Click
End If
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyS) Then
Command7_Click
End If
'If GetAsyncKeyState(vbKeyH) Then
'elevationoff_Click
'End If
'If GetAsyncKeyState(vbKeyH) And GetAsyncKeyState(vbKeyShift) Then
'elevationon_Click
'End If
'If GetAsyncKeyState(vbKeyU) And GetAsyncKeyState(vbKeyShift) Then
'Command8_Click
'End If
'If GetAsyncKeyState(vbKeyJ) And GetAsyncKeyState(vbKeyShift) Then
'Command9_Click
'End If

If GetAsyncKeyState(vbKeyC) And GetAsyncKeyState(vbKeyShift) Then
specialcrosshair_Click
End If
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyP) Then
prone_Click
End If
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKeyN) Then
Command5_Click
End If
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKey9) Then
Command4_Click
End If
If GetAsyncKeyState(vbKeyShift) And GetAsyncKeyState(vbKey0) Then
SAToff_Click
End If
End Sub



Private Sub tmrRespawn_Timer()
Dim resadd As Long
SetGame ("Delta Force 2,  V1.06.15")

YourName = ReadPlayerName(&H67CC00)
resadd = &HC72248
For cc = 1 To 32
    If resadd >= &HC743B4 + &H114 Then resadd = &HC72248
    If YourName = ReadPlayerName(resadd) Then Dead = resadd + &H10
    resadd = resadd + &H114
Next cc

If ReadAByte(Dead, 0) = 1 Then
CountDeadTime = 0
Else
CountDeadTime = CountDeadTime + 1
End If

If CountDeadTime >= 200 Then
SendKeys " "
CountDeadTime = 0
End If
End Sub




Private Sub Command3_Click()
Call ReadALong(&H67CC00, namezz)
Call ReadALong(&HC72248, a)
Call ReadALong(&HC7235C, B)
Call ReadALong(&HC72470, c)
Call ReadALong(&HC72584, D)
Call ReadALong(&HC72698, E)
Call ReadALong(&HC727AC, f)
Call ReadALong(&HC728C0, g)
Call ReadALong(&HC729D4, h)
Call ReadALong(&HC72AE8, i)
Call ReadALong(&HC72BFC, j)
Call ReadALong(&HC72D10, k)
Call ReadALong(&HC72E24, l)
Call ReadALong(&HC72F38, m)
Call ReadALong(&HC7304C, n)
Call ReadALong(&HC73160, o)
Call ReadALong(&HC73274, P)
Call ReadALong(&HC73388, q)
Call ReadALong(&HC7349C, r)
Call ReadALong(&HC735B0, s)
Call ReadALong(&HC736C4, t)
Call ReadALong(&HC737D8, u)
Call ReadALong(&HC738EC, v)
Call ReadALong(&HC73A00, w)
Call ReadALong(&HC73B14, x)
Call ReadALong(&HC73C28, y)
Call ReadALong(&HC73D3C, z)
Call ReadALong(&HC73E50, ab)
Call ReadALong(&HC73F64, bb)
Call ReadALong(&HC74078, cb)
Call ReadALong(&HC7418C, db)
Call ReadALong(&HC742A0, eb)
Call ReadALong(&HC743B4, fb)
Call ReadALong(&HC744C8, gb)
Call ReadALong(&HC745DC, hb)
Call ReadALong(&HC746F0, ib)
Call ReadALong(&HC74804, jb)

If a = namezz Then
Call WriteAIntspc(&HC7225C, gt)
End If
If B = namezz Then
Call WriteAIntspc(&HC72370, gt)
End If
If c = namezz Then
Call WriteAIntspc(&HC72484, gt)
End If
If D = namezz Then
Call WriteAIntspc(&HC72598, gt)
End If
If E = namezz Then
Call WriteAIntspc(&HC726AC, gt)
End If
If f = namezz Then
Call WriteAIntspc(&HC727C0, gt)
End If
If g = namezz Then
Call WriteAIntspc(&HC728D4, gt)
End If
If h = namezz Then
Call WriteAIntspc(&HC729E8, gt)
End If
If i = namezz Then
Call WriteAIntspc(&HC72AFC, gt)
End If
If j = namezz Then
Call WriteAIntspc(&HC72C10, gt)
End If
If k = namezz Then
Call WriteAIntspc(&HC72D24, gt)
End If
If l = namezz Then
Call WriteAIntspc(&HC72E38, gt)
End If
If m = namezz Then
Call WriteAIntspc(&HC72F4C, gt)
End If
If n = namezz Then
Call WriteAIntspc(&HC73060, gt)
End If
If o = namezz Then
Call WriteAIntspc(&HC73174, gt)
End If
If P = namezz Then
Call WriteAIntspc(&HC73288, gt)
End If
If q = namezz Then
Call WriteAIntspc(&HC7339C, gt)
End If
If r = namezz Then
Call WriteAIntspc(&HC734B0, gt)
End If
If s = namezz Then
Call WriteAIntspc(&HC735C4, gt)
End If
If t = namezz Then
Call WriteAIntspc(&HC736D8, gt)
End If
If u = namezz Then
Call WriteAIntspc(&HC737EC, gt)
End If
If v = namezz Then
Call WriteAIntspc(&HC73900, gt)
End If
If w = namezz Then
Call WriteAIntspc(&HC73A14, gt)
End If
If x = namezz Then
Call WriteAIntspc(&HC73B28, gt)
End If
If y = namezz Then
Call WriteAIntspc(&HC73C3C, gt)
End If
If z = namezz Then
Call WriteAIntspc(&HC73D50, gt)
End If
If ab = namezz Then
Call WriteAIntspc(&HC73E64, gt)
End If
If bb = namezz Then
Call WriteAIntspc(&HC73F78, gt)
End If
If cb = namezz Then
Call WriteAIntspc(&HC7408C, gt)
End If
If db = namezz Then
Call WriteAIntspc(&HC741A0, gt)
End If
If eb = namezz Then
Call WriteAIntspc(&HC742B4, gt)
End If
If fb = namezz Then
Call WriteAIntspc(&HC743C8, gt)
End If
If gb = namezz Then
Call WriteAIntspc(&HC744DC, gt)
End If
If hb = namezz Then
Call WriteAIntspc(&HC745F0, gt)
End If
If ib = namezz Then
Call WriteAIntspc(&HC74704, gt)
End If
If jb = namezz Then
Call WriteAIntspc(&HC74818, gt)
End If

End Sub


