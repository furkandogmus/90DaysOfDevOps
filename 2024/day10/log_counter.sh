#!/bin/bash

# Çıkış dosyasının yolu
output_file="/var/log/error_count.log"

# Mevcut error_count.log dosyasını temizle
> "$output_file"

# Geçici dosya oluştur
temp_file=$(mktemp)

# Tüm dosyaları ve alt dizinleri tarayıp ERROR sayısını hesapla
total_errors=0

find /var/log -type f | while read -r log_file; do
    # Dosyanın içeriğinde ERROR arama
    error_count=$(grep -a -e ERR -e FAIL "$log_file" | wc -l)
    total_errors=$((total_errors + error_count))
    echo "$error_count $log_file" >> "$temp_file"
done

# Hata sayılarına göre sıralama yap ve çıkış dosyasına yaz
sort -nr "$temp_file" | awk '{print $2 ": " $1 " errors"}' > "$output_file"
echo "Total ERROR count: $total_errors" >> "$output_file"

# Geçici dosyayı sil
rm "$temp_file"

echo "Error count has been written to $output_file"

