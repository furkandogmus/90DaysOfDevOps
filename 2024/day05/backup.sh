#!/bin/bash

dosya=$1
yedek_dizin=$2

dosya_ismi=$(basename "$dosya")
tarih=$(date +"%Y%m%d_%H%M%S")

tar_dosya="$dosya_ismi-$tarih.tar.gz"

tar -czf "$tar_dosya" "$dosya"

mv "$tar_dosya" "$yedek_dizin"

ls $yedek_dizin/$dosya_ismi* 
