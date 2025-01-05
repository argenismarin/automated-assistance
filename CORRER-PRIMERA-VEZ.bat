@echo off
:: Ruta al archivo profiles.ini
set "PROFILE_FILE=%APPDATA%\Mozilla\Firefox\profiles.ini"

:: Verificar si el archivo existe
if not exist "%PROFILE_FILE%" (
    echo El archivo profiles.ini no se encuentra en %PROFILE_FILE%.
    pause
    exit /b
)

:: Inicializar contador y otras variables
setlocal enabledelayedexpansion
set "BASE_PATH=%APPDATA%\Mozilla\Firefox\Profiles"
set "COUNTER=1"

echo Perfiles disponibles en Firefox:
echo ---------------------------------

:: Leer y procesar el archivo profiles.ini
for /f "tokens=*" %%A in ('type "%PROFILE_FILE%" ^| findstr /r /c:"^\[Profile[0-9]+\]" /c:"^Name=" /c:"^Path="') do (
    set "line=%%A"
    call :process_line
)

:: Mostrar las opciones al usuario
echo.
echo Selecciona un perfil ingresando el número correspondiente:
set /p "CHOICE=Ingrese el número del perfil: "

:: Verificar selección
if not defined PROFILE_%CHOICE% (
    echo Opción no válida. Saliendo...
    pause
    exit /b
)

:: Guardar la ruta completa seleccionada
set "SELECTED_PROFILE=!PROFILE_%CHOICE%!"
echo Has seleccionado: !SELECTED_PROFILE!

:: Archivo a modificar
set "MAIN_FILE=main.py"
if not exist "%MAIN_FILE%" (
    echo El archivo %MAIN_FILE% no se encuentra en el directorio actual.
    pause
    exit /b
)

:: Reemplazar solo la línea con una ruta de perfil
set "SEARCH_PATTERN=options.add_argument(r'"
set "REPLACEMENT=options.add_argument(r'!SELECTED_PROFILE!')"

:: Crear archivo temporal y realizar el reemplazo
>"temp_main.py" (
    for /f "usebackq delims=" %%L in ("%MAIN_FILE%") do (
        set "line=%%L"
        setlocal enabledelayedexpansion
        echo !line! | findstr /r "!SEARCH_PATTERN!" >nul
        if not errorlevel 1 (
            echo !REPLACEMENT!
        ) else (
            echo !line!
        )
        endlocal
    )
)

:: Reemplazar el archivo original con el modificado
move /y temp_main.py "%MAIN_FILE%" >nul
echo Se ha actualizado el archivo %MAIN_FILE% con la nueva ruta.

:: Instalar las dependencias de Python
echo Instalando dependencias de Python desde requisitos.txt...
pip install -r requisitos.txt

pause
exit /b

:process_line
:: Detectar nueva sección de perfil
echo !line! | findstr /r /c:"^\[Profile[0-9]+\]" >nul
if not errorlevel 1 (
    goto :eof
)

:: Detectar Nombre del Perfil
echo !line! | findstr /r /c:"^Name=" >nul
if not errorlevel 1 (
    set "CURRENT_NAME=!line:~5!"
    goto :eof
)

:: Detectar Ruta del Perfil
echo !line! | findstr /r /c:"^Path=" >nul
if not errorlevel 1 (
    set "CURRENT_PATH=!line:~5!"
    if /i "!CURRENT_PATH:~0,1!"=="~" (
        set "CURRENT_FULL_PATH=%USERPROFILE%\!CURRENT_PATH:~2!"
    ) else (
        set "CURRENT_FULL_PATH=%APPDATA%\Mozilla\Firefox\!CURRENT_PATH!"
    )
    :: Corregir posibles errores en la construcción de la ruta
    set "CURRENT_FULL_PATH=!CURRENT_FULL_PATH:Profiles\\Profiles=Profiles!"
    set "CURRENT_FULL_PATH=!CURRENT_FULL_PATH:/=\!"
    set "CURRENT_FULL_PATH=!CURRENT_FULL_PATH:\\\\=\!"
    set "PROFILE_%COUNTER%=!CURRENT_FULL_PATH!"
    echo !COUNTER!: !CURRENT_NAME! - !CURRENT_FULL_PATH!
    set /a COUNTER+=1
    goto :eof
)
goto :eof
