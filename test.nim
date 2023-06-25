{.push dynlib: "DxLib-3_24b.dll".}
proc dxLibInit():int {.importc: "DxLib_Init".}
proc dxLibEnd(): int {.importc: "DxLib_End".}
proc waitKey(): int {.importc: "WaitKey".}
{.pop.}

discard dxLibInit()
discard waitKey()
discard dxLibEnd()