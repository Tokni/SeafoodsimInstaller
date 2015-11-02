"c:\program files (x86)\wix toolset v3.10\bin\heat.exe" dir "c:\temp\windowsnoeditor" -directoryid -dr INSTALLFOLDER -srd -sreg -cg SeafoodSimComponents -sfrag -suid -wixvar -gg -out c:\tokni\installer\seafoodsiminstaller\seafoodsiminstaller\seafood.wxs

@echo off 
    setlocal enableextensions disabledelayedexpansion

    set "search=sourcedir"
    set "replace=c:\temp\windowsnoeditor"

    set "textFile=c:\tokni\installer\seafoodsiminstaller\seafoodsiminstaller\seafood.wxs"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        set "line=!line:%search%=%replace%!"
        >>"%textFile%" echo(!line!
        endlocal
    )
@echo on

"c:\program files (x86)\wix toolset v3.10\bin\candle.exe" c:\tokni\installer\seafoodsiminstaller\seafoodsiminstaller\product.wxs c:\tokni\installer\seafoodsiminstaller\seafoodsiminstaller\seafood.wxs -out c:\tokni\installer\seafoodsiminstaller\seafoodsiminstaller\
"c:\program files (x86)\wix toolset v3.10\bin\light.exe" -ext WixUtilExtension -ext WixUIExtension c:\tokni\installer\seafoodsiminstaller\seafoodsiminstaller\product.wixobj c:\tokni\installer\seafoodsiminstaller\seafoodsiminstaller\seafood.wixobj -cultures:null -out c:\temp\seafoodsimclientInstaller\SeafoodSimInstaller