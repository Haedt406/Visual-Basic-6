VERSION 5.00
Begin VB.MDIForm MDIForm1 
   AutoShowChildren=   0   'False
   BackColor       =   &H00000000&
   Caption         =   "|-| † ßøøm † "
   ClientHeight    =   7170
   ClientLeft      =   2685
   ClientTop       =   1740
   ClientWidth     =   9615
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   MousePointer    =   2  'Cross
   OLEDropMode     =   1  'Manual
   Picture         =   "MDIForm1.frx":7BBA
   Begin VB.Menu pwd 
      Caption         =   "Start"
   End
   Begin VB.Menu mnuExit 
      Caption         =   "Exit"
      WindowList      =   -1  'True
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub MDIForm_()
If trainer.Visible = False Then MDIForm1.Visible = True
End Sub

Private Sub mnuExit_Click()
Unload Me
End Sub

Private Sub mnuinfo_Click()

End Sub

Private Sub pwd_Click()
trainer.Visible = True
End Sub
