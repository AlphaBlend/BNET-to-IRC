VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Battle.Net To IRC %v by Vector"
   ClientHeight    =   6600
   ClientLeft      =   150
   ClientTop       =   780
   ClientWidth     =   16200
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6600
   ScaleWidth      =   16200
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrReleaseQueue 
      Enabled         =   0   'False
      Interval        =   1250
      Left            =   2280
      Top             =   1440
   End
   Begin MSWinsockLib.Winsock sckBNLS 
      Index           =   0
      Left            =   3240
      Top             =   1440
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock sckBNET 
      Index           =   0
      Left            =   3720
      Top             =   1440
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock sckIRC 
      Left            =   2760
      Top             =   1440
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Frame Frame2 
      Caption         =   "Internet Relay Chat"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6375
      Left            =   8160
      TabIndex        =   1
      Top             =   120
      Width           =   7935
      Begin VB.Frame Frame3 
         Caption         =   "Display Mode"
         Height          =   555
         Left            =   240
         TabIndex        =   8
         Top             =   240
         Width           =   2415
         Begin VB.OptionButton rcChat 
            Caption         =   "Chat"
            Height          =   255
            Left            =   1320
            TabIndex        =   10
            Top             =   240
            Width           =   735
         End
         Begin VB.OptionButton rcConsole 
            Caption         =   "Console"
            Height          =   255
            Left            =   120
            TabIndex        =   9
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.CheckBox chkBtoBNET 
         Caption         =   "Broadcast to BNET"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5760
         TabIndex        =   6
         Top             =   6000
         Width           =   2055
      End
      Begin VB.TextBox txtIRCChat 
         Height          =   285
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   3
         Top             =   6000
         Width           =   5415
      End
      Begin RichTextLib.RichTextBox rtbChatIRCConsole 
         Height          =   5055
         Left            =   120
         TabIndex        =   2
         Top             =   840
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _Version        =   393217
         BackColor       =   0
         BorderStyle     =   0
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"frmMain.frx":0000
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin RichTextLib.RichTextBox rtbChatIRCChat 
         Height          =   5055
         Left            =   120
         TabIndex        =   11
         Top             =   840
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   8916
         _Version        =   393217
         BackColor       =   0
         BorderStyle     =   0
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"frmMain.frx":0082
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Battle.Net"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7935
      Begin MSWinsockLib.Winsock sckCheckUpdate 
         Left            =   2640
         Top             =   1800
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.Timer tmrCheckUpdate 
         Enabled         =   0   'False
         Interval        =   450
         Left            =   2160
         Top             =   1800
      End
      Begin VB.CheckBox chkBtoIRC 
         Caption         =   "Broadcast to IRC"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6000
         TabIndex        =   7
         Top             =   6000
         Width           =   1815
      End
      Begin VB.TextBox txtBNETChat 
         Height          =   285
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   5
         Top             =   6000
         Width           =   5655
      End
      Begin RichTextLib.RichTextBox rtbChatBNET 
         Height          =   5535
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   7725
         _ExtentX        =   13626
         _ExtentY        =   9763
         _Version        =   393217
         BackColor       =   0
         BorderStyle     =   0
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"frmMain.frx":0104
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuConfiguration 
         Caption         =   "Configuration"
      End
      Begin VB.Menu mnuSeparator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuQuit 
         Caption         =   "Quit"
      End
   End
   Begin VB.Menu mnuConnection 
      Caption         =   "Connection"
      Begin VB.Menu mnuConnectBNET 
         Caption         =   "Connect to Battle.Net"
      End
      Begin VB.Menu mnuDisconnectBNET 
         Caption         =   "Disconnect from Battle.Net"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuSeparator2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuConnectIRC 
         Caption         =   "Connect to IRC"
      End
      Begin VB.Menu mnuDisconnectIRC 
         Caption         =   "Disconnect from IRC"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "Help"
      Begin VB.Menu mnuAbout 
         Caption         =   "About"
      End
      Begin VB.Menu mnuSeparator3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCheckForUpdates 
         Caption         =   "Check for Updates"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkDisplayRTB_Click()
    If chkDisplayRTB.value = 1 Then
        rtbChatIRCConsole.Visible = False
        rtbChatIRCChat.Visible = True
    Else
        rtbChatIRCConsole.Visible = True
        rtbChatIRCChat.Visible = False
    End If
