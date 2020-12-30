'==================================================================================
	'★ 游戏流程控制器
	'#-------------------------------------------------------------------------------
	'# 功能 : 负责控制游戏流程和场景切换 , 游戏的第一个场景在这里启动
	'# 说明 : 
'==================================================================================



' 加载全局资源
Function LoadRes() As Integer
	xge.Text.LoadFont(ExePath & "\ToolRes\simsun_12px_gb2312.xrf", 0)
	xge.Text.LoadFont(ExePath & "\ToolRes\simsun_16px_gb2312.xrf", 0)
	xRpgMaker_InitUI(9)
	Return -1
End Function



' 释放全局资源
Sub FreeRes()
	xge.Text.RemoveFont(2)
	xge.Text.RemoveFont(1)
End Sub



' 初始化应用
Function AppInit() As Integer
	' 初始化XGE游戏引擎
	If xge.Init(800, 600, XGE_INIT_WINDOW Or XGE_INIT_ALPHA, XGE_INIT_ALL, "xRpgMaker DataBase Edit") = FALSE Then
		MessageBox(0, "xywh Game Engine 初始化失败！", "xTank", MB_ICONERROR)
		Return 0
	EndIf
	' 加载游戏资源
	If LoadRes() = FALSE Then
		MessageBox(0, "游戏资源加载失败，请确保游戏客户端完整！", "xRpgMaker DataBase Edit", MB_ICONERROR)
		Return 0
	EndIf
	xge.Scene.Cut(@A11_TileSet_Scene, 20)
End Function



' 释放应用资源
Sub AppUint()
	xge.Unit()
End Sub
