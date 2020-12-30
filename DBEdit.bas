' include XGE header file
#LibPath "lib"
#Include "src\sdk\xge.bi"



' Import SDK [develop good classification habits]
#Include "src\SDK\xui_Element\xge_xui_Static.bi"
#Include "src\SDK\xui_Element\xge_xui_ScrollBar.bi"



' Import global define [develop good classification habits]
#Include "src\APP_DBEdit\global\Define.bi"



' Import object class [develop good classification habits]
#Include "src\app\class\Class_Tile.bi"



' Import scene [develop good classification habits]
#Include "src\APP_DBEdit\scene\Scene_A01_Player.bi"
#Include "src\APP_DBEdit\scene\Scene_A02_Job.bi"
#Include "src\APP_DBEdit\scene\Scene_A03_Skill.bi"
#Include "src\APP_DBEdit\scene\Scene_A04_Goods.bi"
#Include "src\APP_DBEdit\scene\Scene_A05_Weapon.bi"
#Include "src\APP_DBEdit\scene\Scene_A06_Armor.bi"
#Include "src\APP_DBEdit\scene\Scene_A07_Monster.bi"
#Include "src\APP_DBEdit\scene\Scene_A08_Team.bi"
#Include "src\APP_DBEdit\scene\Scene_A09_Buff.bi"
#Include "src\APP_DBEdit\scene\Scene_A11_TileSet.bi"
#Include "src\APP_DBEdit\scene\Scene_A13_System.bi"

' 不是场景，用于管理上面的场景
#Include "src\APP_DBEdit\scene\Scene_A00_Frame.bi"



' Import Game Controller
#Include "src\APP_DBEdit\Control.bi"



' Application Entry Point
AppInit()
AppUint()
