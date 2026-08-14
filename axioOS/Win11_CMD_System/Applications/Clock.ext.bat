@echo off
title Clock App - Win11 CMD
:loop
cls
echo =====================================
echo  HORLOGE SYSTEME : %time:~0,8%
echo =====================================
timeout /t 1 >nul
goto loop
