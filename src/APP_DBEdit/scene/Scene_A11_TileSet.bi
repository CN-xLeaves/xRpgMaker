


' ͼ�鼯�б� - �Ի�
Sub UI_TileSet_List_OnDrawItem(ele As xui.ListBox Ptr, iPos As UInteger, Item As xui.List_Item_BasicStruct Ptr, stk As Integer, x As Integer, y As Integer, w As Integer, h As Integer)
	Select Case stk
		Case 1
			' �ȵ���
			xge.shape.RectFull(ele->DrawBuffer, x + 1, y + 1, (x + w) - 2, (y + h) - 2, ele->ItemHotStyle.FillColor)
			xge.shape.Rect(ele->DrawBuffer, x, y, (x + w) - 1, (y + h) - 1, ele->ItemHotStyle.BorderColor)
		Case 2
			' ѡ����
			xge.shape.RectFull(ele->DrawBuffer, x + 1, y + 1, (x + w) - 2, (y + h) - 2, ele->ItemSelStyle.FillColor)
			xge.shape.Rect(ele->DrawBuffer, x, y, (x + w) - 1, (y + h) - 1, ele->ItemSelStyle.BorderColor)
	End Select
	xge.Text.DrawA(ele->DrawBuffer, x + 2, y + 2, Format(iPos, "000 : ") & *Item->Text, Item->TextColor, ele->TextFont)
End Sub

' ͼ�鼯�б� - �л�ѡ���¼�
Sub UI_TileSet_List_OnSelectChange(ele As xui.ListBox Ptr, iOld As UInteger)
	If ele->ListIndex Then
		Dim TileSetInfo As xRpgMaker_TileSet Ptr = ele->List.UserData(ele->ListIndex)
		' ����ͼ�鼯�ĸ���������ʾ
		UI_TileSet_Name->Text = @TileSetInfo->TileSetName
		If TileSetInfo->TileSetFile = "" Then
			UI_TileSet_File->Text = @"��"
		Else
			UI_TileSet_File->Text = @TileSetInfo->TileSetFile
		EndIf
		For i As Integer = 0 To 6
			If TileSetInfo->AutoTileFile(i) = "" Then
				UI_TileSet_AutoTile(i)->Text = @"��"
			Else
				UI_TileSet_AutoTile(i)->Text = @TileSetInfo->AutoTileFile(i)
			EndIf
		Next
		If TileSetInfo->BackGroundFile = "" Then
			UI_TileSet_Back->Text = @"��"
		Else
			UI_TileSet_Back->Text = @TileSetInfo->BackGroundFile
		EndIf
		If TileSetInfo->FogFile = "" Then
			UI_TileSet_Fog->Text = @"��"
		Else
			UI_TileSet_Fog->Text = @TileSetInfo->FogFile
		EndIf
		If TileSetInfo->BattleFile = "" Then
			UI_TileSet_Battle->Text = @"��"
		Else
			UI_TileSet_Battle->Text = @TileSetInfo->BattleFile
		EndIf
		' Ӧ��ͼ�鼯������ָ�뵽ͼ��༭��
		UI_TileSet_TileEdit->UseTileSet(TileSetInfo)
	EndIf
End Sub



' �������ֵ
Sub UI_TileSet_SetMax_OnClick(ele As xui.Button Ptr, btn As Integer)
	UI_TileSet_List->List.Append("������ͼ��")
End Sub



' �޸����ư�ť
Sub UI_TileSet_Name_OnClick(ele As xui.Button Ptr, btn As Integer)
	If InputBox(xge.hWnd, "�������µ�ͼ�鼯���ƣ�", "xRpgMaker DataBase Edit", ele->Text) Then
		Dim TileSetInfo As xRpgMaker_TileSet Ptr = UI_TileSet_List->List.UserData(UI_TileSet_List->ListIndex)
		TileSetInfo->TileSetName = InputBox_RetStr
		UI_TileSet_List->List.Text(UI_TileSet_List->ListIndex) = @TileSetInfo->TileSetName
	EndIf