End Sub

Private Sub chkBtoBNET_Click()
    If chkBtoBNET.value = 1 Then
        isBroadcastToBNET = True
    Else
        isBroadcastToBNET = False
    End If
End Sub

Private Sub chkBtoIRC_Click()
    If chkBtoIRC.value = 1 Then
        isBroadcastToIRC = True
    Else
        isBroadcastToIRC = False
    End If
End Sub

Private Sub Form_Load()
    Me.Caption = Replace(Me.Caption, "%v", "v" & PROGRAM_VERSION)

    Dim arrGateways() As Variant, gateway As String, IPs() As String

    If (Dir$(App.Path & "\Config.ini") <> vbNullString) Then
        loadConfig
  
        If (config.rememberWindowPosition) Then
            If (config.formTop > 0) Then
                Me.Top = config.formTop
            End If
    
            If (config.formLeft > 0) Then
                Me.Left = config.formLeft
            End If
        End If
    Else
        setDefaultValues
    End If
  
    rcConsole.value = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If (config.rememberWindowPosition) Then
        WriteINI "Window", "Top", Me.Top, "Config.ini"
        WriteINI "Window", "Left", Me.Left, "Config.ini"
    End If

    quitProgram
End Sub

Private Sub mnuAbout_Click()
    frmAbout.Show
End Sub

Private Sub mnuCheckForUpdates_Click()
    If (sckCheckUpdate.State = sckClosed) Then
        sckCheckUpdate.Connect "files.codespeak.org", 80
    End If
End Sub

Private Sub mnuConfiguration_Click()
    frmConfig.Show
End Sub

Private Sub mnuConnectBNET_Click()
    If config.bnetKeyCount = 0 Then
        MsgBox "Your keys are not configured. Go to File -> Configuration -> Manage Keys first.", vbOKOnly, PROGRAM_TITLE
        Exit Sub
    End If
  
    AddChat rtbChatBNET, vbYellow, "Bot #0: [BNET] Connecting..."
    sckBNET(0).Connect config.bnetServer, 6112
  
    mnuConnectBNET.Enabled = False
    mnuDisconnectBNET.Enabled = True
End Sub

Private Sub mnuConnectIRC_Click()
    AddChat rtbChatIRCConsole, vbYellow, "[IRC] Connecting to " & config.ircServer & ":" & config.ircPort & "..."
    sckIRC.Connect config.ircServer, config.ircPort
  
    mnuConnectIRC.Enabled = False
    mnuDisconnectIRC.Enabled = True
End Sub

Private Sub mnuDisconnectBNET_Click()
    disconnectAll
End Sub

Private Sub mnuDisconnectIRC_Click()
    AddChat rtbChatIRCConsole, vbRed, "[IRC] All connections closed."
  
    If sckIRC.State = sckConnected Then
        'SendToBNET "Disconnected from " & config.ircServer & "!"
        SendToBNET "Disconnected from IRC!"
        sckIRC.SendData "QUIT"
        DoEvents: DoEvents: DoEvents: DoEvents
    End If

    sckIRC.Close

    mnuDisconnectIRC.Enabled = False
    mnuConnectIRC.Enabled = True
End Sub

Private Sub mnuQuit_Click()
    quitProgram
End Sub

Private Sub rcChat_Click()
    rtbChatIRCConsole.Visible = False
    rtbChatIRCChat.Visible = True
End Sub

Private Sub rcConsole_Click()
    rtbChatIRCConsole.Visible = True
    rtbChatIRCChat.Visible = False
End Sub

Private Sub sckBNET_Connect(index As Integer)
    AddChat rtbChatBNET, vbGreen, "Bot #" & index & ": [BNET] Connected!"
    sckBNET(index).SendData Chr$(1)
    Send0x50 index
End Sub

Private Sub sckBNET_DataArrival(index As Integer, ByVal bytesTotal As Long)
    Dim data As String, pLen As Long, pID As Byte
  
    sckBNET(index).GetData data
  
    Do While Len(data) > 0
        pID = Asc(Mid$(data, 2, 1))
        CopyMemory pLen, ByVal Mid$(data, 3, 2), 2
        bnetPacketHandler(index).SetData Mid$(data, 5)
    
        Select Case pID
            Case &HA: Recv0x0A index
            Case &HF: Recv0x0F index
            Case &H25: Send0x25 index
            Case &H3A: Recv0x3A index
            Case &H3D: Recv0x3D index
            Case &H50: Recv0x50 index
            Case &H51: Recv0x51 index
            Case &H52: Recv0x52 index
            Case &H53: Recv0x53 index
            Case &H54: Recv0x54 index
        End Select
    
        data = Mid$(data, pLen + 1)
    Loop
