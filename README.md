# DxLib.dll

DXライブラリのDLL版(非公式)です。

## 使用方法

**DXライブラリのヘッダファイルは依然として必要です**。

- DX_COMPILE_TYPE_C_LANGUAGE をコンパイラのオプションで定義させるか、`<DxLib.h>` のインクルード前に定義してください。
- [Releases](https://github.com/777shuang/DxLib.dll/releases) の zip ファイルをダウンロードし、解凍して得られる DLL ファイル郡を作業ディレクトリにコピーし、`DxLib-*.dll` をコンパイル時にリンクしてください。

## ビルド方法

MSYS2が必要です。

### 必要なパッケージ

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

### DLLの作成

- `$ git clone https://github.com/777shuang/DxLib.dll --recursive`
- `$ cd DxLib.dll`
- `$ make init`
- `$ make`