End Sub

' �޸�ͼ�鼯ͼƬ��ť
Sub UI_TileSet_File_OnClick(ele As xui.Button Ptr, btn As Integer)
	If InputBox(xge.hWnd, "�������µ�ͼ�鼯ͼƬ�ļ�����", "xRpgMaker DataBase Edit", ele->Text) Then
		Dim TileSetInfo As xRpgMaker_TileSet Ptr = UI_TileSet_List->List.UserData(UI_TileSet_List->ListIndex)
		TileSetInfo->TileSetFile = InputBox_RetStr
		UI_TileSet_File->Text = @TileSetInfo->TileSetFile
	EndIf
End Sub

' �޸��Զ�ԭ��ͼƬ��ť (�Զ�ԭ�����ͨ��TagInt���Ա���)
Sub UI_TileSet_AutoTile_OnClick(ele As xui.Button Ptr, btn As Integer)
	Dim arrid As Integer = ele->TagInt
	If InputBox(xge.hWnd, "�������µ��Զ�ԭ��ͼƬ�ļ�����", "xRpgMaker DataBase Edit", ele->Text) Then
		Dim TileSetInfo As xRpgMaker_TileSet Ptr = UI_TileSet_List->List.UserData(UI_TileSet_List->ListIndex)
		TileSetInfo->AutoTileFile(arrid) = InputBox_RetStr
		UI_TileSet_AutoTile(arrid)->Text = @TileSetInfo->AutoTileFile(arrid)
	EndIf
End Sub

' �޸�ȫ��ͼƬ��ť
Sub UI_TileSet_Back_OnClick(ele As xui.Button Ptr, btn As Integer)
	If InputBox(xge.hWnd, "�������µ�ȫ��ͼƬ�ļ�����", "xRpgMaker DataBase Edit", ele->Text) Then
		Dim TileSetInfo As xRpgMaker_TileSet Ptr = UI_TileSet_List->List.UserData(UI_TileSet_List->ListIndex)
		TileSetInfo->BackGroundFile = InputBox_RetStr
		UI_TileSet_Back->Text = @TileSetInfo->BackGroundFile
	EndIf
End Sub

' �޸���ͼƬ��ť
Sub UI_TileSet_Fog_OnClick(ele As xui.Button Ptr, btn As Integer)
	If InputBox(xge.hWnd, "�������µ���ͼƬ�ļ�����", "xRpgMaker DataBase Edit", ele->Text) Then
		Dim TileSetInfo As xRpgMaker_TileSet Ptr = UI_TileSet_List->List.UserData(UI_TileSet_List->ListIndex)
		TileSetInfo->FogFile = InputBox_RetStr
		UI_TileSet_Fog->Text = @TileSetInfo->FogFile
	EndIf
End Sub

' �޸�ս������ͼƬ��ť
Sub UI_TileSet_Battle_OnClick(ele As xui.Button Ptr, btn As Integer)
	If InputBox(xge.hWnd, "�������µ�ս������ͼƬ�ļ�����", "xRpgMaker DataBase Edit", ele->Text) Then
		Dim TileSetInfo As xRpgMaker_TileSet Ptr = UI_TileSet_List->List.UserData(UI_TileSet_List->ListIndex)
		TileSetInfo->BattleFile = InputBox_RetStr
		UI_TileSet_Battle->Text = @TileSetInfo->BattleFile
	EndIf
End Sub



