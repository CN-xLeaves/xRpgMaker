


Sub InitUI_A11_TileSet(root As xui.Element Ptr)
	UI_TileSet_LayoutList = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 2, 1, XUI_LAYOUT_T2B, "UI_TileSet_LayoutList")
	UI_TileSet_LayoutInfo = xui.CreateFrame(XUI_LAYOUT_RULER_RATIO, 0, 0, 7, 1, XUI_LAYOUT_L2R, "图块集编辑", "UI_TileSet_LayoutInfo")
	UI_TileSet_LayoutList->Layout.RectBox.LeftOffset = 6
	UI_TileSet_LayoutList->Layout.RectBox.TopOffset = 6
	UI_TileSet_LayoutList->Layout.RectBox.BottomOffset = 6
	UI_TileSet_LayoutInfo->Layout.RectBox.LeftOffset = 6
	UI_TileSet_LayoutInfo->Layout.RectBox.RightOffset = 6
	UI_TileSet_LayoutInfo->Layout.RectBox.TopOffset = 6
	UI_TileSet_LayoutInfo->Layout.RectBox.BottomOffset = 6
	UI_TileSet_LayoutInfo->BackStyle.BorderColor = &HFF808080
	UI_TileSet_LayoutInfo->BackStyle.FillColor = &HFFD0D0D0
	root->Childs.AddElement(UI_TileSet_LayoutList)
	root->Childs.AddElement(UI_TileSet_LayoutInfo)
	' 左侧布局
	UI_TileSet_Title = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "图 块", &HFFFFFFFF, 2, "UI_TileSet_Title")
	UI_TileSet_Title->BackStyle.Hide = FALSE
	UI_TileSet_Title->BackStyle.BorderColor = &HFF606060
	UI_TileSet_Title->BackStyle.FillColor = &HFF606060
	UI_TileSet_Title->TextAlign = XGE_ALIGN_CENTER Or XGE_ALIGN_MIDDLE
	UI_TileSet_List = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 18, XUI_LAYOUT_COORD, "UI_TileSet_List")
	UI_TileSet_SetMax = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "更改最大值", "UI_TileSet_SetMax")
	UI_TileSet_LayoutList->Childs.AddElement(UI_TileSet_Title)
	UI_TileSet_LayoutList->Childs.AddElement(UI_TileSet_List)
	UI_TileSet_LayoutList->Childs.AddElement(UI_TileSet_SetMax)
	' 右侧布局
	UI_TileSet_Layout1 = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 4, 1, XUI_LAYOUT_T2B, "UI_TileSet_Layout1")
	UI_TileSet_Layout2 = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 7, 1, XUI_LAYOUT_T2B, "UI_TileSet_Layout2")
	UI_TileSet_Layout3 = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 3, 1, XUI_LAYOUT_T2B, "UI_TileSet_Layout3")
	UI_TileSet_Layout1->Layout.RectBox.TopOffset = 24
	UI_TileSet_Layout1->Layout.RectBox.LeftOffset = 6
	UI_TileSet_Layout1->Layout.RectBox.BottomOffset = 6
	UI_TileSet_Layout2->Layout.RectBox.TopOffset = 24
	UI_TileSet_Layout2->Layout.RectBox.LeftOffset = 6
	UI_TileSet_Layout2->Layout.RectBox.RightOffset = 6
	UI_TileSet_Layout2->Layout.RectBox.BottomOffset = 6
	UI_TileSet_Layout3->Layout.RectBox.TopOffset = 24
	UI_TileSet_Layout3->Layout.RectBox.RightOffset = 6
	UI_TileSet_Layout3->Layout.RectBox.BottomOffset = 6
	UI_TileSet_Layout2->DrawRange = TRUE
	UI_TileSet_LayoutInfo->Childs.AddElement(UI_TileSet_Layout1)
	UI_TileSet_LayoutInfo->Childs.AddElement(UI_TileSet_Layout2)
	UI_TileSet_LayoutInfo->Childs.AddElement(UI_TileSet_Layout3)
	' 图块集信息
	UI_TileSet_Name_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "名称：", &HFF000000, 1, "UI_TileSet_Name_Label")
	UI_TileSet_Name = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "草原", "UI_TileSet_Name")
	UI_TileSet_File_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "地图元件图像：", &HFF000000, 1, "UI_TileSet_Name_Label")
	UI_TileSet_File = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "001-Grassland01.png", "UI_TileSet_Name")
	UI_TileSet_AutoTile_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "自动元件图像：", &HFF000000, 1, "UI_TileSet_Name_Label")
	For i As Integer = 0 To 6
		UI_TileSet_AutoTile(i) = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "无", "UI_TileSet_AutoTile_" & i)
		UI_TileSet_AutoTile(i)->Layout.RectBox.BottomOffset = 2
	Next
	UI_TileSet_Back_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "全景图像：", &HFF000000, 1, "UI_TileSet_Back_Label")
	UI_TileSet_Back = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "无", "UI_TileSet_Back")
	UI_TileSet_Fog_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "雾图像：", &HFF000000, 1, "UI_TileSet_Fog_Label")
	UI_TileSet_Fog = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "无", "UI_TileSet_Fog")
	UI_TileSet_Battle_Label = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "战斗背景图像：", &HFF000000, 1, "UI_TileSet_Battle_Label")
	UI_TileSet_Battle = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "无", "UI_TileSet_Battle")
	UI_TileSet_Layout1_Space = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 2, XUI_LAYOUT_T2B, "UI_TileSet_Layout1_Space")
	UI_TileSet_File_Label->Layout.RectBox.TopOffset = 10
	UI_TileSet_AutoTile_Label->Layout.RectBox.TopOffset = 10
	UI_TileSet_Back_Label->Layout.RectBox.TopOffset = 8
	UI_TileSet_Fog_Label->Layout.RectBox.TopOffset = 10
	UI_TileSet_Battle_Label->Layout.RectBox.TopOffset = 10
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Name_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Name)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_File_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_File)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_AutoTile_Label)
	For i As Integer = 0 To 6
		UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_AutoTile(i))
	Next
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Back_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Back)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Fog_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Fog)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Battle_Label)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Battle)
	UI_TileSet_Layout1->Childs.AddElement(UI_TileSet_Layout1_Space)
	' 图块属性编辑
	
	' 图块属性编辑器选择
	UI_TileSet_EditMode1 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "通行 : 块", "UI_TileSet_EditMode1")
	UI_TileSet_EditMode2 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "通行 : 4方向", "UI_TileSet_EditMode2")
	UI_TileSet_EditMode3 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "优先级", "UI_TileSet_EditMode3")
	UI_TileSet_EditMode4 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "草木繁茂处", "UI_TileSet_EditMode4")
	UI_TileSet_EditMode5 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "柜台属性", "UI_TileSet_EditMode5")
	UI_TileSet_EditMode6 = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "地形标志", "UI_TileSet_EditMode6")
	UI_TileSet_Layout3_Space = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 12, XUI_LAYOUT_T2B, "UI_TileSet_Layout1_Space")
	UI_TileSet_EditMode2->Layout.RectBox.TopOffset = 6
	UI_TileSet_EditMode3->Layout.RectBox.TopOffset = 6
	UI_TileSet_EditMode4->Layout.RectBox.TopOffset = 6
	UI_TileSet_EditMode5->Layout.RectBox.TopOffset = 6
	UI_TileSet_EditMode6->Layout.RectBox.TopOffset = 6
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode1)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode2)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode3)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode4)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode5)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_EditMode6)
	UI_TileSet_Layout3->Childs.AddElement(UI_TileSet_Layout3_Space)
End Sub



' Scene function
Function A11_TileSet_Scene(msg As Integer, param As Integer, eve As XGE_EVENT Ptr) As Integer
	Static As xui.Element Ptr ui
	Select Case msg
		Case XGE_MSG_FRAME				' frame Logic processing
			
		Case XGE_MSG_DRAW				' draw
			xge.Shape.RectFull(NULL, 0, 0, 800, 800, &HFFFFFFFF)
			ui->Draw()
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
			Return -1
	End Select
End Function
