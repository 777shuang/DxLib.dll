# DxLib.dll
MSYS2上で、DXライブラリのDLLを作成するためのスクリプトです。以下のパッケージをインストールする必要があります。
- `make`
- `wget`
- `git`
- `mingw-w64-x86_64-7zip`
- `mingw-w64-x86_64-gcc`
- `mingw-w64-x86_64-bullet`
- `mingw-w64-x86_64-libpng`
- `mingw-w64-x86_64-zlib`
- `mingw-w64-x86_64-libjpeg-turbo`
- `mingw-w64-x86_64-libtiff`
- `mingw-w64-x86_64-libogg`
- `mingw-w64-x86_64-libvorbis`
- `mingw-w64-x86_64-libtheora`
- `mingw-w64-x86_64-opus`
- `mingw-w64-x86_64-opusfile`

## ビルド方法
- `$ git clone https://github.com/777shuang/DxLib.dll --recursive`
- `$ cd DxLib.dll`
- `$ make init`
- `$ make`

## 使用時
- DX_COMPILE_TYPE_C_LANGUAGE をコンパイラのオプションで定義させるか、`<DxLib.h>` のインクルード前に定義してください。
- Releases の zip ファイルをダウンロードし、解凍して得られる DLL ファイル郡を作業ディレクトリにコピーし、`DxLib-*.dll` をコンパイル時にリンクしてください。

## ライセンス
独自部分のみMIT Licenseが適用されます。test.cppはDXライブラリのサイトから拾ってきたものなので適用されません。
