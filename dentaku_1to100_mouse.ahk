#NoEnv
SetBatchLines, -1
ListLines, Off
SendMode, Input
SetKeyDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SetControlDelay, -1
SetDefaultMouseSpeed, 0
;--- ここより上はauto hot key を早くするための記載です。AutoHotKey wiki を参考にしています。
TARGET_WORD = 電卓          ;--- 「電卓」という文字列でひっかけています
IfWinNotExist,%TARGET_WORD% ;--- 起動しているかどうか
{
	ExitApp ; 起動していない場合は終了
}
WinGet, TARGET_ahk_id,, %TARGET_WORD% ;--- WinActivate用にIDを取得
WinActivate , ahk_id %TARGET_ahk_id%  ;--- ウィンドウをアクティブにする
sleep,100

;--- それぞれの座標を指定
dx := 539-450
dy := 583-540
x0 := 447
y0 := 627
x1 := 450
y1 := 583
x2 := 450 + dx
y2 := 583
x3 := 450 + dx*2
y3 := 583
x4 := 450
y4 := 583 - dy
x5 := 450 + dx
y5 := 583 - dy
x6 := 450 + dx*2
y6 := 583 - dy
x7 := 450
y7 := 583 - dy*2
x8 := 450 + dx
y8 := 583 - dy*2
x9 := 450 + dx*2
y9 := 583 - dy*2

;--- マウスクリックでアクティブに
MouseClick, left, 308, 422

;====================================================
; ここでアクティブになるので計測開始のタイミングです
;====================================================

Loop , 99
{
	n1 := A_Index // 10
	n2 := Mod( A_Index , 10 )
	if( n1 != 0 ){
		MouseClick, left, x%n1%, y%n1%	;--- 10の位をクリック
	}
	MouseClick, left, x%n2%, y%n2%	;---1の位をクリック
	MouseClick, left, 708, 627	;--- + をクリック
}
;--- 100をおしてENTER
MouseClick, left, x1, y1
MouseClick, left, x0, y0
MouseClick, left, x0, y0
MouseClick, left, 618, 627	;--- ENTER


















