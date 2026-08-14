@echo off
setlocal EnableDelayedExpansion
title AXIO OS - CMD Edition V8.8 (Ultra Stable)
color 0F
chcp 65001 >nul
cls

:: Vérification si lancement d'une sous-application
if "%~1"=="RUN_CRAFTMINE" goto ENGINE_CRAFTMINE
if "%~1"=="RUN_LABYRINTHE" goto ENGINE_LABYRINTHE

:: CREATION DES DOSSIERS SYSTEME
if not exist "Win11_CMD_System\Applications" mkdir "Win11_CMD_System\Applications"
if not exist "Win11_CMD_System\Desktop" mkdir "Win11_CMD_System\Desktop"

:: ========================================================================
:: 1. ECRAN DE BOOT STYLE AXIO
:: ========================================================================
:AXIO_SPLASH
cls
echo.
echo.
echo.
echo.
echo         █████╗ ██╗  ██╗██╗ ██████╗ 
echo        ██╔══██╗╚██╗██╔╝██║██╔═══██╗
echo        ███████║ ╚███╔╝ ██║██║   ██║
echo        ██╔══██║ ██╔██╗ ██║██║   ██║
echo        ██║  ██║██╔╝ ██╗██║╚██████╔╝
echo        ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ 
echo.
echo.
echo.
echo.
echo.
echo Press ^<F2^> to enter Setup               Press ^<F12^> to change boot device
timeout /t 2 >nul

:: ========================================================================
:: 2. ECRAN DE BOOT BIOS
:: ========================================================================
:BIOS_BOOT
cls
echo.
echo       /\      American
echo      /  \     Megatrends
echo     /____\    
echo    www.ami.com
echo.
echo AMIBIOS (C) 2026 AXIO Systems Inc.
echo.
echo CPU : Virtual Intel(R) Core(TM)2 Quad CPU Q9300 @ 2.50GHz
<nul set /p="RAM Check : "
for %%m in (1024MB 2048MB 4096MB) do (
    <nul set /p="%%m OK... "
    timeout /t 1 >nul
)
echo.
echo Loading AXIO OS...
timeout /t 1 >nul
cls

:: LOGIN / FIRST SETUP
if not exist "Win11_CMD_System\system_user.dat" goto FIRST_TIME_SETUP

:LOGIN
cls
echo.
echo   ====================================================
echo             AXIO OS - ÉCRAN DE VERROUILLAGE
echo   ====================================================
echo.
set /p input_user="   Nom d'utilisateur : "
set /p input_pass="   Mot de passe : "

if "%input_user%"=="Admin" if "%input_pass%"=="Root1234" (
    set "LOGGED_USER=Admin (Master)"
    goto BUREAU
)

if exist "Win11_CMD_System\system_user.dat" (
    for /f "usebackq tokens=1,2 delims=:" %%a in ("Win11_CMD_System\system_user.dat") do (
        set "SAVED_USER=%%a"
        set "SAVED_PASS=%%b"
    )
)

if "%input_user%"=="!SAVED_USER!" if "%input_pass%"=="!SAVED_PASS!" (
    set "LOGGED_USER=!SAVED_USER!"
    goto BUREAU
)

echo.
echo   [!] Identifiants incorrects !
pause
goto LOGIN

:FIRST_TIME_SETUP
cls
echo.
echo   ====================================================
echo          PREMIÈRE CONFIGURATION - CRÉER UN PROFIL
echo   ====================================================
echo.
set /p new_user="   Choisissez un nom d'utilisateur : "
set /p new_pass="   Choisissez un mot de passe : "

if not defined new_user goto FIRST_TIME_SETUP
if not defined new_pass goto FIRST_TIME_SETUP

<nul set /p="%new_user%:%new_pass%" > "Win11_CMD_System\system_user.dat"
set "LOGGED_USER=%new_user%"
goto BUREAU

:BUREAU
cls
echo   ========================================================================
echo    AXIO OS v8.8                             [User: %LOGGED_USER%] [%time:~0,5%]
echo   ========================================================================
echo.
echo    [1]  🌐 Navigateur Web
echo    [2]  🛍️ AXIO App Store (Installs 100%% Stables)
echo    [3]  🚀 Mes Applications (.ext.bat)
echo    [4]  📁 Explorateur de Fichiers (Interactif)
echo    [5]  🖼️ Visionneur de Photos (ASCII Convertor)
echo    [6]  ⚙️ Paramètres et Thèmes
echo    [7]  💻 Console CMD
echo    [8]  📝 Bloc-notes
echo    [9]  🧮 Calculatrice
echo    [10] 🎮 Jeu : Nombre Mystère
echo    [11] 📜 Crédits
echo    [12] 🔒 Déconnexion
echo    [13] 🔴 Éteindre
echo.
echo   ========================================================================
set /p choice="   Sélectionnez une option (1-13) : "

