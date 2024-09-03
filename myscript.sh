#!/bin/bash

#دریافت فایل اول و دوم از کاربر به همراه متن پیغام و ذخیره آن در متفیر
read -p "please enter first file: " file1
read -p "please enter second file: " file2

#بررسی موجود بودن و صحت فایل اول و ارسال پیغام
if [ -f "$file1" ]; then
    echo "first file is recieved: $file1"
else
    echo "first file not found"
    exit 1
fi

#بررسی موجود بودن و صحت فایل دوم و ارسال پیغام
if [ -f "$file2" ]; then
    echo "second file is recieved: $file2"
else
    echo "second file not found"
    exit 1
fi

awk 'NR%2{printf "%s ", $0; next} 1' $file1>tempfile1
awk 'NR%2{printf "%s ", $0; next} 1' $file2>tempfile2

diff -u tempfile1 tempfile2 | grep -E "^\-|\+"

