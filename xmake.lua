set_project("DxLib.dll")
set_defaultmode("release")
set_plat("mingw")
set_arch("x86_64")

-- Keep xmake-resolved package versions reproducible.
set_policy("package.requires_lock", true)

local project_dir = os.scriptdir()
local dxlib_source_dir = path.join(project_dir, "DxLibMake")
local dxlib_archive = path.join(project_dir, "DxLibMake.zip")
local vcpkg_baseline = "31b2524e58e7a0344552ade30b213a15734f944d"
local vcpkg_triplet = os.getenv("VCPKG_DEFAULT_TRIPLET") or "x64-mingw-dynamic"

-- Download sources explicitly as an xmake task. Module imports are only
-- valid in script callbacks, not at the top level of the project description.
task("download-dxlib")
    set_menu {
        usage = "xmake download-dxlib",
        description = "Download and extract the official DxLibMake sources"
    }
    on_run(function ()
        if os.isfile(path.join(dxlib_source_dir, "DxArchive_.cpp")) then
            print("DxLibMake sources already exist; skipping download.")
            return
        end

        local version_file = path.join(project_dir, "dxlib-version.txt")
        local version_text = io.readfile(version_file)
        if not version_text then
            raise("Could not read DxLib version file: " .. version_file)
        end
        local dxlib_version = string.trim(version_text)
        if dxlib_version == "" then
            raise("DxLib version file is empty: " .. version_file)
        end
        local dxlib_url = "https://dxlib.xsrv.jp/DxLib/DxLibMake" .. dxlib_version .. ".zip"

        import("net.http")
        import("utils.archive")
        http.download(dxlib_url, dxlib_archive)
        archive.extract(dxlib_archive, project_dir)

        if not os.isfile(path.join(dxlib_source_dir, "DxArchive_.cpp")) then
            raise("DxLibMake archive was downloaded but the expected source file was not found.")
        end
        print("DxLibMake sources are ready.")
    end)
task_end()

-- xmake installs and integrates these dependencies through vcpkg.
local vcpkg_packages = {
    "vcpkg::bullet3",
    "vcpkg::libpng",
    "vcpkg::zlib",
    "vcpkg::libjpeg-turbo",
    "vcpkg::tiff",
    "vcpkg::libogg",
    "vcpkg::libvorbis",
    "vcpkg::libtheora",
    "vcpkg::opus",
    "vcpkg::opusfile",
    "vcpkg::libwebp",
    "vcpkg::libdeflate",
    "vcpkg::jbigkit",
    "vcpkg::lerc",
    "vcpkg::liblzma",
    "vcpkg::zstd"
}

for _, package in ipairs(vcpkg_packages) do
    if package == "vcpkg::tiff" then
        add_requires(package, {
            configs = {
                --baseline = vcpkg_baseline,
                features = {"lerc", "libdeflate", "webp", "zstd"}
            }
        })
    else
        add_requires(package, {configs = {baseline = vcpkg_baseline}})
    end
end