if "%choice%"=="1" goto BROWSER
if "%choice%"=="2" goto STORE
if "%choice%"=="3" goto LAUNCH_APPS
if "%choice%"=="4" goto EXPLORER
if "%choice%"=="5" goto PHOTO_VIEWER
if "%choice%"=="6" goto SETTINGS
if "%choice%"=="7" goto TERMINAL
if "%choice%"=="8" goto NOTES
if "%choice%"=="9" goto CALC
if "%choice%"=="10" goto GAMES
if "%choice%"=="11" goto CREDITS
if "%choice%"=="12" goto LOGIN
if "%choice%"=="13" goto SHUTDOWN
goto BUREAU

:: ========================================================================
:: 2. AXIO APP STORE (SYSTÈME ULTRA ROBUSTE)
:: ========================================================================
:STORE
cls
echo.
echo   ====================================================
echo                 AXIO STORE (CMD)
echo   ====================================================
echo.
echo    [1] ⛏️ Installer CraftMine2D.ext.bat
echo    [2] 🎮 Installer Labyrinthe2D.ext.bat
echo    [3] 🟢 Installer Matrix.ext.bat
echo    [4] ⏰ Installer Clock.ext.bat
echo    [5] ↩️ Retour au bureau
echo.
set /p store_choice="   Votre choix : "

if "%store_choice%"=="1" (
    echo @"%~f0" RUN_CRAFTMINE > "Win11_CMD_System\Applications\CraftMine2D.ext.bat"
    echo.
    echo   [STORE] CraftMine2D.ext.bat installé avec succès !
    pause
    goto BUREAU
)

if "%store_choice%"=="2" (
    echo @"%~f0" RUN_LABYRINTHE > "Win11_CMD_System\Applications\Labyrinthe2D.ext.bat"
    echo.
    echo   [STORE] Labyrinthe2D.ext.bat installé avec succès !
    pause
    goto BUREAU
)

if "%store_choice%"=="3" (
    (
        echo @echo off
        echo color 0A
        echo :loop
        echo echo %%random%%%%random%%%%random%%%%random%%
        echo goto loop
    ) > "Win11_CMD_System\Applications\Matrix.ext.bat"
    echo.
    echo   [STORE] Matrix.ext.bat installé !
    pause
    goto BUREAU
)

if "%store_choice%"=="4" (
    (
        echo @echo off
        echo color 0B
        echo :loop
        echo cls
        echo echo Horloge : %%time:~0,8%%
        echo timeout /t 1 ^>nul
        echo goto loop
    ) > "Win11_CMD_System\Applications\Clock.ext.bat"
    echo.
    echo   [STORE] Clock.ext.bat installé !
    pause
    goto BUREAU
)

goto BUREAU

:: ========================================================================
:: MOTEURS DES JEUX (STABLES ET INTÉGRÉS)
:: ========================================================================
:ENGINE_CRAFTMINE
cls
color 0E
set px=5
set wood=0
set dirt=0
set stone=0
set "l1=  ===      ===   "
set "l2=   I        I    "
set "l3=-----------------"
set "l4=-----------------"
set "l5=#################"
set "l6=#################"

:CRAFT_LOOP
cls
echo ===========================================
echo        CRAFTMINE 2D - AXIO OS
echo ===========================================
echo  INVENTAIRE: [Bois: !wood!] [Terre: !dirt!] [Pierre: !stone!]
echo -------------------------------------------
echo  Commandes: Q (Gauche), D (Droite), M (Miner), P (Poser Bois), E (Quitter)
echo.
set "sky=                 "
set "p_sky=!sky:~0,%px%!P!sky:~%px%!"
echo !p_sky:~0,17!
echo !l1!
echo !l2!
echo !l3!
echo !l4!
echo !l5!
echo !l6!
echo.
set /p act="Action : "
if /i "!act!"=="q" if !px! GTR 0 set /a px-=1
if /i "!act!"=="d" if !px! LSS 16 set /a px+=1
if /i "!act!"=="e" exit
if /i "!act!"=="m" (
    set /a wood+=1
    set "l1=!l1:~0,%px%! !l1:~%px%+1!"
)
if /i "!act!"=="p" (
    if !wood! GTR 0 (
        set /a wood-=1
        set "l1=!l1:~0,%px%!O!l1:~%px%+1!"
    )
)
goto CRAFT_LOOP

:ENGINE_LABYRINTHE
cls
color 0E
set px=1
set py=1

:LABY_LOOP
cls
echo ====================================
echo   LABYRINTHE 2D - AXIO OS
echo ====================================
echo Commandes: Z (Haut), S (Bas), Q (Gauche), D (Droite)
echo Objectif: Atteindre la sortie X !
echo.
set "line1=###########"
set "line2=#P  #   # X#"
set "line3=# ### # # ##"
set "line4=#   # #   ##"
set "line5=### # ######"
set "line6=#     #    #"
set "line7=###########"

