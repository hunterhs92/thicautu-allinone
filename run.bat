@echo off
title All Game by @thic_autu
chcp 65001 >nul
if not exist venv (
    echo Đang tạo biến môi trường...
    python -m venv venv
)

echo Activating biến môi trường...
call venv\Scripts\activate

if not exist venv\Lib\site-packages\installed (
    if exist requirements.txt (
        echo Đang cài đặt wheel để cài đặt nhanh hơn
        pip install wheel
        echo Đang cài đặt các dependencies...
        pip install -r requirements.txt
        echo. > venv\Lib\site-packages\installed
    ) else (
        echo requirements.txt không tồn tại, bỏ qua việc cài đặt dependencies.
    )
) else (
        echo Dependencies đã được cài đặt, bỏ qua việc cài đặt.
    )

:loop
python main.py
echo Đang khởi động lại chương trình sau 30 giây...
timeout /t 30 /nobreak >nul
goto :loop

