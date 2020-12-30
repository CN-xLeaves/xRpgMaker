


' 标签类 - 绘图
Sub xui_class_Label_OnDraw(ele As xui.Label Ptr)
	If ele->BackStyle.Hide = FALSE Then
		If ele->BackStyle.Image Then
			ele->BackStyle.Image->Draw(ele->Image, 0, 0)
		Else
			xge.shape.Rect(ele->Image, 0, 0, ele->Layout.Rect.w - 1, ele->Layout.Rect.h - 1, ele->BackStyle.BorderColor)
			xge.shape.RectFull(ele->Image, 1, 1, ele->Layout.Rect.w - 2, ele->Layout.Rect.h - 2, ele->BackStyle.FillColor)
		EndIf
	EndIf
	xge.Text.DrawRectA(ele->Image, ele->TextOffset.x, ele->TextOffset.y, ele->Layout.Rect.w - 1, ele->Layout.Rect.h - 1, ele->Text, ele->TextColor, ele->TextFont, 0, ele->TextAlign, ele->LineSpace, ele->WordSpace)
End Sub

' 容器类 - 绘图
Sub xui_class_Frame_OnDraw(ele As xui.Frame Ptr)
	Dim WordHeight As Integer = xge.Text.GetFontSize(ele->TextFont)
	If ele->BackStyle.Hide = FALSE Then
		If ele->BackStyle.Image Then
			ele->BackStyle.Image->Draw(ele->Image, 0, 0)
		Else
			If (ele->Text = NULL) Or (*ele->Text = "") Then
				xge.shape.Rect(ele->Image, 0, 0, ele->Layout.Rect.w - 1, ele->Layout.Rect.h - 1, ele->BackStyle.BorderColor)
				xge.shape.RectFull(ele->Image, 1, 1, ele->Layout.Rect.w - 2, ele->Layout.Rect.h - 2, ele->BackStyle.FillColor)
			Else
				xge.shape.Rect(ele->Image, 0, 0, ele->Layout.Rect.w - 1, ele->Layout.Rect.h - 1, ele->BackStyle.BorderColor)
				xge.shape.RectFull(ele->Image, 1, 1, ele->Layout.Rect.w - 2, WordHeight + 5, ele->BackStyle.BorderColor)
				xge.shape.RectFull(ele->Image, 1, WordHeight + 6, ele->Layout.Rect.w - 2, ele->Layout.Rect.h - 2, ele->BackStyle.FillColor)
				xge.Text.DrawRectA(ele->Image, 0, 0, ele->Layout.Rect.w - 1, WordHeight + 6, ele->Text, ele->TextColor, ele->TextFont, 0, XGE_ALIGN_CENTER Or XGE_ALIGN_MIDDLE)
			EndIf
		EndIf
	EndIf
End Sub



Extern XGE_EXTERNCLASS



Namespace xui
	
	
	
	' 创建标签
	Function CreateLabel(iLayoutRuler As Integer = XUI_LAYOUT_RULER_PIXEL, x As Integer = 0, y As Integer = 0, w As Integer = 80, h As Integer = 24, sCaption As ZString Ptr, TextColor As UInteger = &HFFFFFFFF, TextFont As UInteger = 1, sIdentifier As ZString Ptr = NULL) As xui.Label Ptr
		Dim ele As xui.Label Ptr = New xui.Label()
		' 基础属性赋值
		ele->ClassID = XUI_CLASS_STATIC
		ele->Layout.Ruler = iLayoutRuler
		ele->Layout.w = w
		ele->Layout.h = h
		If iLayoutRuler = XUI_LAYOUT_RULER_PIXEL Then
			ele->Layout.Rect.x = x
			ele->Layout.Rect.y = y
			ele->Layout.Rect.w = w
			ele->Layout.Rect.h = h
		EndIf
		ele->LayoutMode = XUI_LAYOUT_COORD
		If sIdentifier Then
			strncpy(@ele->Identifier, sIdentifier, 31)
			ele->Identifier[31] = 0
		EndIf
		' 自定义属性赋值
		ele->Text = sCaption
		ele->TextOffset.x = 0
		ele->TextOffset.y = 0
		ele->TextColor = TextColor
		ele->TextFont = TextFont
		ele->TextAlign = XGE_ALIGN_LEFT Or XGE_ALIGN_MIDDLE
		ele->LineSpace = 0
		ele->WordSpace = 0
		ele->BackStyle.Hide = TRUE
		ele->BackStyle.Image = NULL
		' 设置类参数
		ele->ClassEvent.OnDraw = Cast(Any Ptr, @xui_class_Label_OnDraw)
		Return ele
	End Function
	
	' 创建容器
	Function CreateFrame(iLayoutRuler As Integer = XUI_LAYOUT_RULER_PIXEL, x As Integer = 0, y As Integer = 0, w As Integer = 80, h As Integer = 24, iLayoutMode As Integer = XUI_LAYOUT_COORD, sCaption As ZString Ptr = NULL, sIdentifier As ZString Ptr = NULL) As xui.Frame Ptr
		Dim ele As xui.Frame Ptr = New xui.Frame()
		' 基础属性赋值
		ele->ClassID = XUI_CLASS_STATIC
		ele->Layout.Ruler = iLayoutRuler
		ele->Layout.w = w
		ele->Layout.h = h
		If iLayoutRuler = XUI_LAYOUT_RULER_PIXEL Then
			ele->Layout.Rect.x = x
			ele->Layout.Rect.y = y
			ele->Layout.Rect.w = w
			ele->Layout.Rect.h = h
		EndIf
		ele->LayoutMode = iLayoutMode
		If sIdentifier Then
			strncpy(@ele->Identifier, sIdentifier, 31)
			ele->Identifier[31] = 0
		EndIf
		' 自定义属性赋值
		ele->Text = sCaption
		ele->TextColor = &HFFFFFFFF
		ele->TextFont = 1
		ele->BackStyle.Hide = FALSE
		ele->BackStyle.Image = NULL
		ele->BackStyle.BorderColor = &HFF0A8ED8
		ele->BackStyle.FillColor = &HFF1CB2FA
		' 设置类参数
		ele->ClassEvent.OnDraw = Cast(Any Ptr, @xui_class_Frame_OnDraw)
		Return ele
	End Function
	
	
	
End Namespace



End Extern


