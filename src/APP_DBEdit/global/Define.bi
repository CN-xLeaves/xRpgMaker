


' 结构体数据文件头 [20Byte]
Type xRpgMaker_StructDB_Info
	HeadText As UInteger									' 文件头 [ &H01626473 = sdb1；1表示版本号 ]
	DataType As UInteger									' 数据类型 [避免载入错误的数据引起崩溃]
	ItemCount As UInteger									' 数据数量
	ItemSize As UInteger									' 数据大小
	Reserved As UInteger									' 保留的，暂时没有用到
End Type

#Define XRM_SDB_FILEHEAD			&H01626473				' xrmsdb 格式文件头验证信息

#Define XRM_SDB_TYPE_TILESET		1						' 图块集数据



' 全局路径
Dim Shared G_Path_Data As ZString * MAX_PATH
Dim Shared G_Path_Tilesets As ZString * MAX_PATH



' 图块编辑器元素相关定义
Namespace xui
	
	' 图块编辑器元素类
	Type TileEdit Extends xui.ScrollView
		EditMode As Integer							' 编辑模式 [0=块通行、1=8方向通行、2=优先级、3=草木繁茂处、4=地形标志]
		
		TileSet As xRpgMaker_TileSet Ptr			' 图块集
		
		TileSetImage As xge.Surface Ptr				' 图块集图像 [原图]
		AutoTileImage(14) As xge.Surface Ptr			' 自动元件图块
		
		imgEdit As xge.Surface Ptr					' 编辑模式下的图像 [渲染用这个]
		
		' 使用图块集数据
		Declare Sub UseTileSet(ts As xRpgMaker_TileSet Ptr)
		
		' 重建编辑模式图像
		Declare Sub ReBuildEditImage()
		
	End Type
	
End Namespace



' 框架布局元素
Dim Shared As xui.Element Ptr UI_Frame_Root, UI_Frame_Layout_Tabs, UI_Frame_Layout_Page
Dim Shared As xui.Frame Ptr UI_Frame_Layout_Btns
Dim Shared As xui.Button Ptr UI_Frame_TabBtn(10)
Dim Shared As xui.Element Ptr UI_Frame_Page(10)
Dim Shared As xui.Button Ptr UI_Frame_Save, UI_Frame_Exit



' 角色界面布局元素
Dim Shared As xui.Element Ptr UI_Player_LayoutList
Dim Shared As xui.Frame Ptr UI_Player_LayoutInfo

Dim Shared As xui.Label Ptr UI_Player_Title
Dim Shared As xui.Element Ptr UI_Player_List
Dim Shared As xui.Button Ptr UI_Player_SetMax



' 职业界面布局元素
Dim Shared As xui.Element Ptr UI_Job_LayoutList
Dim Shared As xui.Frame Ptr UI_Job_LayoutInfo

Dim Shared As xui.Label Ptr UI_Job_Title
Dim Shared As xui.Element Ptr UI_Job_List
Dim Shared As xui.Button Ptr UI_Job_SetMax



' 技能界面布局元素
Dim Shared As xui.Element Ptr UI_Skill_LayoutList
Dim Shared As xui.Frame Ptr UI_Skill_LayoutInfo

Dim Shared As xui.Label Ptr UI_Skill_Title
Dim Shared As xui.Element Ptr UI_Skill_List
Dim Shared As xui.Button Ptr UI_Skill_SetMax



' 物品界面布局元素
Dim Shared As xui.Element Ptr UI_Goods_LayoutList
Dim Shared As xui.Frame Ptr UI_Goods_LayoutInfo

Dim Shared As xui.Label Ptr UI_Goods_Title
Dim Shared As xui.Element Ptr UI_Goods_List
Dim Shared As xui.Button Ptr UI_Goods_SetMax



' 武器界面布局元素
Dim Shared As xui.Element Ptr UI_Weapon_LayoutList
Dim Shared As xui.Frame Ptr UI_Weapon_LayoutInfo

Dim Shared As xui.Label Ptr UI_Weapon_Title
Dim Shared As xui.Element Ptr UI_Weapon_List
Dim Shared As xui.Button Ptr UI_Weapon_SetMax



' 防具界面布局元素
Dim Shared As xui.Element Ptr UI_Armor_LayoutList
Dim Shared As xui.Frame Ptr UI_Armor_LayoutInfo

Dim Shared As xui.Label Ptr UI_Armor_Title
Dim Shared As xui.Element Ptr UI_Armor_List
Dim Shared As xui.Button Ptr UI_Armor_SetMax



' 怪物界面布局元素
Dim Shared As xui.Element Ptr UI_Monster_LayoutList
Dim Shared As xui.Frame Ptr UI_Monster_LayoutInfo

Dim Shared As xui.Label Ptr UI_Monster_Title
Dim Shared As xui.Element Ptr UI_Monster_List
Dim Shared As xui.Button Ptr UI_Monster_SetMax



' 团队界面布局元素
Dim Shared As xui.Element Ptr UI_Team_LayoutList
Dim Shared As xui.Frame Ptr UI_Team_LayoutInfo

Dim Shared As xui.Label Ptr UI_Team_Title
Dim Shared As xui.Element Ptr UI_Team_List
Dim Shared As xui.Button Ptr UI_Team_SetMax



' 状态界面布局元素
Dim Shared As xui.Element Ptr UI_Buff_LayoutList
Dim Shared As xui.Frame Ptr UI_Buff_LayoutInfo

Dim Shared As xui.Label Ptr UI_Buff_Title
Dim Shared As xui.Element Ptr UI_Buff_List
Dim Shared As xui.Button Ptr UI_Buff_SetMax



' 图块界面布局元素
Dim Shared As xui.Element Ptr UI_TileSet_LayoutList, UI_TileSet_Layout1, UI_TileSet_Layout2, UI_TileSet_Layout3
Dim Shared As xui.Frame Ptr UI_TileSet_LayoutInfo

Dim Shared As xui.Label Ptr UI_TileSet_Title
Dim Shared As xui.ListBox Ptr UI_TileSet_List
Dim Shared As xui.Button Ptr UI_TileSet_SetMax

Dim Shared As xui.Label Ptr UI_TileSet_Name_Label, UI_TileSet_File_Label, UI_TileSet_AutoTile_Label, UI_TileSet_Back_Label, UI_TileSet_Fog_Label, UI_TileSet_Battle_Label
Dim Shared As xui.Button Ptr UI_TileSet_Name, UI_TileSet_File, UI_TileSet_AutoTile(6), UI_TileSet_Back, UI_TileSet_Fog, UI_TileSet_Battle
Dim Shared As xui.Element Ptr UI_TileSet_Layout1_Space

Dim Shared As xui.TileEdit Ptr UI_TileSet_TileEdit

Dim Shared As xui.Button Ptr UI_TileSet_EditMode1, UI_TileSet_EditMode2, UI_TileSet_EditMode3, UI_TileSet_EditMode4, UI_TileSet_EditMode5, UI_TileSet_EditMode6
Dim Shared As xui.Element Ptr UI_TileSet_Layout3_Space



' 系统界面布局元素




' 函数声明
Declare Sub UI_Frame_Exit_OnClick(ele As xui.Button Ptr, btn As Integer)


