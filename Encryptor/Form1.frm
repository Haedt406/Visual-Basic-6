VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Encryptor 5K made by The_Bomb"
   ClientHeight    =   5925
   ClientLeft      =   6690
   ClientTop       =   3030
   ClientWidth     =   14490
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   14490
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text6 
      Height          =   285
      Left            =   120
      TabIndex        =   5
      Text            =   "Encryption Data"
      Top             =   120
      Width           =   7575
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Decrypt"
      Height          =   495
      Left            =   10440
      TabIndex        =   4
      Top             =   600
      Width           =   735
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Encrypt"
      Height          =   495
      Left            =   1080
      TabIndex        =   3
      Top             =   600
      Width           =   735
   End
   Begin VB.TextBox Text5 
      Height          =   4605
      Left            =   9240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Text            =   "Form1.frx":0000
      Top             =   1200
      Width           =   3255
   End
   Begin VB.TextBox Text4 
      Height          =   4605
      Left            =   3480
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "Form1.frx":000F
      Top             =   1200
      Width           =   5655
   End
   Begin VB.TextBox Text3 
      Height          =   4605
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Form1.frx":001E
      Top             =   1200
      Width           =   3255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Public Function Encrypt(ByVal SourceData As String) As String
Dim s9$
Dim PC1 As Long, LC1 As Long, passvord As String

passvord = Chr(32) & Chr(99) & Chr(8) & Chr(90) & Chr(5) & Chr(1) & Chr(2) & Chr(3) & Chr(4) & Chr(5) & Chr(2) & Chr(12) & Chr(12) & Chr(13) & Chr(133) & Chr(213) & Chr(13) & Chr(43) & Chr(31) & Chr(65) & Chr(45) & Chr(66) & Chr(45) & Chr(43) & Chr(22) & Chr(4) & Chr(0) & Chr(2) & Chr(8) & Chr(77) & Chr(44) & Chr(33) & Chr(32) & Chr(24) & Chr(36) & Chr(46) & Chr(56) & Chr(17) & Chr(26) & Chr(2) & Chr(32) & Chr(43) & Chr(56) & Chr(51) & Chr(24) & Chr(24) & Chr(35) & Chr(46) & Chr(57) & Chr(18) & Chr(29)

Text6.Text = passvord
 
s9$ = Space$(Len(SourceData))
PC1 = 0
If Len(s9$) = 0 Then Exit Function
For LC1 = 1 To Len(s9$)
     PC1 = PC1 + 1
     If PC1 > Len(passvord) Then
          PC1 = 1
     End If
     Mid$(s9$, LC1, 1) = Chr(Asc(Mid(SourceData, LC1, 1)) Xor Asc(Mid$(passvord, PC1, 1)))
Next
Encrypt = s9$

End Function

Private Sub Command3_Click()
 Text4.Text = Encrypt(Text3.Text)
End Sub

Private Sub Command4_Click()
  Text5.Text = Encrypt(Text4.Text)
End Sub

Private Sub Command5_Click()
Call file_encryptor
End Sub



Public Sub file_encryptor()

Dim temp

Dim strX As String
strX = String(FileLen(Text1.Text), 0)
Open Text1.Text For Binary Access Read Write As #1
Get #1, , strX

Close #1

strX = Encrypt(strX)

Open Text2.Text For Binary Access Read Write As #1
Put #1, , strX

Close #1

End Sub


