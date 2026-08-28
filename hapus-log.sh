#!/bin/bash

#Menampilkan penggunaan disk journal sebelum penghapusan
echo "============================================"
echo "Penggunaan journal SEBELUM penghapusan"
echo "============================================"
journalctl --disk-usage

echo ""
echo "memulai penghapusan journal..."
sleep 2

#Menghapus journal sampai penggunaan maksimal sekitar 10 MB
while true
do
    journalctl --vacuum-size=10M

    sleep 1

    #Mengecek kembali penggunaan journal
    journalctl --disk-usage

    #Vacuum-size sudah melakukan penghapusan hingga target
    #Perulangan dihentikan setelah proses selesai
    break
done

echo ""
echo "==========================================="
echo "Penggunaan journal SETELAH penghapusan"
echo "==========================================="
journal ctl --disk-usage
