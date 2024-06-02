# Script Batch Xóa File Rác cho Windows
## Mô tả:
- Script batch này được thiết kế để xóa các tệp tin tạm thời và không cần thiết trên hệ điều hành Windows.
- Mục đích là giúp giải phóng không gian đĩa cứng và cải thiện hiệu suất hệ thống.
- Script này sẽ thực hiện các thao tác xóa các tệp tin tạm, các tệp tin log, các tệp tin đã xóa trong thùng rác, và nhiều hơn nữa.

## Cách sử dụng
### Yêu cầu hệ thống:
- Hệ điều hành Windows (XP, Vista, 7, 8, 10, 11)
- Quyền quản trị viên (Administrator) để có thể xóa các tệp tin hệ thống

### Hướng dẫn:
- Tải xuống hoặc sao chép script batch này vào một tệp tin với đuôi (*.bat).
- **Chạy script với quyền quản trị viên:** Nhấp chuột phải vào tệp batch và chọn "Run as administrator".

- **Theo dõi quá trình xóa file:** Script sẽ hiển thị các bước đang thực hiện và thông báo khi quá trình hoàn tất.
- **Xem kết quả:** Khi quá trình hoàn tất, script sẽ tạm dừng để bạn có thể xem kết quả trước khi cửa sổ cmd đóng lại.

## Nội dung Script:
```python
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
```

### Lưu ý:
- Sao lưu dữ liệu: Trước khi chạy script, đảm bảo rằng bạn đã sao lưu các dữ liệu quan trọng. Script này sẽ xóa vĩnh viễn các tệp tin và không thể phục hồi.
- Quyền quản trị viên: Script yêu cầu quyền quản trị viên để có thể xóa các tệp tin hệ thống. Nếu không chạy với quyền quản trị viên, một số thao tác có thể không thực hiện được.

### Đóng góp:
Nếu bạn có bất kỳ cải tiến nào hoặc phát hiện lỗi, vui lòng gửi một yêu cầu kéo (pull request) hoặc báo cáo lỗi (issue) trên GitHub repository của dự án này.

### Giấy phép
Script này được phát hành dưới giấy phép [MIT](https://github.com/nhanngocduong/Delete-Windows-Temp-Files-CMD?tab=MIT-1-ov-file).
