# DxLib.dll

DXライブラリのDLL版（非公式）です。

## 使用方法

**DXライブラリのヘッダファイルは依然として必要です。**

- コンパイラオプションで DX_COMPILE_TYPE_C_LANGUAGE を定義するか、DxLib.h のインクルード前に定義してください。
- [Releases](https://github.com/777shuang/DxLib.dll/releases) の ZIP をダウンロードし、同梱 DLL を実行ファイルのあるディレクトリに配置してください。
- DxLib-*.dll をリンクしてください。配布物には DxLib 本体だけでなく、vcpkg 由来の実行時依存 DLL も含めます。

## ビルド方法

Windows 向け DLL を MSYS2 なしでビルドする方法として、Ubuntu または WSL2 上で MinGW-w64 クロスコンパイルする構成を推奨します。GitHub Actions も同じ方式で、MSYS2 セットアップや pacman は使用しません。

### 必要なもの

- Ubuntu または WSL2
- Git、curl、zip/unzip
- xmake（https://xmake.io/）
- vcpkg（https://github.com/microsoft/vcpkg/）
- MinGW-w64 クロスコンパイラ（x86_64-w64-mingw32-g++）

### Ubuntu / WSL2

必要なツールをインストールします。

```sh
sudo apt-get update
sudo apt-get install --yes git curl zip unzip pkg-config g++-mingw-w64-x86-64
curl -fsSL https://xmake.io/shget.text | bash
source "$HOME/.xmake/profile"
```

リポジトリと vcpkg を用意し、ビルドします。

```sh
git clone https://github.com/777shuang/DxLib.dll.git --recursive
cd DxLib.dll
git clone https://github.com/microsoft/vcpkg.git "$HOME/vcpkg"
VCPKG_BASELINE="$(sed -n 's/^local vcpkg_baseline = "\([0-9a-f]\{40\}\)".*/\1/p' xmake.lua)"
test -n "$VCPKG_BASELINE"
git -C "$HOME/vcpkg" checkout --detach "$VCPKG_BASELINE"
"$HOME/vcpkg/bootstrap-vcpkg.sh" -disableMetrics
export VCPKG_ROOT="$HOME/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"
export VCPKG_DEFAULT_TRIPLET=x64-mingw-dynamic
export VCPKG_DEFAULT_HOST_TRIPLET=x64-linux
xmake download-dxlib
xmake f -p mingw -a x86_64 --mingw=/usr
xmake
```

依存ライブラリの宣言と vcpkg の固定リビジョンは xmake.lua に集約しています（プロジェクト直下の vcpkg.json は不要です）。xmake が DxLibMake のソース ZIP を取得・展開し、xmake.lua で指定した vcpkg リビジョンから必要なライブラリを取得してリンクします。DLL と import library は build/ に出力され、依存 DLL も同じディレクトリにコピーされます。

`x64-mingw-dynamic` は vcpkg の community triplet です。vcpkg 側で一部 port が未検証のため、将来の port 更新によりビルドエラーが発生する可能性があります。Windows ネイティブ環境での同 triplet の動作はこの構成では保証していません。MSYS2 を別途インストールせずにビルドしたい場合は、Ubuntu/WSL2 または GitHub Actions を利用してください。

## GitHub Actions

GitHub Actions は Windows runner 上で MinGW-w64 を使用してビルドします。MSYS2 のセットアップや pacman は使用せず、xmake.lua の依存関係定義に基づき vcpkg からライブラリを取得します。依存パッケージのキャッシュ復元・保存には setup-xmake アクションの package-cache 機能を使用します。
