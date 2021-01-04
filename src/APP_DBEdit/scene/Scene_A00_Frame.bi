


Dim Shared BtnCaption(10) As String * 4 = {"角色", "职业", "技能", "物品", "武器", "防具", "敌人", "队伍", "状态", "图块", "系统"}
Dim Shared ScenesProc(10) As Any Ptr = {@A01_Player_Scene, @A02_Job_Scene, @A03_Skill_Scene, @A04_Goods_Scene, @A05_Weapon_Scene, @A06_Armor_Scene, @A07_Monster_Scene, @A08_Team_Scene, @A09_Buff_Scene, @A11_TileSet_Scene, @A13_System_Scene}



' 选项卡按钮点击事件
Sub UI_Frame_TabBtn_OnCheck(ele As xui.Button Ptr)
	' 处理页面的显示状态
	For i As Integer = 0 To 10
		UI_Frame_Page(i)->Visible = FALSE
	Next
	UI_Frame_Page(ele->TagInt)->Visible = TRUE
	' 切换场景
	xge.Scene.Cut(ScenesProc(ele->TagInt), 40)
End Sub

' 保存按钮点击
Sub UI_Frame_Save_OnClick(ele As xui.Button Ptr, btn As Integer)
	SaveTileData()
End Sub

' 退出按钮点击
Sub UI_Frame_Exit_OnClick(ele As xui.Button Ptr, btn As Integer)
	Dim iRet As Integer = MessageBox(xge.hWnd, "退出数据库编辑器将会丢失所有未保存的数据，退出前先保存数据库吗？", "xRpgMaker DataBase Edit", MB_ICONQUESTION Or MB_YESNOCANCEL)
	Select Case iRet
		Case IDYES						' 先保存再退出
			SaveTileData()
			xge.Scene.StopAll()
		Case IDNO						' 直接退出
			xge.Scene.StopAll()
		Case IDCANCEL					' 取消，啥也不干
			
	End Select
End Sub



Sub xRpgMaker_InitUI(DefaultPage As Integer)
	' 创建基础布局框架
	UI_Frame_Root = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, XUI_LAYOUT_T2B, "Frame_Root")
	UI_Frame_Layout_Tabs = xui.CreateElement(XUI_LAYOUT_RULER_PIXEL, 0, 0, 800,  24, XUI_LAYOUT_L2R, "Frame_Layout_Tabs")
	UI_Frame_Layout_Page = xui.CreateElement(XUI_LAYOUT_RULER_PIXEL, 0, 0, 800, 536, XUI_LAYOUT_L2R, "Frame_Layout_Page")
	UI_Frame_Layout_Btns = xui.CreateFrame(XUI_LAYOUT_RULER_PIXEL, 0, 0, 800,  40, XUI_LAYOUT_L2R, "", "Frame_Layout_Btns")
	UI_Frame_Layout_Btns->BackStyle.BorderColor = &HFFC0C0C0
	UI_Frame_Layout_Btns->BackStyle.FillColor = &HFFC0C0C0
	UI_Frame_Root->Childs.AddElement(UI_Frame_Layout_Tabs)
	UI_Frame_Root->Childs.AddElement(UI_Frame_Layout_Page)
	UI_Frame_Root->Childs.AddElement(UI_Frame_Layout_Btns)
	' 创建选项卡按钮
	For i As Integer = 0 To 10
		UI_Frame_TabBtn(i) = xui.CreateRadioButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, BtnCaption(i), "Frame_TabBtn_" & BtnCaption(i))
		UI_Frame_TabBtn(i)->TagInt = i
		UI_Frame_TabBtn(i)->Event.OnCheck = Cast(Any Ptr, @UI_Frame_TabBtn_OnCheck)
		UI_Frame_Layout_Tabs->Childs.AddElement(UI_Frame_TabBtn(i))
	Next
	UI_Frame_TabBtn(DefaultPage)->Checked = TRUE
	' 创建选项卡页面
	For i As Integer = 0 To 10
		UI_Frame_Page(i) = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, XUI_LAYOUT_L2R, "Frame_Page_" & BtnCaption(i))
		UI_Frame_Page(i)->Visible = FALSE
		UI_Frame_Layout_Page->Childs.AddElement(UI_Frame_Page(i))
	Next
	UI_Frame_Page(DefaultPage)->Visible = TRUE
	' 创建保存和退出按钮
	UI_Frame_Save = xui.CreateButton(XUI_LAYOUT_RULER_PIXEL, 624, 8, 80, 24, "保 存", "Frame_Save")
	UI_Frame_Exit = xui.CreateButton(XUI_LAYOUT_RULER_PIXEL, 8, 8, 80, 24, "退 出", "Frame_Exit")
	UI_Frame_Save->Event.OnClick = Cast(Any Ptr, @UI_Frame_Save_OnClick)
	UI_Frame_Exit->Event.OnClick = Cast(Any Ptr, @UI_Frame_Exit_OnClick)
	UI_Frame_Layout_Btns->Childs.AddElement(UI_Frame_Save)
	UI_Frame_Layout_Btns->Childs.AddElement(UI_Frame_Exit)
	' 初始化子页面UI
	InitUI_A01_Player(UI_Frame_Page(0))
	InitUI_A02_Job(UI_Frame_Page(1))
	InitUI_A03_Skill(UI_Frame_Page(2))
	InitUI_A04_Goods(UI_Frame_Page(3))
	InitUI_A05_Weapon(UI_Frame_Page(4))
	InitUI_A06_Armor(UI_Frame_Page(5))
	InitUI_A07_Monster(UI_Frame_Page(6))
	InitUI_A08_Team(UI_Frame_Page(7))
	InitUI_A09_Buff(UI_Frame_Page(8))
	InitUI_A11_TileSet(UI_Frame_Page(9))
	InitUI_A13_System(UI_Frame_Page(10))
End Sub
