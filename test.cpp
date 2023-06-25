#define DX_GCC_COMPILE
#define DX_COMPILE_TYPE_C_LANGUAGE

#include "DxLibMake/DxLib.h"

// プログラムは WinMain から始まります
int WINAPI WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow )
{
	if( DxLib_Init() == -1 )		// ＤＸライブラリ初期化処理
	{
		return -1 ;			// エラーが起きたら直ちに終了
	}

	DrawPixel( 320 , 240 , GetColor( 255,255,255 ) ) ;	// 点を打つ

	WaitKey() ;				// キー入力待ち

	DxLib_End() ;				// ＤＸライブラリ使用の終了処理

	return 0 ;				// ソフトの終了 
}