# Hướng dẫn Build APK cho Android 13

## Cách 1: Build với EAS (Khuyến nghị - Không cần Android Studio)

### ⚡ Cách nhanh nhất - Chạy script tự động:

**Windows:**
```bash
cd LibraryManagementApp
build-apk.bat
```

**Mac/Linux:**
```bash
cd LibraryManagementApp
chmod +x build-apk.sh
./build-apk.sh
```

### 📝 Cách thủ công:

#### Bước 1: Đăng nhập EAS
```bash
cd LibraryManagementApp
npx eas-cli login
```
- Nhập email và password của tài khoản Expo
- Nếu chưa có tài khoản, đăng ký tại: https://expo.dev/signup

#### Bước 2: Build APK
```bash
npx eas-cli build --platform android --profile preview
```

Hoặc sử dụng npm script:
```bash
npm run build:android
```

#### Bước 3: Tải APK
- Sau khi build xong, EAS sẽ cung cấp link tải APK trong terminal
- Hoặc chạy lệnh sau để xem danh sách builds:
```bash
npx eas-cli build:list
```
- Click vào link trong terminal để tải APK về máy

---

## Cách 2: Build Local APK (Cần Android Studio)

### Yêu cầu:
- Android Studio đã cài đặt
- Android SDK đã được cấu hình
- Java JDK đã cài đặt

### Bước 1: Prebuild (tạo native code)
```bash
cd LibraryManagementApp
npx expo prebuild --platform android
```

### Bước 2: Build APK
```bash
npx expo run:android --variant release
```

Hoặc sử dụng Android Studio:
1. Mở Android Studio
2. Mở thư mục `LibraryManagementApp/android`
3. Build > Generate Signed Bundle / APK
4. Chọn APK
5. Tạo keystore hoặc sử dụng keystore có sẵn
6. Build

APK sẽ được tạo tại: `LibraryManagementApp/android/app/build/outputs/apk/release/app-release.apk`

---

## Cấu hình đã được thiết lập:

✅ `eas.json` - Cấu hình EAS Build
✅ `app.json` - Đã thêm:
   - `package`: com.librarymanagementapp
   - `versionCode`: 1
   - `targetSdkVersion`: 33 (Android 13)

## Lưu ý:
- Android 13 = API Level 33
- `targetSdkVersion: 33` đã được cấu hình trong `app.json`
- APK sẽ tương thích với Android 13 và các phiên bản cũ hơn