local sources = {
    "DxLibMake/DxArchive_.cpp",
    "DxLibMake/DxASyncLoad.cpp",
    "DxLibMake/DxBaseFunc.cpp",
    "DxLibMake/DxBaseImage.cpp",
    "DxLibMake/DxChar.cpp",
    "DxLibMake/DxCharCodeTable.cpp",
    "DxLibMake/DxFile.cpp",
    "DxLibMake/DxFont.cpp",
    "DxLibMake/DxGateway.cpp",
    "DxLibMake/DxGraphics.cpp",
    "DxLibMake/DxGraphicsFilter.cpp",
    "DxLibMake/DxHandle.cpp",
    "DxLibMake/DxHeap.cpp",
    "DxLibMake/DxInput.cpp",
    "DxLibMake/DxInputString.cpp",
    "DxLibMake/DxLive2DCubism4.cpp",
    "DxLibMake/DxLog.cpp",
    "DxLibMake/DxMask.cpp",
    "DxLibMake/DxMath.cpp",
    "DxLibMake/DxMemImg.cpp",
    "DxLibMake/DxMemory.cpp",
    "DxLibMake/DxModel.cpp",
    "DxLibMake/DxModelLoader0.cpp",
    "DxLibMake/DxModelLoader1.cpp",
    "DxLibMake/DxModelLoader2.cpp",
    "DxLibMake/DxModelLoader3.cpp",
    "DxLibMake/DxModelLoader4.cpp",
    "DxLibMake/DxModelLoaderVMD.cpp",
    "DxLibMake/DxModelRead.cpp",
    "DxLibMake/DxMovie.cpp",
    "DxLibMake/DxNetwork.cpp",
    "DxLibMake/DxRingBuffer.cpp",
    "DxLibMake/DxSoftImage.cpp",
    "DxLibMake/DxSound.cpp",
    "DxLibMake/DxSoundConvert.cpp",
    "DxLibMake/DxSystem.cpp",
    "DxLibMake/DxThread.cpp",
    "DxLibMake/Windows/DxBaseFuncWin.cpp",
    "DxLibMake/Windows/DxBaseImageWin.cpp",
    "DxLibMake/Windows/DxFileWin.cpp",
    "DxLibMake/Windows/DxFontWin.cpp",
    "DxLibMake/Windows/DxGraphicsAPIWin.cpp",
    "DxLibMake/Windows/DxGraphicsD3D9.cpp",
    "DxLibMake/Windows/DxGraphicsD3D11.cpp",
    "DxLibMake/Windows/DxGraphicsFilterD3D9.cpp",
    "DxLibMake/Windows/DxGraphicsFilterD3D11.cpp",
    "DxLibMake/Windows/DxGraphicsFilterWin.cpp",
    "DxLibMake/Windows/DxGraphicsWin.cpp",
    "DxLibMake/Windows/DxGuid.cpp",
    "DxLibMake/Windows/DxInputWin.cpp",
    "DxLibMake/Windows/DxKeyHookBinary.cpp",
    "DxLibMake/Windows/DxLive2DCubism4Win.cpp",
    "DxLibMake/Windows/DxLogWin.cpp",
    "DxLibMake/Windows/DxMaskD3D9.cpp",
    "DxLibMake/Windows/DxMaskD3D11.cpp",
    "DxLibMake/Windows/DxMaskWin.cpp",
    "DxLibMake/Windows/DxMemoryWin.cpp",
    "DxLibMake/Windows/DxModelD3D9.cpp",
    "DxLibMake/Windows/DxModelD3D11.cpp",
    "DxLibMake/Windows/DxModelWin.cpp",
    "DxLibMake/Windows/DxMovieWin.cpp",
    "DxLibMake/Windows/DxNetworkWin.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Base_D3D9.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Base_D3D11.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Base3D_D3D9.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Base3D_D3D11.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Filter_D3D9.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Filter_D3D11.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Live2D_Cubism4_D3D9.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Live2D_Cubism4_D3D11.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Model_D3D9.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_Model_D3D11.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_RgbaMix_D3D9.cpp",
    "DxLibMake/Windows/DxShaderCodeBin_RgbaMix_D3D11.cpp",
    "DxLibMake/Windows/DxShaderCodeTxt_D3D9.cpp",
    "DxLibMake/Windows/DxShaderCodeTxt_D3D11.cpp",
    "DxLibMake/Windows/DxSoundConvertWin.cpp",
    "DxLibMake/Windows/DxSoundWin.cpp",
    "DxLibMake/Windows/DxSystemWin.cpp",
    "DxLibMake/Windows/DxThreadWin.cpp",
    "DxLibMake/Windows/DxWinAPI.cpp",
    "DxLibMake/Windows/DxWindow.cpp",
    "DxLibMake/DxUseCLib.cpp",
    "DxLibMake/DxUseCLibLive2DCubism4.cpp",
    "DxLibMake/DxUseCLibOgg.cpp",
    "DxLibMake/DxUseCLibPhysics.cpp",
    "DxLibMake/Windows/DxUseCLibOggD3D9.cpp",
    "DxLibMake/Windows/DxUseCLibOggD3D11.cpp",
    "DxLibMake/Windows/DxUseCLibOggWin.cpp",
    "DxLibMake/Windows/DxUseCStrmBaseFilter.cpp",
    "DxLibMake/DxMemImgDrawFunction0.cpp",
    "DxLibMake/DxMemImgDrawFunction1.cpp",
    "DxLibMake/DxMemImgDrawFunction2.cpp",
    "DxLibMake/DxMemImgDrawFunction3.cpp"
}

target("DxLib")
    set_kind("shared")
    set_prefixname("")
    on_load(function (target)
        -- File I/O is available in script callbacks, not in the description scope.
        local version_file = path.join(project_dir, "dxlib-version.txt")
        local version_text = io.readfile(version_file)
        if not version_text then
            raise("Could not read DxLib version file: " .. version_file)
        end
        local dxlib_version = string.trim(version_text)
        if dxlib_version == "" then
            raise("DxLib version file is empty: " .. version_file)
        end
        target:set("basename", "DxLib-" .. dxlib_version)
    end)
    set_targetdir(path.join(project_dir, "build"))
    add_defines("DX_GCC_COMPILE", "DX_COMPILE_TYPE_C_LANGUAGE")
    add_includedirs(path.join(project_dir, "dxlib-for-linux", "insufficient_include"))
    add_packages(table.unpack(vcpkg_packages))
    set_optimize("fastest")
    add_cxxflags("-Ofast", {force = true})
    add_shflags("-s", {force = true})
    add_shflags("-Wl,--out-implib," .. path.join(project_dir, "build", "DxLib.lib"), {force = true})

    for _, source in ipairs(sources) do
        add_files(source)
    end

    -- The legacy Bullet wrapper uses aliases declared by this project.
    add_cxxflags("-include " .. path.join(project_dir, "D_.h"), {
        source = "DxLibMake/DxUseCLibPhysics.cpp",
        force = true
    })

    after_build(function (target)
        local candidates = {
            path.join(project_dir, "vcpkg_installed", vcpkg_triplet, "bin")
        }

        local installed_dir = os.getenv("VCPKG_INSTALLED_DIR")
        if installed_dir and installed_dir ~= "" then
            table.insert(candidates, path.join(installed_dir, vcpkg_triplet, "bin"))
            table.insert(candidates, path.join(installed_dir, "bin"))
        end

        local vcpkg_root = os.getenv("VCPKG_ROOT")
        if vcpkg_root and vcpkg_root ~= "" then
            table.insert(candidates, path.join(vcpkg_root, "installed", vcpkg_triplet, "bin"))
        end

        local runtime_dir
        for _, candidate in ipairs(candidates) do
            if os.isdir(candidate) and #os.files(path.join(candidate, "*.dll")) > 0 then
                runtime_dir = candidate
                break
            end
        end

        if not runtime_dir then
            raise("Could not locate vcpkg runtime DLLs. Check VCPKG_ROOT and VCPKG_DEFAULT_TRIPLET.")
        end

        for _, dll in ipairs(os.files(path.join(runtime_dir, "*.dll"))) do
            os.cp(dll, target:targetdir())
        end
    end)
