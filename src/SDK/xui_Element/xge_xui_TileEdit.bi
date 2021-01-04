


' 图块编辑器类 - 重绘
Sub UI_TileSet_TileEdit_OnDrawView(ele As xui.TileEdit Ptr, px As Integer, py As Integer, x As Integer, y As Integer, w As Integer, h As Integer)
	ele->imgEdit->DrawEx(ele->DrawBuffer, px, py, x, y, w, h)
End Sub



Namespace xui
	
	
	
	' 使用图块集数据指针
	Sub TileEdit.UseTileSet(ts As xRpgMaker_TileSet Ptr)
		TileSet = ts
		TileSetImage->Load(G_Path_Tilesets & ts->TileSetFile)
		imgEdit->Create(TileSetImage->Width, TileSetImage->Height + 32)
		TileSetImage->Draw(imgEdit, 0, 32)
		SetViewSize(TileSetImage->Width, TileSetImage->Height + 32)
	End Sub
	
	
	
	' 创建图块编辑器元素
	Function CreateTileEdit(iLayoutRuler As Integer = XUI_LAYOUT_RULER_PIXEL, x As Integer = 0, y As Integer = 0, w As Integer = 200, h As Integer = 200, vw As Integer = 200, vh As Integer = 200, sIdentifier As ZString Ptr = NULL) As xui.TileEdit Ptr
		Dim ele As xui.TileEdit Ptr = New xui.TileEdit()
		' 基础属性赋值
		ele->InitElement(iLayoutRuler, x, y, w, h, XUI_LAYOUT_COORD, sIdentifier)
		ele->View.w = vw
		ele->View.h = vh
		' 自定义属性赋值
		ele->EditMode = 0
		ele->TileSet = NULL
		' 创建图像
		ele->TileSetImage = New xge.Surface()
		ele->imgEdit = New xge.Surface()
		For i As Integer = 0 To 14
			ele->AutoTileImage(i) = New xge.Surface()
		Next
		' 设置类参数
		ele->ViewEvent.OnDrawView = Cast(Any Ptr, @UI_TileSet_TileEdit_OnDrawView)
		Return ele
	End Function
	
	
	
End Namespace
