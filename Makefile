PREFIX=x86_64-w64-mingw32-
CXX=$(PREFIX)g++
UNZIP=7z x
CXXFLAGS= -s -Ofast -c -DDX_GCC_COMPILE -DDX_COMPILE_TYPE_C_LANGUAGE
LDFLAGS= -s -Ofast -shared
DXLIB_VERSION=3_24b
DXLIB_URL=https://drive.google.com/uc?id=1-uDeu5NzyGsAh62jKd7VAf0IUZQmXhdU #https://dxlib.xsrv.jp/DxLib/DxLibMake$(DXLIB_VERSION).zip
BIN=/mingw64/bin

DxLib-$(DXLIB_VERSION).dll: \
DxLibMake/DxArchive_.o \
DxLibMake/DxASyncLoad.o \
DxLibMake/DxBaseFunc.o \
DxLibMake/DxBaseImage.o \
DxLibMake/DxChar.o \
DxLibMake/DxCharCodeTable.o \
DxLibMake/DxFile.o \
DxLibMake/DxFont.o \
DxLibMake/DxGateway.o \
DxLibMake/DxGraphics.o \
DxLibMake/DxGraphicsFilter.o \
DxLibMake/DxHandle.o \
DxLibMake/DxHeap.o \
DxLibMake/DxInput.o \
DxLibMake/DxInputString.o \
DxLibMake/DxLive2DCubism4.o \
DxLibMake/DxLog.o \
DxLibMake/DxMask.o \
DxLibMake/DxMath.o \
DxLibMake/DxMemImg.o \
DxLibMake/DxMemory.o \
DxLibMake/DxModel.o \
DxLibMake/DxModelLoader0.o \
DxLibMake/DxModelLoader1.o \
DxLibMake/DxModelLoader2.o \
DxLibMake/DxModelLoader3.o \
DxLibMake/DxModelLoader4.o \
DxLibMake/DxModelLoaderVMD.o \
DxLibMake/DxModelRead.o \
DxLibMake/DxMovie.o \
DxLibMake/DxNetwork.o \
DxLibMake/DxRingBuffer.o \
DxLibMake/DxSoftImage.o \
DxLibMake/DxSound.o \
DxLibMake/DxSoundConvert.o \
DxLibMake/DxSystem.o \
DxLibMake/DxThread.o \
DxLibMake/Windows/DxBaseFuncWin.o \
DxLibMake/Windows/DxBaseImageWin.o \
DxLibMake/Windows/DxFileWin.o \
DxLibMake/Windows/DxFontWin.o \
DxLibMake/Windows/DxGraphicsAPIWin.o \
DxLibMake/Windows/DxGraphicsD3D9.o \
DxLibMake/Windows/GraphicsD3D11.o \
DxLibMake/Windows/GraphicsFilterD3D9.o \
DxLibMake/Windows/GraphicsFilterD3D11.o \
DxLibMake/Windows/GraphicsFilterWin.o \
DxLibMake/Windows/GraphicsWin.o \
DxLibMake/Windows/Guid.o \
DxLibMake/Windows/InputWin.o \
DxLibMake/Windows/KeyHookBinary.o \
DxLibMake/Windows/Live2DCubism4Win.o \
DxLibMake/Windows/LogWin.o \
DxLibMake/Windows/MaskD3D9.o \
DxLibMake/Windows/MaskD3D11.o \
DxLibMake/Windows/MaskWin.o \
DxLibMake/Windows/MemoryWin.o \
DxLibMake/Windows/ModelD3D9.o \
DxLibMake/Windows/ModelD3D11.o \
DxLibMake/Windows/ModelWin.o \
DxLibMake/Windows/MovieWin.o \
DxLibMake/Windows/NetworkWin.o \
DxLibMake/Windows/ShaderCodeBin_Base_D3D9.o \
DxLibMake/Windows/ShaderCodeBin_Base_D3D11.o \
DxLibMake/Windows/ShaderCodeBin_Base3D_D3D9.o \
DxLibMake/Windows/ShaderCodeBin_Base3D_D3D11.o \
DxLibMake/Windows/ShaderCodeBin_Filter_D3D9.o \
DxLibMake/Windows/ShaderCodeBin_Filter_D3D11.o \
DxLibMake/Windows/ShaderCodeBin_Live2D_Cubism4_D3D9.o \
DxLibMake/Windows/ShaderCodeBin_Live2D_Cubism4_D3D11.o \
DxLibMake/Windows/ShaderCodeBin_Model_D3D9.o \
DxLibMake/Windows/ShaderCodeBin_Model_D3D11.o \
DxLibMake/Windows/ShaderCodeBin_RgbaMix_D3D9.o \
DxLibMake/Windows/ShaderCodeBin_RgbaMix_D3D11.o \
DxLibMake/Windows/ShaderCodeTxt_D3D9.o \
DxLibMake/Windows/ShaderCodeTxt_D3D11.o \
DxLibMake/Windows/SoundConvertWin.o \
DxLibMake/Windows/SoundWin.o \
DxLibMake/Windows/SystemWin.o \
DxLibMake/Windows/ThreadWin.o \
DxLibMake/Windows/WinAPI.o \
DxLibMake/Windows/Window.o \
\
DxLibMake/DxUseCLib.o \
DxLibMake/DxUseCLibLive2DCubism4.o \
DxLibMake/DxUseCLibOgg.o \
DxLibMake/DxUseCLibPhysics.o \
DxLibMake/Windows/DxUseCLibOggD3D9.o \
DxLibMake/Windows/DxUseCLibOggD3D11.o \
DxLibMake/Windows/DxUseCLibOggWin.o \
DxLibMake/Windows/DxUseCStrmBaseFilter.o \
\
DxLibMake/DxMemImgDrawFunction0.o \
DxLibMake/DxMemImgDrawFunction1.o \
DxLibMake/DxMemImgDrawFunction2.o \
DxLibMake/DxMemImgDrawFunction3.o \
\
*.dll
	$(CXX) $(LDFLAGS) $^ -o $@

