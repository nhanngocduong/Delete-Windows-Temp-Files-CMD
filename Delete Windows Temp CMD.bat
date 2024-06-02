@echo off
color 0A
title Xoa file rac cho Windows
:: Tắt echo cho các lệnh tiếp theo
@echo off

:: Hiển thị tiêu đề và thông tin
echo ============================================================
echo         XOA FILE RAC CHO WINDOWS
echo ============================================================
echo.
echo Bat dau qua trinh xoa file rac...

:: Xóa các file tạm và không cần thiết từ ổ hệ thống
echo.
echo [*] Dang xoa cac file tam tren o dia he thong...
del /f /s /q %systemdrive%\*.tmp 2>nul
del /f /s /q %systemdrive%\*._mp 2>nul
del /f /s /q %systemdrive%\*.log 2>nul
del /f /s /q %systemdrive%\*.gid 2>nul
del /f /s /q %systemdrive%\*.chk 2>nul
del /f /s /q %systemdrive%\*.old 2>nul

:: Xóa các tệp trong thư mục Recycle Bin (Thùng rác)
echo [*] Dang xoa cac file trong thung rac...
del /f /s /q %systemdrive%\$Recycle.Bin\*.* 2>nul

:: Xóa các tệp sao lưu và các tệp trong thư mục Prefetch
echo [*] Dang xoa cac file sao luu va Prefetch...
del /f /s /q %windir%\*.bak 2>nul
del /f /s /q %windir%\prefetch\*.* 2>nul

:: Xóa và tái tạo thư mục Temp trong thư mục Windows
echo [*] Dang xoa va tai tao thu muc Temp cua Windows...
rd /s /q %windir%\temp & md %windir%\temp

:: Xóa cookies và các tệp tạm của người dùng
echo [*] Dang xoa cookies va cac file tam cua nguoi dung...
del /f /q %userprofile%\cookies\*.* 2>nul
del /f /q %userprofile%\recent\*.* 2>nul
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" 2>nul
del /f /s /q "%userprofile%\Local Settings\Temp\*.*" 2>nul
del /f /s /q "%userprofile%\recent\*.*" 2>nul

:: Thông báo quá trình hoàn tất
echo.
echo ============================================================
echo        Qua trinh quet rac da hoan tat.
echo ============================================================

:: Tạm dừng để xem kết quả
pause
