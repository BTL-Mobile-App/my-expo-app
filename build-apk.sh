#!/bin/bash

echo "========================================"
echo "Build APK cho Android 13"
echo "========================================"
echo ""

echo "Bước 1: Kiểm tra đăng nhập EAS..."
npx eas-cli whoami

if [ $? -ne 0 ]; then
    echo ""
    echo "Chưa đăng nhập EAS. Đang đăng nhập..."
    echo ""
    npx eas-cli login
    if [ $? -ne 0 ]; then
        echo ""
        echo "Lỗi: Không thể đăng nhập. Vui lòng thử lại."
        exit 1
    fi
fi

echo ""
echo "Bước 2: Bắt đầu build APK..."
echo ""
npx eas-cli build --platform android --profile preview

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "Build thành công!"
    echo "========================================"
    echo ""
    echo "Để xem danh sách builds và tải APK, chạy:"
    echo "  npx eas-cli build:list"
    echo ""
else
    echo ""
    echo "========================================"
    echo "Build thất bại!"
    echo "========================================"
    echo ""
fi