for /l %%y in (1,1,7) do (
    set "out_line="
    for /l %%x in (0,1,10) do (
        if %%x==!px! if %%y==!py! (
            set "out_line=!out_line!P"
        ) else (
            set "curr_l=!line%%y!"
            set "char=!curr_l:~%%x,1!"
            if "!char!"=="P" set "char= "
            set "out_line=!out_line!!char!"
        )
    )
    echo !out_line!
)

if !px!==9 if !py!==1 (
    echo.
    echo 🎉 BRAVO ! Tu as trouve la sortie du labyrinthe !
    pause
    exit
)

echo.
set /p move="Deplacement (Z/Q/S/D) : "
set nx=!px!
set ny=!py!
if /i "!move!"=="z" set /a ny-=1
if /i "!move!"=="s" set /a ny+=1
if /i "!move!"=="q" set /a nx-=1
if /i "!move!"=="d" set /a nx+=1

set "target_line=!line%ny%!"
set "target_tile=!target_line:~%nx%,1!"
if not "!target_tile!"="#" (
    set px=!nx!
    set py=!ny!
)
goto LABY_LOOP

:: ========================================================================
:: 5. VISIONNEUR DE PHOTOS
:: ========================================================================
:PHOTO_VIEWER
cls
echo.
echo   ========================================================================
echo                    AXIO PHOTO VIEWER (CONVERTISSEUR ASCII)
echo   ========================================================================
echo.
echo   Glissez une image (.jpg, .png, .bmp) ici ou tapez son chemin.
echo.
set /p img_path="   Chemin de la photo : "

if not defined img_path goto BUREAU
set "img_path=!img_path:"=!"

if not exist "!img_path!" (
    echo.
    echo   [!] Fichier introuvable ! Vérifiez le chemin.
    pause
    goto BUREAU
)

cls
echo   Traitement graphique de l'image en cours...
echo.

(
echo Add-Type -AssemblyName System.Drawing
echo try {
echo     $imgPath = '%img_path%'
echo     $img = [System.Drawing.Image]::FromFile($imgPath^)
echo     $w = 65
echo     $h = [int]($img.Height / ($img.Width / $w^) * 0.45^)
echo     $bmp = new-object System.Drawing.Bitmap($img, $w, $h^)
echo     $chars = @(' ', '.', ':', '-', '=', '+', '*', '#', '%%', '@'^)
echo     for ($y=0; $y -lt $h; $y++^) {
echo         $line = ''
echo         for ($x=0; $x -lt $w; $x++^) {
echo             $c = $bmp.GetPixel($x, $y^)
echo             $gray = [int]($c.R * 0.3 + $c.G * 0.59 + $c.B * 0.11^)
echo             $idx = [int]($gray / 25.6^)
echo             if ($idx -gt 9^) { $idx = 9 }
echo             $line += $chars[$idx]
echo         }
echo         Write-Host $line
echo     }
echo     $img.Dispose(^)
echo     $bmp.Dispose(^)
echo } catch {
echo     Write-Host '[ERREUR] Format d image non supporte.' -ForegroundColor Red
echo }
) > "Win11_CMD_System\ascii_converter.ps1"

powershell -ExecutionPolicy Bypass -File "Win11_CMD_System\ascii_converter.ps1"
if exist "Win11_CMD_System\ascii_converter.ps1" del "Win11_CMD_System\ascii_converter.ps1"

echo.
pause
goto BUREAU

:: ========================================================================
:: 4. EXPLORATEUR DE FICHIERS INTERACTIF
:: ========================================================================
:EXPLORER
cls
if not defined CURRENT_DIR set "CURRENT_DIR=Win11_CMD_System"
echo.
echo   ========================================================================
echo    EXPLORATEUR DE FICHIERS AXIO - [ Dossier : !CURRENT_DIR! ]
echo   ========================================================================
echo.
set f_count=0

for /f "delims=" %%i in ('dir /b "!CURRENT_DIR!" 2^>nul') do (
    set /a f_count+=1
    set "file_!f_count!=%%i"
    if exist "!CURRENT_DIR!\%%i\*" (
        echo    [!f_count!] 📁 [DOSSIER] %%i
    ) else (
        echo    [!f_count!] 📄 [FICHIER] %%i
    )
)

if !f_count!==0 echo    (Ce dossier est vide)

echo.
echo   ------------------------------------------------------------------------
echo    [O] Ouvrir dans l'explorateur Windows   [N] Nouveau dossier
echo    [L] Lire un fichier texte               [D] Supprimer un fichier
echo    [R] Retour au dossier parent            [B] Retour au bureau
echo   ------------------------------------------------------------------------
set /p exp_act="   Option ou numéro de dossier à ouvrir : "

