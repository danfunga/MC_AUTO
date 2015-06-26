; directory to search for images
SearchDir =Image\¬Ã¿€\Monster\out\1_«ÿ««

Gui, +Resize
Gui, Add, ListView, vLvFiles h500 w800 x0 y0 +LV0x2 ,ID|image|thumb|path

GuiControl, -Redraw,LvFiles
Loop,%SearchDir%\*.*
  {

    if A_LoopFileExt not contains jpg,bmp,png,gif,jpeg,tiff
      continue
    
    img:=ILA_AddImageFile(A_LoopFileFullPath)
    Row := LV_Add("Icon999999",A_Index,A_LoopFileName,A_LoopFileDir)
     
     LVA_SetSubItemImage("LvFiles", Row, 3, img)
   }

LV_ModifyCol() LV_ModifyCol(1,0)
GuiControl, +Redraw,LvFiles
Gui, Show,
return
;taken from LVA.ahk by Dadepp with minor bug fix
;http://www.autohotkey.com/forum/viewtopic.php?t=43242
LVA_SetSubItemImage(LVvar, Row, Col, iNum){
  GuiControlGet, hLV, Hwnd, %LVvar%
  VarSetCapacity(LVItem, 60, 0)
  Row := (Row < 1) ? 1 : Row
  Col := (Col < 1) ? 1 : Col
  NumPut(2, LVItem, 0)
  NumPut(Row-1, LVItem, 4)
  NumPut(Col-1, LVItem, 8)
  NumPut(iNum-1, LVItem, 28)  ; <<<<< won't work with AHK U64 !!!!!
  SendMessage, 4102, 0, &LVItem,, ahk_id %hLV%
}
;~ ;taken from LVA.ahk by Dadepp with minor bug fix
;~ ;http://www.autohotkey.com/forum/viewtopic.php?t=43242
;~ LVA_SetSubItemImage(LVvar, Row, Col, iNum){
  ;~ Static LVM_SETITEM := A_IsUnicode ? 0x104C : 0x1006 ; LVM_SETITEMW : LVM_SETITEMA
  ;~ Static LVITEMSize := 48 + (A_PtrSize * 3)
  ;~ Static OffImage := 20 + (A_PtrSize * 2)
  ;~ GuiControlGet, hLV, Hwnd, %LVvar%
  ;~ VarSetCapacity(LVItem, LVITEMSize, 0)
  ;~ Row := (Row < 1) ? 1 : Row
  ;~ Col := (Col < 1) ? 1 : Col
  ;~ NumPut(2, LVItem, 0, "UInt")
  ;~ NumPut(Row-1, LVItem, 4, "Int")
  ;~ NumPut(Col-1, LVItem, 8, "Int")
  ;~ NumPut(iNum-1, LVItem, OffImage, "Int")
  ;~ SendMessage, % LVM_SETITEM, 0, &LVItem,, ahk_id %hLV%
;~ }

; ILA requires GDI
; Thanks to tic (Tariq Porter) for his GDI+ Library
; http://www.autohotkey.com/forum/viewtopic.php?t=32238
#Include Gdip.ahk

; idea for this function taken from post by Looq 
; http://www.autohotkey.com/board/topic/62448-large-jpgpnggif-images-inside-a-listview/?hl=%2Blarge+%2Bicon
ILA_AddImageFile(ImageFile, wsize=0, hsize=0, IconType=1){
  static hIL, w, h
  If FileExist(ImageFile){
    pToken := Gdip_Startup()

    pBitmap := Gdip_CreateBitmapFromFile(ImageFile)
    Gdip_GetDimensions(pBitmap, Width, Height)
    
    If (!w And !h)            ;on first call
      If (!wsize And !hsize)      ;first image defines icon size
        w := Width , h := Height
      Else if (!wsize)            ;scale to hsize
        h := hsize , w := (Width * h) // Height
      Else if (!hsize)            ;scale to wsize
        w := wsize , h := (Height * w) // Width
    
    If !hIL{                  ;on first call
      hIL := ImageList_Create(w, h, 0x20, 255, 10)    ; all bitmaps need to be "wxh"
      LV_SetImageList(hIL,IconType)
    } 

    If (w = Width and h = Height)         ;no resize is needed
        hBitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)    
    Else{                                 ;image needs to be resized
        pBitmapResized := Gdip_CreateBitmap(w, h)   
        G := Gdip_GraphicsFromImage(pBitmapResized)
        rw := w / Width , rh := h / Height
        r := (rw < rh) ? rw : rh
        Gdip_DrawImage(G, pBitmap, (w - Width * r)//2, (h - Height * r)//2, Floor(Width * r), Floor(Height * r))
        hBitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmapResized)
        Gdip_DeleteGraphics(G)
        Gdip_DisposeImage(pBitmapResized)
    }
    img := ImageList_Add(hIL, hBitmap) + 1    ; "+1" to have a 1 based list 
    Gdip_DisposeImage(pBitmap)
    DeleteObject(hBitmap)
    Gdip_Shutdown(pToken)
    return img
  }
}
ImageList_Create(cx,cy,flags,cInitial,cGrow){
   return DllCall("comctl32.dll\ImageList_Create", "int", cx, "int", cy, "uint", flags, "int", cInitial, "int", cGrow)
}
ImageList_Add(hIml, hbmImage, hbmMask=""){
   return DllCall("comctl32.dll\ImageList_Add", "Ptr", hIml, "Ptr",hbmImage, "Ptr", hbmMask)
}

GuiSize:
  GuiControl, MoveDraw, LvFiles,w%a_guiwidth%-20 h%a_guiheight%
return
F12:: 
{
	WinActivate ListView.ahk
	Send, ^s  
	Reload
	return
}
Esc::
GuiEscape:
GuiClose:
  ExitApp
Return