' ����ͼ�鼯����
Sub SaveTileData()
	Dim FileHead As xRpgMaker_StructDB_Info
	FileHead.HeadText = XRM_SDB_FILEHEAD
	FileHead.DataType = XRM_SDB_TYPE_TILESET
	FileHead.ItemCount = UI_TileSet_List->List.StructCount
	FileHead.ItemSize = UI_TileSet_List->List.StructLenght
	FileHead.Reserved = 0
	xFile.Write(G_Path_Data & "Tilesets.xrmsdb", @FileHead, 0, SizeOf(xRpgMaker_StructDB_Info))
	xFile.Write(G_Path_Data & "Tilesets.xrmsdb", UI_TileSet_List->List.StructMemory, SizeOf(xRpgMaker_StructDB_Info), FileHead.ItemCount * FileHead.ItemSize)
End Sub

' ����ͼ�鼯����
Sub LoadTileData()
	' ���ļ���������
	Dim FileHead As xRpgMaker_StructDB_Info
	xFile.Read(G_Path_Data & "Tilesets.xrmsdb", @FileHead, 0, SizeOf(xRpgMaker_StructDB_Info))
	If (FileHead.HeadText = XRM_SDB_FILEHEAD) And (FileHead.DataType = XRM_SDB_TYPE_TILESET) And (FileHead.ItemSize = UI_TileSet_List->List.StructLenght) And (FileHead.ItemCount > 0) Then
		Dim idx As UInteger = UI_TileSet_List->List.AppendStruct(FileHead.ItemCount)
		Dim dat As Any Ptr = UI_TileSet_List->List.GetPtrStruct(idx)
		If dat Then
			xFile.Read(G_Path_Data & "Tilesets.xrmsdb", dat, SizeOf(xRpgMaker_StructDB_Info), FileHead.ItemCount * FileHead.ItemSize)
			' �޸�Item�ı���
			For i As UInteger = 1 To FileHead.ItemCount
				UI_TileSet_List->List.Text(i) = UI_TileSet_List->List.UserData(i)
			Next
		EndIf
	EndIf
	' ����б��д�����Ŀ����ѡ�е�һ���������¼�
	If UI_TileSet_List->List.Count > 0 Then
		UI_TileSet_List->ListIndex = 1
		UI_TileSet_List_OnSelectChange(UI_TileSet_List, 0)
	EndIf
End Sub



