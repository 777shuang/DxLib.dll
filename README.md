# DxLib.dll

DXライブラリのDLL版（非公式）です。

## 使用方法

**DXライブラリのヘッダファイルは依然として必要です。**

- コンパイラオプションで DX_COMPILE_TYPE_C_LANGUAGE を定義するか、DxLib.h のインクルード前に定義してください。
- Releases の ZIP をダウンロードし、同梱 DLL を実行ファイルのあるディレクトリに配置してください。
- DxLib-*.dll をリンクしてください。配布物には DxLib 本体だけでなく、vcpkg 由来の実行時依存 DLL も含めます。

## ビルド方法

MSYS2 は不要です。xmake、vcpkg、および x64 MinGW-w64 GCC ツールチェーンを使用します。依存ライブラリは vcpkg.json で管理し、xmake が vcpkg との連携を通じて取得・リンクします。

### 必要なもの

- Git
- xmake（https://xmake.io/）
- vcpkg（https://github.com/microsoft/vcpkg）。VCPKG_ROOT を設定し、vcpkg を PATH に追加してください。
- MSYS2 に依存しない x64 MinGW-w64 GCC ツールチェーン。x86_64-w64-mingw32-g++ が PATH から実行できる必要があります。

### Windows (PowerShell)

    git clone https://github.com/777shuang/DxLib.dll.git --recursive
    cd DxLib.dll

    # vcpkg はリポジトリ外のディレクトリにインストールする
    git clone https://github.com/microsoft/vcpkg.git "$env:USERPROFILE\vcpkg"
    & "$env:USERPROFILE\vcpkg\bootstrap-vcpkg.bat" -disableMetrics

    $env:VCPKG_ROOT = "$env:USERPROFILE\vcpkg"
    $env:PATH = "$env:VCPKG_ROOT;$env:PATH"
    $env:VCPKG_DEFAULT_TRIPLET = "x64-mingw-dynamic"
    $env:VCPKG_DEFAULT_HOST_TRIPLET = "x64-windows"

    xmake f -p mingw -a x86_64
    xmake

初回の xmake 実行時に、DxLibMake のソース ZIP をダウンロード・展開します。ビルド成果物は build/ に出力されます。

Linux から Windows DLL をクロスビルドする場合は、MinGW-w64 クロスコンパイラと vcpkg を導入し、ホスト側 triplet を x64-linux に設定してください。x64-mingw-dynamic は vcpkg の community triplet であり、すべての port が正常にビルドできる保証はありません。

## GitHub Actions

GitHub Actions は Ubuntu 上で MinGW-w64 による Windows DLL のクロスビルドを行います。MSYS2 や pacman は使用しません。
