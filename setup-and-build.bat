@echo off
echo ========================================
echo Setup EAS va Build APK cho Android 13
echo ========================================
echo.

set EXPO_TOKEN=xbbUwAcG-ZlPcYeskQmh-GG_llkyK-waNOVe4MYo

echo Buoc 1: Dang nhap EAS...
set EXPO_TOKEN=%EXPO_TOKEN%
npx eas-cli whoami
if %errorlevel% neq 0 (
    echo Chua dang nhap. Dang nhap...
    set EXPO_TOKEN=%EXPO_TOKEN%
    npx eas-cli whoami
)

echo.
echo Buoc 2: Khoi tao EAS project (neu chua co)...
set EXPO_TOKEN=%EXPO_TOKEN%
npx eas-cli init --force

echo.
echo Buoc 3: Tao Android credentials (keystore)...
echo LUA Y: Ban can tao keystore lan dau tien. Chon option de tao keystore moi.
set EXPO_TOKEN=%EXPO_TOKEN%
npx eas-cli credentials --platform android

echo.
echo Buoc 4: Bat dau build APK...
echo.
set EXPO_TOKEN=%EXPO_TOKEN%
npx eas-cli build --platform android --profile preview

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Build thanh cong!
    echo ========================================
    echo.
    echo De xem danh sach builds va tai APK, chay:
    echo   set EXPO_TOKEN=%EXPO_TOKEN%
    echo   npx eas-cli build:list
    echo.
) else (
    echo.
    echo ========================================
    echo Build that bai!
    echo ========================================
    echo.
)

pause