Sub InitUI_A11_TileSet(root As xui.Element Ptr)
	UI_TileSet_LayoutList = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 6, 6, 2, 1, XUI_LAYOUT_T2B, "UI_TileSet_LayoutList")
	UI_TileSet_LayoutInfo = xui.CreateFrame(XUI_LAYOUT_RULER_RATIO, 6, 6, 7, 1, XUI_LAYOUT_L2R, "ͼ�鼯�༭", "UI_TileSet_LayoutInfo")
	UI_TileSet_LayoutList->Layout.RectBox.BottomOffset = 6
	UI_TileSet_LayoutInfo->Layout.RectBox.RightOffset = 6
	UI_TileSet_LayoutInfo->Layout.RectBox.BottomOffset = 6
	UI_TileSet_LayoutInfo->BackStyle.BorderColor = &HFF808080
	UI_TileSet_LayoutInfo->BackStyle.FillColor = &HFFD0D0D0
	root->Childs.AddElement(UI_TileSet_LayoutList)
	root->Childs.AddElement(UI_TileSet_LayoutInfo)
	' ��಼��
	UI_TileSet_Title = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "ͼ ��", &HFFFFFFFF, 2, "UI_TileSet_Title")
	UI_TileSet_Title->BackStyle.Hide = FALSE
	UI_TileSet_Title->BackStyle.BorderColor = &HFF606060
	UI_TileSet_Title->BackStyle.FillColor = &HFF606060
	UI_TileSet_Title->TextAlign = XGE_ALIGN_CENTER Or XGE_ALIGN_MIDDLE
	UI_TileSet_List = xui.CreateListBox(XUI_LAYOUT_RULER_RATIO, 0, 4, 1, 18)
	UI_TileSet_SetMax = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 4, 1, 1, "�������ֵ", "UI_TileSet_SetMax")
	UI_TileSet_LayoutList->Childs.AddElement(UI_TileSet_Title)
	UI_TileSet_LayoutList->Childs.AddElement(UI_TileSet_List)
	UI_TileSet_LayoutList->Childs.AddElement(UI_TileSet_SetMax)
	UI_TileSet_List->Event.OnSelectChange = Cast(Any Ptr, @UI_TileSet_List_OnSelectChange)
	UI_TileSet_List->Event.OnDrawItem = Cast(Any Ptr, @UI_TileSet_List_OnDrawItem)
	UI_TileSet_SetMax->Event.OnClick = Cast(Any Ptr, @UI_TileSet_SetMax_OnClick)
	' �Ҳ಼��
	UI_TileSet_Layout1 = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 6, 24, 4, 1, XUI_LAYOUT_T2B, "UI_TileSet_Layout1")
	UI_TileSet_Layout2 = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 6, 24, 7, 1, XUI_LAYOUT_T2B, "UI_TileSet_Layout2")
	UI_TileSet_Layout3 = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 24, 3, 1, XUI_LAYOUT_T2B, "UI_TileSet_Layout3")
	UI_TileSet_Layout1->Layout.RectBox.BottomOffset = 6
	UI_TileSet_Layout2->Layout.RectBox.RightOffset = 6
	UI_TileSet_Layout2->Layout.RectBox.BottomOffset = 6
	UI_TileSet_Layout3->Layout.RectBox.RightOffset = 6
	UI_TileSet_Layout3->Layout.RectBox.BottomOffset = 6
	UI_TileSet_LayoutInfo->Childs.AddElement(UI_TileSet_Layout1)
	UI_TileSet_LayoutInfo->Childs.AddElement(UI_TileSet_Layout2)
	UI_TileSet_LayoutInfo->Childs.AddElement(UI_TileSet_Layout3)
	' ͼ�鼯��Ϣ
	UI_TileSet_Name_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "���ƣ�", &HFF000000, 1, "UI_TileSet_Name_Label")
	UI_TileSet_Name = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "", "UI_TileSet_Name")
	UI_TileSet_File_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 10, 1, 1, "��ͼԪ��ͼ��", &HFF000000, 1, "UI_TileSet_Name_Label")
	UI_TileSet_File = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "", "UI_TileSet_Name")
	UI_TileSet_AutoTile_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 10, 1, 1, "�Զ�Ԫ��ͼ��", &HFF000000, 1, "UI_TileSet_Name_Label")
	UI_TileSet_Back_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 8, 1, 1, "ȫ��ͼ��", &HFF000000, 1, "UI_TileSet_Back_Label")
	UI_TileSet_Back = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "��", "UI_TileSet_Back")
	UI_TileSet_Fog_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 10, 1, 1, "��ͼ��", &HFF000000, 1, "UI_TileSet_Fog_Label")
	UI_TileSet_Fog = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "��", "UI_TileSet_Fog")
	UI_TileSet_Battle_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 10, 1, 1, "ս������ͼ��", &HFF000000, 1, "UI_TileSet_Battle_Label")
	UI_TileSet_Battle = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "��", "UI_TileSet_Battle")
	UI_TileSet_Layout1_Space = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 2, XUI_LAYOUT_T2B, "UI_TileSet_Layout1_Space")
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Name_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Name)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_File_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_File)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_AutoTile_Label)
	For i As Integer = 0 To 6
		UI_TileSet_AutoTile(i) = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "��", "UI_TileSet_AutoTile_" & i)
		UI_TileSet_AutoTile(i)->Layout.RectBox.BottomOffset = 2
		UI_TileSet_AutoTile(i)->TagInt = i
		UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_AutoTile(i))
		UI_TileSet_AutoTile(i)->Event.OnClick = Cast(Any Ptr, @UI_TileSet_AutoTile_OnClick)
	Next
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Back_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Back)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Fog_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Fog)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Battle_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Battle)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Layout1_Space)
	UI_TileSet_Name->Event.OnClick = Cast(Any Ptr, @UI_TileSet_Name_OnClick)
	UI_TileSet_File->Event.OnClick = Cast(Any Ptr, @UI_TileSet_File_OnClick)
	UI_TileSet_Back->Event.OnClick = Cast(Any Ptr, @UI_TileSet_Back_OnClick)
	UI_TileSet_Fog->Event.OnClick = Cast(Any Ptr, @UI_TileSet_Fog_OnClick)
	UI_TileSet_Battle->Event.OnClick = Cast(Any Ptr, @UI_TileSet_Battle_OnClick)
	' ͼ�����Ա༭
	UI_TileSet_TileEdit = xui.CreateTileEdit(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, 0, 0, "UI_TileSet_TileEdit")
	UI_TileSet_Layout2->Childs.AddElement(UI_TileSet_TileEdit)
	' ͼ�����Ա༭��ѡ��
	UI_TileSet_EditMode1 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "ͨ�� : ��", "UI_TileSet_EditMode1")
	UI_TileSet_EditMode2 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 6, 1, 1, "ͨ�� : 4����", "UI_TileSet_EditMode2")
	UI_TileSet_EditMode3 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 6, 1, 1, "���ȼ�", "UI_TileSet_EditMode3")
	UI_TileSet_EditMode4 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 6, 1, 1, "��ľ��ï��", "UI_TileSet_EditMode4")
	UI_TileSet_EditMode5 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 6, 1, 1, "���α�־", "UI_TileSet_EditMode5")
	UI_TileSet_Layout3_Space = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 12, XUI_LAYOUT_T2B, "UI_TileSet_Layout1_Space")
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode1)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode2)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode3)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode4)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode5)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_Layout3_Space)
	
	' ����ͼ�鼯�б�����
	UI_TileSet_List->List.SetUserDataSize(SizeOf(xRpgMaker_TileSet))
	LoadTileData()