if /i "%exp_act%"=="b" goto BUREAU
if /i "%exp_act%"=="o" ( explorer "!CURRENT_DIR!" & goto EXPLORER )
if /i "%exp_act%"=="r" ( set "CURRENT_DIR=Win11_CMD_System" & goto EXPLORER )
if /i "%exp_act%"=="n" (
    set /p new_folder="   Nom du dossier : "
    if defined new_folder mkdir "!CURRENT_DIR!\!new_folder!"
    goto EXPLORER
)
if /i "%exp_act%"=="l" (
    set /p txt_num="   Numéro du fichier texte à lire : "
    if defined file_!txt_num! (
        cls
        echo --- CONTENU DE !file_%txt_num%! ---
        echo.
        type "!CURRENT_DIR!\!file_%txt_num%!"
        echo.
        pause
    )
    goto EXPLORER
)
if /i "%exp_act%"=="d" (
    set /p del_num="   Numéro du fichier à supprimer : "
    if defined file_!del_num! (
        del /f /q "!CURRENT_DIR!\!file_%del_num%!" 2>nul
        rmdir /s /q "!CURRENT_DIR!\!file_%del_num%!" 2>nul
    )
    goto EXPLORER
)

if defined file_%exp_act% (
    for /f "tokens=2 delims==" %%a in ('set file_%exp_act%') do set "selected_f=%%a"
    if exist "!CURRENT_DIR!\!selected_f!\*" (
        set "CURRENT_DIR=!CURRENT_DIR!\!selected_f!"
    )
)
goto EXPLORER

:CREDITS
cls
echo.
echo   ========================================================================
echo                          CRÉDITS ^& INFORMATIONS
echo   ========================================================================
echo.
echo    📌 Système : AXIO OS (CMD Edition v8.8)
echo    📌 Moteur : Architecture modulaire ultra-stable.
echo.
pause
goto BUREAU

:BROWSER
cls
echo.
echo   ====================================================
echo              NAVIGATEUR WEB - STABLE EDITION
echo   ====================================================
echo   [1] Ouvrir un site Web (Vrai navigateur)
echo   [2] Google ASCII
echo   [3] Retour
set /p b_choice="   Choix : "
if "%b_choice%"=="1" (
    set /p target_url="   Site : "
    if defined target_url start https://!target_url!
    goto BROWSER
)
if "%b_choice%"=="2" (
    start https://www.google.com
    goto BROWSER
)
goto BUREAU

:LAUNCH_APPS
cls
echo.
echo   --- APPLIS INSTALLÉES ---
set count=0
for %%f in ("Win11_CMD_System\Applications\*.bat") do (
    set /a count+=1
    set "app_!count!=%%~nxf"
    echo    [!count!] %%~nxf
)
if !count!==0 ( echo   Aucune appli. Va dans le Store ! & pause & goto BUREAU )
echo.
set /p app_choice="   Sélectionnez l'appli à lancer (0 pour quitter) : "
if "%app_choice%"=="0" goto BUREAU
if defined app_%app_choice% (
    for /f "tokens=2 delims==" %%a in ('set app_%app_choice%') do start "" "Win11_CMD_System\Applications\%%a"
)
pause
goto BUREAU

:SETTINGS
cls
echo   --- PARAMÈTRES ET THÈMES ---
echo   [1] Blanc Classique  [2] Vert Matrice  [3] Bleu Cyan  [4] Rouge Sombre
set /p schoice="   Choix : "
if "%schoice%"=="1" color 0F
if "%schoice%"=="2" color 0A
if "%schoice%"=="3" color 0B
if "%schoice%"=="4" color 0C
goto BUREAU

:TERMINAL
cls
echo   --- TERMINAL AXIO OS --- (Tapez 'exit' pour quitter)
:TERM_LOOP
set /p cmd_input="AXIO-CMD> "
if "%cmd_input%"=="exit" goto BUREAU
%cmd_input%
goto TERM_LOOP

:NOTES
cls
set /p note="Note : "
if defined note echo %date% %time:~0,5% : %note% >> Win11_CMD_System\Desktop\Note.txt
pause
goto BUREAU

:CALC
cls
set /p math="Calcul : "
if defined math ( set /a res=%math% & echo Résultat : !res! )
pause
goto BUREAU

:GAMES
cls
set /a secret=(%random% %% 100) + 1
set tries=0
:GAME_LOOP
set /p guess="Devine (1-100) : "
if not defined guess goto GAME_LOOP
set /a tries+=1
if %guess% EQU %secret% echo Bravo en %tries% essais ! & pause & goto BUREAU
if %guess% LSS %secret% echo Plus grand !
if %guess% GTR %secret% echo Plus petit !
goto GAME_LOOP

:SHUTDOWN
cls
echo Arrêt de AXIO OS...
timeout /t 1 >nul
exit