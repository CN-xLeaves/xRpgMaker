


Sub InitUI_A03_Skill(root As xui.Element Ptr)
	UI_Skill_LayoutList = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 6, 6, 2, 1, XUI_LAYOUT_T2B, "UI_TileSet_LayoutList")
	UI_Skill_LayoutInfo = xui.CreateFrame(XUI_LAYOUT_RULER_RATIO, 6, 6, 7, 1, XUI_LAYOUT_L2R, "技能编辑", "UI_TileSet_LayoutInfo")
	UI_Skill_LayoutList->Layout.RectBox.BottomOffset = 6
	UI_Skill_LayoutInfo->Layout.RectBox.RightOffset = 6
	UI_Skill_LayoutInfo->Layout.RectBox.BottomOffset = 6
	UI_Skill_LayoutInfo->BackStyle.BorderColor = &HFF808080
	UI_Skill_LayoutInfo->BackStyle.FillColor = &HFFD0D0D0
	root->Childs.AddElement(UI_Skill_LayoutList)
	root->Childs.AddElement(UI_Skill_LayoutInfo)
	' 左侧布局
	UI_Skill_Title = xui.CreateLabel(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "技 能", &HFFFFFFFF, 2, "UI_TileSet_Title")
	UI_Skill_Title->BackStyle.Hide = FALSE
	UI_Skill_Title->BackStyle.BorderColor = &HFF606060
	UI_Skill_Title->BackStyle.FillColor = &HFF606060
	UI_Skill_Title->TextAlign = XGE_ALIGN_CENTER Or XGE_ALIGN_MIDDLE
	UI_Skill_List = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 18, XUI_LAYOUT_COORD, "UI_TileSet_List")
	UI_Skill_SetMax = xui.CreateButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, "更改最大值", "UI_TileSet_SetMax")
	UI_Skill_LayoutList->Childs.AddElement(UI_Skill_Title)
	UI_Skill_LayoutList->Childs.AddElement(UI_Skill_List)
	UI_Skill_LayoutList->Childs.AddElement(UI_Skill_SetMax)
	
End Sub



' Scene function
Function A03_Skill_Scene(msg As Integer, param As Integer, eve As XGE_EVENT Ptr) As Integer
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
			UI_Frame_Exit_OnClick(UI_Frame_Exit, 0)
	End Select
	Return 0
End Function
