#!/bin/bash

# Parametre kontrolü
if [ -z "$1" ]; then
    echo "Hata: Kopyalanacak dizin belirtilmedi."
    exit 1
fi

# Dizin var mı kontrolü
if [ ! -d "$1" ]; then
    echo "Hata: Belirtilen dizin mevcut değil."
    exit 1
fi

# Yedekleme adı ve dizini oluşturma
name="backup_$(date '+%Y-%m-%d_%H-%M-%S')"
backup_dir="/tmp/$name"

mkdir "$backup_dir"

# Belirtilen dizindeki backup formatında olmayan dosya ve dizinleri kopyala
find "$1" -mindepth 1 -maxdepth 1 ! -name 'backup_*' -print0 | xargs -0 -I {} cp -rf {} "$backup_dir"

# Yedekleme dizinini hedef dizine taşı
mv "$backup_dir" "$1/$name"

# Eğer 3'ten fazla yedekleme varsa, en eski yedeklemeleri sil
backup_dirs=$(find "$1" -maxdepth 1 -type d -name 'backup_*' | sort)
backup_count=$(echo "$backup_dirs" | wc -l)

if [ "$backup_count" -gt 3 ]; then
    excess_count=$((backup_count - 3))
    counter=0

    # Eski yedeklemeleri sil
    for dir in $backup_dirs; do
        if [ $counter -ge $excess_count ]; then
            break
        fi

        echo "Siliniyor: $dir"
        rm -rf "$dir"
        counter=$((counter + 1))
    done

    echo "$excess_count fazla yedekleme silindi."
fi

echo "Yedekleme tamamlandı: $1/$name"