End Sub



' Scene function
Function A11_TileSet_Scene(msg As Integer, param As Integer, eve As XGE_EVENT Ptr) As Integer
	Static As xui.Element Ptr ui
	Select Case msg
		Case XGE_MSG_FRAME				' frame Logic processing
			
		Case XGE_MSG_DRAW				' draw
			xge.Shape.RectFull(NULL, 0, 0, 800, 800, &HFFFFFFFF)
			ui->Draw()
			'UI_TileSet_TileEdit->imgEdit->Draw(NULL, 0, 0)
		Case XGE_MSG_MOUSE_MOVE			' mouse move
			
		Case XGE_MSG_MOUSE_DOWN			' mouse down
			
		Case XGE_MSG_MOUSE_UP			' mouse up
			
		Case XGE_MSG_MOUSE_CLICK		' mouse click
			
		Case XGE_MSG_MOUSE_DCLICK		' mouse double click
			
		Case XGE_MSG_MOUSE_WHELL		' mouse whell
			
		Case XGE_MSG_KEY_DOWN			' keyboard down
			
		Case XGE_MSG_KEY_UP				' keyboard up
			
		Case XGE_MSG_KEY_REPEAT			' keyboard hold
			
		Case XGE_MSG_GOTFOCUS			' got focus
			
		Case XGE_MSG_LOSTFOCUS			' lost focus
			
		Case XGE_MSG_MOUSE_ENTER		' mouse enter
			
		Case XGE_MSG_MOUSE_EXIT			' mouse leave
			
		Case XGE_MSG_LOADRES			' load resources
			ui = xui.GetRootElement()
			ui->LayoutMode = XUI_LAYOUT_L2R
			ui->Childs.AddElement(UI_Frame_Root)
			xui.LayoutApply()
		Case XGE_MSG_FREERES			' unload resources
			
		Case XGE_MSG_CLOSE				' window closing
			UI_Frame_Exit_OnClick(UI_Frame_Exit, 0)
	End Select
	Return 0
End Function