*.dll:
cp \
$(BIN)/libBulletCollision.dll \
$(BIN)/libBulletDynamics.dll \
$(BIN)/libjpeg*.dll \
$(BIN)/libLinearMath.dll \
$(BIN)/libogg*.dll \
$(BIN)/libopus*.dll \
$(BIN)/libopusfile*.dll \
$(BIN)/libpng*.dll \
$(BIN)/libtheora*.dll \
$(BIN)/libtiff*.dll \
$(BIN)/libvorbis*.dll \
$(BIN)/libvorbisfile*.dll \
$(BIN)/zlib*.dll \
 .

DxLibMake/DxArchive_.o: DxLibMake/DxArchive_.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxASyncLoad.o: DxLibMake/DxASyncLoad.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxBaseFunc.o: DxLibMake/DxBaseFunc.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxBaseImage.o: DxLibMake/DxBaseImage.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxChar.o: DxLibMake/DxChar.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxCharCodeTable.o: DxLibMake/DxCharCodeTable.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxFile.o: DxLibMake/DxFile.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxFont.o: DxLibMake/DxFont.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxGateway.o: DxLibMake/DxGateway.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxGraphics.o: DxLibMake/DxGraphics.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxGraphicsFilter.o: DxLibMake/DxGraphicsFilter.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxHandle.o: DxLibMake/DxHandle.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxHeap.o: DxLibMake/DxHeap.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxInput.o: DxLibMake/DxInput.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxInputString.o: DxLibMake/DxInputString.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxLive2DCubism4.o: DxLibMake/DxLive2DCubism4.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxLog.o: DxLibMake/DxLog.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMask.o: DxLibMake/DxMask.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMath.o: DxLibMake/DxMath.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMemImg.o: DxLibMake/DxMemImg.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMemory.o: DxLibMake/DxMemory.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModel.o: DxLibMake/DxModel.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModelLoader0.o: DxLibMake/DxModelLoader0.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModelLoader1.o: DxLibMake/DxModelLoader1.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModelLoader2.o: DxLibMake/DxModelLoader2.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModelLoader3.o: DxLibMake/DxModelLoader3.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModelLoader4.o: DxLibMake/DxModelLoader4.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModelLoaderVMD.o: DxLibMake/DxModelLoaderVMD.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxModelRead.o: DxLibMake/DxModelRead.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMovie.o: DxLibMake/DxMovie.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxNetwork.o: DxLibMake/DxNetwork.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxRingBuffer.o: DxLibMake/DxRingBuffer.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxSoftImage.o: DxLibMake/DxSoftImage.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxSound.o: DxLibMake/DxSound.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxSoundConvert.o: DxLibMake/DxSoundConvert.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxSystem.o: DxLibMake/DxSystem.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxThread.o: DxLibMake/DxThread.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/DxBaseFuncWin.o: DxLibMake/Windows/DxBaseFuncWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/DxBaseImageWin.o: DxLibMake/Windows/DxBaseImageWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/DxFileWin.o: DxLibMake/Windows/DxFileWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/DxFontWin.o: DxLibMake/Windows/DxFontWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/DxGraphicsAPIWin.o: DxLibMake/Windows/DxGraphicsAPIWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/DxGraphicsD3D9.o: DxLibMake/Windows/DxGraphicsD3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/GraphicsD3D11.o: DxLibMake/Windows/DxGraphicsD3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/GraphicsFilterD3D9.o: DxLibMake/Windows/DxGraphicsFilterD3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/GraphicsFilterD3D11.o: DxLibMake/Windows/DxGraphicsFilterD3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/GraphicsFilterWin.o: DxLibMake/Windows/DxGraphicsFilterWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/GraphicsWin.o: DxLibMake/Windows/DxGraphicsWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/Guid.o: DxLibMake/Windows/DxGuid.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/InputWin.o: DxLibMake/Windows/DxInputWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/KeyHookBinary.o: DxLibMake/Windows/DxKeyHookBinary.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/Live2DCubism4Win.o: DxLibMake/Windows/DxLive2DCubism4Win.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/LogWin.o: DxLibMake/Windows/DxLogWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/MaskD3D9.o: DxLibMake/Windows/DxMaskD3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/MaskD3D11.o: DxLibMake/Windows/DxMaskD3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/MaskWin.o: DxLibMake/Windows/DxMaskWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/MemoryWin.o: DxLibMake/Windows/DxMemoryWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ModelD3D9.o: DxLibMake/Windows/DxModelD3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ModelD3D11.o: DxLibMake/Windows/DxModelD3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ModelWin.o: DxLibMake/Windows/DxModelWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/MovieWin.o: DxLibMake/Windows/DxMovieWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/NetworkWin.o: DxLibMake/Windows/DxNetworkWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Base_D3D9.o: DxLibMake/Windows/DxShaderCodeBin_Base_D3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Base_D3D11.o: DxLibMake/Windows/DxShaderCodeBin_Base_D3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Base3D_D3D9.o: DxLibMake/Windows/DxShaderCodeBin_Base3D_D3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Base3D_D3D11.o: DxLibMake/Windows/DxShaderCodeBin_Base3D_D3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Filter_D3D9.o: DxLibMake/Windows/DxShaderCodeBin_Filter_D3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Filter_D3D11.o: DxLibMake/Windows/DxShaderCodeBin_Filter_D3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Live2D_Cubism4_D3D9.o: DxLibMake/Windows/DxShaderCodeBin_Live2D_Cubism4_D3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Live2D_Cubism4_D3D11.o: DxLibMake/Windows/DxShaderCodeBin_Live2D_Cubism4_D3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Model_D3D9.o: DxLibMake/Windows/DxShaderCodeBin_Model_D3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_Model_D3D11.o: DxLibMake/Windows/DxShaderCodeBin_Model_D3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_RgbaMix_D3D9.o: DxLibMake/Windows/DxShaderCodeBin_RgbaMix_D3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeBin_RgbaMix_D3D11.o: DxLibMake/Windows/DxShaderCodeBin_RgbaMix_D3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeTxt_D3D9.o: DxLibMake/Windows/DxShaderCodeTxt_D3D9.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ShaderCodeTxt_D3D11.o: DxLibMake/Windows/DxShaderCodeTxt_D3D11.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/SoundConvertWin.o: DxLibMake/Windows/DxSoundConvertWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/SoundWin.o: DxLibMake/Windows/DxSoundWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/SystemWin.o: DxLibMake/Windows/DxSystemWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/ThreadWin.o: DxLibMake/Windows/DxThreadWin.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/WinAPI.o: DxLibMake/Windows/DxWinAPI.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/Windows/Window.o: DxLibMake/Windows/DxWindow.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