End Sub

Private Sub sckBNET_Error(index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    AddChat rtbChatBNET, vbRed, "Bot #" & index & " error #" & Number & ": " & Description
End Sub

Private Sub sckBNLS_Connect(index As Integer)
    Select Case bnlsType
        Case REQUEST_FILE_INFO
            AddChat rtbChatBNET, vbGreen, "Bot #" & index & ": [BNLS] Connected!"
            Send_BNLS_0x0E index
        Case UPDATE_VERSION_BYTE
            Send_BNLS_0x10 index, getProdID(bnetData(index).badClientProduct)
    End Select
End Sub

Private Sub sckBNLS_DataArrival(index As Integer, ByVal bytesTotal As Long)
    Dim data As String, pID As Byte, pLen As Long
    sckBNLS(index).GetData data
  
    Do While Len(data) > 0
        CopyMemory pLen, ByVal Mid$(data, 1, 2), 2
        pID = Asc(Mid$(data, 3, 1))
        bnlsPacketHandler(index).SetData Mid$(data, 4)
    
        Select Case pID
            Case &H9: Recv_BNLS_0x09 index
            Case &HE: Recv_BNLS_0x0E index
            Case &HF: Recv_BNLS_0x0F index
            Case &H10: Recv_BNLS_0x10 index
        End Select
    
        data = Mid$(data, pLen + 1)
    Loop
End Sub

Private Sub sckCheckUpdate_Connect()
    sckCheckUpdate.SendData "GET /projects/bnet-to-irc/CurrentVersion.txt HTTP/1.1" & vbCrLf _
                                & "User-Agent: BNET-to-IRC/" & PROGRAM_VERSION & vbCrLf _
                                & "Host: files.codespeak.org" & vbCrLf & vbCrLf
End Sub

Private Sub sckCheckUpdate_DataArrival(ByVal bytesTotal As Long)
    Dim data As String
    sckCheckUpdate.GetData data
    
    updateString = updateString & data
    
    tmrCheckUpdate.Enabled = True
End Sub

Private Sub sckCheckUpdate_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    MsgBox "Unable to check for update!", vbOKOnly Or vbExclamation, PROGRAM_TITLE
    tmrCheckUpdate.Enabled = False
    sckCheckUpdate.Close
End Sub

Private Sub sckIRC_Close()
    'SendToBNET "Disconnected from the IRC server at " & config.ircServer & "!"
    SendToBNET "Disconnected from IRC!"
End Sub

Private Sub sckIRC_Connect()
    AddChat rtbChatIRCConsole, vbGreen, "[IRC] Connected!"
    sckIRC.SendData "NICK " & config.ircUsername & vbCrLf
    sckIRC.SendData "USER " & config.ircUsername & " 0 0 " & config.ircUsername & vbCrLf
    'SendToBNET "Connected to the IRC server at " & config.ircServer & "!"
    SendToBNET "Connected to IRC!"
End Sub

Private Sub sckIRC_DataArrival(ByVal bytesTotal As Long)
    Dim data As String, arrData() As String, name As String, text As String, specifiedChannel As String
    sckIRC.GetData data
  
    If InStr(data, config.ircUsername) Then
        data = Mid$(data, InStr(data, config.ircUsername) + Len(config.ircUsername) + 1)
    End If
    
    If UBound(Split(data)) > 1 Then
        arrData = Split(data)
    
        Select Case UCase(arrData(1))
            Case "PRIVMSG"
                name = Mid$(Split(arrData(0), "!")(0), 2)
                text = Split(data, arrData(1))(1)
                text = Replace(Mid$(text, InStr(text, ":") + 1), vbCrLf, vbNullString)
                'text = Replace(Split(Split(data, arrData(1))(1), ":")(1), vbCrLf, vbNullString)
                specifiedChannel = Split(arrData(2), ":")(0)
  
                If isBroadcastToBNET Then
                    'SendToBNET "(" & config.ircChannel & " @ " & config.ircServer & ") " & name & ": " & getText
                    SendToBNET name & ": " & text
                End If
            Case Else
                If (InStr(data, "End of /MOTD command.")) Then
                    sckIRC.SendData "JOIN " & config.ircChannel & vbCrLf
                End If

                AddChat rtbChatIRCConsole, vbYellow, data
        End Select
    Else
        AddChat rtbChatIRCConsole, vbYellow, data
  
        If Left(data, 5) = "PING " Then
            AddChat rtbChatIRCConsole, vbWhite, "PING has been PONG'D"
            sckIRC.SendData "PONG " & Mid$(data, 6) & vbCrLf
      
            Exit Sub
        End If
    End If
End Sub

Private Sub tmrCheckUpdate_Timer()
    On Error GoTo Err

    Dim versionToCheck As String, updateMsg As String
    
    versionToCheck = Split(updateString, "Content-Type: text/plain" & vbCrLf & vbCrLf)(1)
    
    If (isNewVersion(versionToCheck)) Then
        updateMsg = "There is a new update for BNET-to-IRC!" & vbNewLine & vbNewLine & "Your version: " & PROGRAM_VERSION & " new version: " & versionToCheck & vbNewLine & vbNewLine _
                  & "Would you like to visit the downloads page for updates?"
    
        msgBoxResult = MsgBox(updateMsg, vbYesNo Or vbInformation, "New BNET-to-IRC version available!")

        If (msgBoxResult = vbYes) Then
            ShellExecute 0, "open", RELEASES_URL, vbNullString, vbNullString, 4
        End If
    Else
        MsgBox "There is no new version at this time.", vbOKOnly Or vbInformation, PROGRAM_TITLE
    End If
    
Err:
    If (Err.Number > 0) Then
        Err.Clear
        MsgBox "Unable to check for update!", vbOKOnly Or vbExclamation, PROGRAM_TITLE
    End If
    
    updateString = vbNullString
    tmrCheckUpdate.Enabled = False
    sckCheckUpdate.Close
End Sub

Private Sub tmrReleaseQueue_Timer()
    Dim queuedMessage As String
   
    queuedMessage = dicQueue.Item(dicQueueIndex)
   
    AddChat rtbChatBNET, vbYellow, "Bot #" & bnetQueueIndex & ": <" & config.bnetUsername & "> ", vbWhite, queuedMessage
   
    With bnetPacketHandler(bnetQueueIndex)
        .InsertNTString queuedMessage
        .sendPacket &HE
    End With
  
    bnetQueueIndex = bnetQueueIndex + 1
    dicQueueIndex = dicQueueIndex + 1
  
    If bnetQueueIndex = sckBNET.Count Then bnetQueueIndex = 0
  
    If dicQueueIndex > dicQueue.Count Then
        dicQueueIndex = 1
        dicQueue.RemoveAll
        tmrReleaseQueue.Enabled = False
    End If
End Sub

Private Sub txtBNETChat_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        If sckBNET(bnetSocketIndex).State = sckConnected Then
            txtBNETChat.text = Replace(txtBNETChat.text, vbNewLine, vbNullString)
            SendToBNET txtBNETChat.text
            txtBNETChat.text = vbNullString
        End If
    
        bnetSocketIndex = bnetSocketIndex + 1
    
        If bnetSocketIndex = sckBNET.Count Then bnetSocketIndex = 0
    End If
End Sub

Private Sub txtIRCChat_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim text As String, cmd() As String, cmdEx() As String
  
    If KeyCode = 13 Then
        text = txtIRCChat.text
        text = Replace(text, vbNewLine, vbNullString)
        txtIRCChat.text = vbNullString
    
        If Left(text, 1) = "/" Then
            cmd = Split(Mid$(text, 2))
      
            Select Case LCase(cmd(0))
                Case "join"
                    cmdEx = Split(text, " ", 2)
                    config.ircChannel = cmdEx(1)
                    sckIRC.SendData "JOIN " & cmdEx(1) & vbCrLf
            End Select
        Else
            If sckIRC.State <> sckConnected Then Exit Sub

            sckIRC.SendData "PRIVMSG " & config.ircChannel & " :" & text & vbCrLf
            AddChat rtbChatIRCChat, vbWhite, config.ircServer & " (", vbYellow, config.ircChannel, vbWhite, ") " & text
        End If
    End If
End Sub
