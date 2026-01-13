# Script tự động build APK với EAS
$env:EXPO_TOKEN = "xbbUwAcG-ZlPcYeskQmh-GG_llkyK-waNOVe4MYo"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Build APK cho Android 13" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Kiểm tra đăng nhập
Write-Host "Bước 1: Kiểm tra đăng nhập..." -ForegroundColor Yellow
$whoami = npx eas-cli whoami 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Chưa đăng nhập. Đang đăng nhập..." -ForegroundColor Yellow
    npx eas-cli whoami
}

Write-Host ""
Write-Host "Bước 2: Tạo Android credentials (keystore)..." -ForegroundColor Yellow
Write-Host "LƯU Ý: Bạn cần tạo keystore lần đầu tiên." -ForegroundColor Red
Write-Host "Chạy lệnh sau và chọn các option:" -ForegroundColor Yellow
Write-Host "  npx eas-cli credentials --platform android" -ForegroundColor White
Write-Host ""
Write-Host "Khi được hỏi:" -ForegroundColor Yellow
Write-Host "  1. Chọn build profile: preview" -ForegroundColor Gray
Write-Host "  2. Chọn: Set up a new Android Keystore" -ForegroundColor Gray
Write-Host "  3. Chọn: Generate a new Keystore" -ForegroundColor Gray
Write-Host ""

$createKeystore = Read-Host "Bạn đã tạo keystore chưa? (y/n)"
if ($createKeystore -ne "y" -and $createKeystore -ne "Y") {
    Write-Host ""
    Write-Host "Vui lòng tạo keystore trước bằng lệnh:" -ForegroundColor Red
    Write-Host "  npx eas-cli credentials --platform android" -ForegroundColor White
    Write-Host ""
    exit 1
}

Write-Host ""
Write-Host "Bước 3: Bắt đầu build APK..." -ForegroundColor Yellow
Write-Host ""

npx eas-cli build --platform android --profile preview

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Build thành công!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Để xem danh sách builds và tải APK:" -ForegroundColor Yellow
    Write-Host "  npx eas-cli build:list" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "Build thất bại!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
}