# DxUseClib.lib
DxLibMake/DxUseCLib.o: DxLibMake/DxUseCLib.cpp
	$(CXX) $(CXXFLAGS) -I /mingw64/include/bullet $< -o $@
DxLibMake/DxUseCLibLive2DCubism4.o: DxLibMake/DxUseCLibLive2DCubism4.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxUseCLibOgg.o: DxLibMake/DxUseCLibOgg.cpp
	$(CXX) $(CXXFLAGS) -I /mingw64/include/ogg -I dxlib-for-linux/insufficient_include -I/mingw64/include/opus $< -o $@
DxLibMake/DxUseCLibPhysics.o: DxLibMake/DxUseCLibPhysics.cpp
	$(CXX) $(CXXFLAGS) -I /mingw64/include/bullet -include D_.h $< -o $@
DxLibMake/Windows/DxUseCLibOggD3D9.o: DxLibMake/Windows/DxUseCLibOggD3D9.cpp
	$(CXX) $(CXXFLAGS) -I dxlib-for-linux/insufficient_include -I /mingw64/include/opus $< -o $@
DxLibMake/Windows/DxUseCLibOggD3D11.o: DxLibMake/Windows/DxUseCLibOggD3D11.cpp
	$(CXX) $(CXXFLAGS) -I dxlib-for-linux/insufficient_include -I /mingw64/include/opus $< -o $@
DxLibMake/Windows/DxUseCLibOggWin.o: DxLibMake/Windows/DxUseCLibOggWin.cpp
	$(CXX) $(CXXFLAGS) -I dxlib-for-linux/insufficient_include -I /mingw64/include/opus $< -o $@
DxLibMake/Windows/DxUseCStrmBaseFilter.o: DxLibMake/Windows/DxUseCStrmBaseFilter.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

# DxDrawFunc.lib
DxLibMake/DxMemImgDrawFunction0.o: DxLibMake/DxMemImgDrawFunction0.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMemImgDrawFunction1.o: DxLibMake/DxMemImgDrawFunction1.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMemImgDrawFunction2.o: DxLibMake/DxMemImgDrawFunction2.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
DxLibMake/DxMemImgDrawFunction3.o: DxLibMake/DxMemImgDrawFunction3.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

.PHONY: init
init: DxLibMake

.PHONY: DxLibMake
DxLibMake: DxLibMake.zip
	$(UNZIP) $<

DxLibMake.zip:
	wget -O $@ $(DXLIB_URL)

.PHONY: clean
clean:
	rm -rf DxLibMake
	rm -f *.zip