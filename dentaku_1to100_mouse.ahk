#NoEnv
SetBatchLines, -1
ListLines, Off
SendMode, Input
SetKeyDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SetControlDelay, -1
SetDefaultMouseSpeed, 0
;--- ���������auto hot key �𑁂����邽�߂̋L�ڂł��BAutoHotKey wiki ���Q�l�ɂ��Ă��܂��B
TARGET_WORD = �d��          ;--- �u�d��v�Ƃ���������łЂ������Ă��܂�
IfWinNotExist,%TARGET_WORD% ;--- �N�����Ă��邩�ǂ���
{
	ExitApp ; �N�����Ă��Ȃ��ꍇ�͏I��
}
WinGet, TARGET_ahk_id,, %TARGET_WORD% ;--- WinActivate�p��ID���擾
WinActivate , ahk_id %TARGET_ahk_id%  ;--- �E�B���h�E���A�N�e�B�u�ɂ���
sleep,100

;--- ���ꂼ��̍��W���w��
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

;--- �}�E�X�N���b�N�ŃA�N�e�B�u��
MouseClick, left, 308, 422

;====================================================
; �����ŃA�N�e�B�u�ɂȂ�̂Ōv���J�n�̃^�C�~���O�ł�
;====================================================

Loop , 99
{
	n1 := A_Index // 10
	n2 := Mod( A_Index , 10 )
	if( n1 != 0 ){
		MouseClick, left, x%n1%, y%n1%	;--- 10�̈ʂ��N���b�N
	}
	MouseClick, left, x%n2%, y%n2%	;---1�̈ʂ��N���b�N
	MouseClick, left, 708, 627	;--- + ���N���b�N
}
;--- 100��������ENTER
MouseClick, left, x1, y1
MouseClick, left, x0, y0
MouseClick, left, x0, y0
MouseClick, left, 618, 627	;--- ENTER


















