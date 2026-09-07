@echo off
setlocal EnableExtensions

chcp 65001 >nul
cd /d "%~dp0"

if not exist "..\httptoolkit-ui\package.json" (
    echo Không tìm thấy repo httptoolkit-ui tại ..\httptoolkit-ui
    echo Clone repo UI cạnh httptoolkit-desktop rồi chạy lại.
    pause
    exit /b 1
)

where node >nul 2>&1
if errorlevel 1 (
    echo Cần cài Node.js ^>= 22 và thêm vào PATH.
    pause
    exit /b 1
)

echo.
echo Nếu HTTP Toolkit Desktop đang mở, hãy đóng hết cửa sổ Electron trước.
echo.

echo [1/3] Khởi động UI + server trong cửa sổ mới...
start "HTTP Toolkit UI" cmd /k "cd /d ""%~dp0"" && npm run start:ui"

echo [2/3] Chờ webpack trên http://localhost:8080 ...
powershell -NoProfile -Command ^
  "$deadline = (Get-Date).AddMinutes(3); " ^
  "while ((Get-Date) -lt $deadline) { " ^
  "  if ((Test-NetConnection -ComputerName 127.0.0.1 -Port 8080 -WarningAction SilentlyContinue).TcpTestSucceeded) { exit 0 }; " ^
  "  Start-Sleep -Seconds 1 " ^
  "}; exit 1"
if errorlevel 1 (
    echo.
    echo Hết thời gian chờ cổng 8080.
    echo Nếu webpack chạy cổng khác ^(ví dụ 8081^), đặt APP_URL rồi chạy: npm run start:dev
    pause
    exit /b 1
)

echo [2/3] Chờ server trên cổng 45457 ...
powershell -NoProfile -Command ^
  "$deadline = (Get-Date).AddMinutes(3); " ^
  "while ((Get-Date) -lt $deadline) { " ^
  "  if ((Test-NetConnection -ComputerName 127.0.0.1 -Port 45457 -WarningAction SilentlyContinue).TcpTestSucceeded) { exit 0 }; " ^
  "  Start-Sleep -Seconds 1 " ^
  "}; exit 1"
if errorlevel 1 (
    echo.
    echo Chưa thấy server trên 45457; vẫn thử mở Electron...
)

echo [3/3] Khởi động Electron dev...
call npm run start:dev

endlocal
