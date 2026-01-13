@echo off
echo ========================================
echo Build APK cho Android 13
echo ========================================
echo.

echo Bước 1: Kiểm tra đăng nhập EAS...
npx eas-cli whoami
if %errorlevel% neq 0 (
    echo.
    echo Chua dang nhap EAS. Dang nhap...
    echo.
    npx eas-cli login
    if %errorlevel% neq 0 (
        echo.
        echo Loi: Khong the dang nhap. Vui long thu lai.
        pause
        exit /b 1
    )
)

echo.
echo Bước 2: Bat dau build APK...
echo.
npx eas-cli build --platform android --profile preview

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Build thanh cong!
    echo ========================================
    echo.
    echo De xem danh sach builds va tai APK, chay:
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
