# Portfolio 1 — Executive Sales Dashboard

Dashboard dan analisis penjualan yang dapat dipakai CEO / Sales Director untuk
memonitor performa penjualan ritel **Superstore** (2015–2018).

## 📊 Hasil Utama
| Metrik | Nilai |
|---|---|
| Total Sales | **$2,297,201** |
| Total Profit | **$286,397** |
| Total Orders | **5,009** |
| Profit Margin | **12.47%** |
| Avg Order Value | **$458.61** |

**Insight inti:** Penjualan sehat, tapi **profitabilitas tipis**. Penyebab utama adalah
kategori **Furniture** — sub-kategori *Tables, Bookcases, Supplies* dijual rugi akibat
**diskon agresif**. Region **Central** punya margin terendah (7.9%).

## 📁 Isi Folder
| File | Keterangan |
|---|---|
| `data/superstore_raw.csv` | Dataset mentah (10.800 baris, masih kotor) |
| `data/superstore_clean.csv` | Dataset bersih siap analisis (9.994 baris) |
| `Superstore_Analysis.ipynb` | Notebook: cleaning + EDA + visualisasi (sudah dieksekusi) |
| `queries.sql` | Query PostgreSQL: KPI, region, kategori, bulanan, top customer/product |
| `Executive_Sales_Dashboard.html` | Dashboard interaktif (buka di browser, filter Region & Year) |
| `Sales_Summary.xlsx` | Ringkasan Excel multi-sheet |
| `Executive_Summary.pdf` | Rangkuman cerita project + insight + rekomendasi |

## 🧹 Proses Data Cleaning
`10.800` → hapus **504 duplikat** → `10.296` → hapus **302 baris sampah** → **9.994 baris bersih**.
Termasuk: konversi format tanggal, pembulatan currency, standarisasi nama produk,
pengisian postal code Vermont yang kosong.

## 🛠️ Tools
Python (pandas, numpy, matplotlib, seaborn) · SQL (PostgreSQL) · Excel · HTML/Chart.js

## ▶️ Cara Pakai
```bash
pip install -r requirements.txt
jupyter notebook Superstore_Analysis.ipynb     # jalankan analisis
# Buka Executive_Sales_Dashboard.html langsung di browser
```

> Catatan: dashboard dibuat dalam HTML interaktif (pengganti Power BI .pbix yang formatnya
> proprietary). Tampilan & fungsi setara dashboard eksekutif: KPI, tren, breakdown region/kategori,
> top product/customer, dan matriks profitabilitas Region × Category.
