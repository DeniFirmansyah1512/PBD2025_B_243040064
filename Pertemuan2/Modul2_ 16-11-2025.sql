--Buat Database TokoRetailDB

CREATE DATABASE TokoRetailDB;

--Gunakan DB TokoRetailDB
USE TokoRetailDB;

--Membuat tabel KategoriProduk
CREATE TABLE KategoriProduk(
   KategoriID INT IDENTITY(1,1) PRIMARY KEY,
   NamaKategori VARCHAR(100) NOT NULL UNIQUE
);

--MEMBUAT TABEL PRODUK
CREATE TABLE produk(
produkID INT IDENTITY(1001,1) PRIMARY KEY,
SKU VARCHAR(20) NOT NULL UNIQUE,
Namaproduk VARCHAR(150) NOT NULL,
Harga DECIMAL(10, 2) not null,
Stok INT NOT NULL,
KategoriID INT NULL,

--harganya gaboleh negatif 
CONSTRAINT  CHK_Hargapositif CHECK (Harga >= 0),
--stoknya gaboleh negatif
CONSTRAINT CHK_stokpositif CHECK (Stok>=0),
--relasikan dengan tabel kategoriproduk melalui kategoriID
CONSTRAINT FK_Produk_Kategori
FOREIGN KEY (kategoriID)
REFERENCES KategoriProduk(kategoriID)
);

--MEMASUKAN DATA KE TABEL KategoriProduk
INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Elektronik'),

INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Pakaian'),
('Buku');

--Menampilkan Tabel kategori
SELECT *
FROM KategoriProduk;

 --HANYA  MENAMPILKAN KATEGORI
SELECT NamaKategori
FROM KategoriProduk;

--MENAMPILKAN DATA KE TABEL PRODUK
INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
VALUES
('ELEC-001', 'Laptop Gaming', 15000000.00, 50,2);

INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
VALUES
('ELEC-002', 'Hp Gaming', 50000000.00, 50,1);

--MENAMPILKAN DATA PRODUK
SELECT * 
FROM Produk;

--MENGUBAH DATA STOK LAPTOP gaming menjadi 30
UPDATE produk
SET Stok = 30
WHERE proudukID = 1001;

--Menghapus Data Hp Gaming
BEGIN TRANSACTION;

DELETE FROM produk 
WHERE proudukID = 1002;

--CEK APAKAH SUDAH TERHAPUS ATAU BELUM
SELECT *
FROM Produk;

COMMIT TRANSACTION;

--MEMAMBAHKAN DATA LAGI KE TABEL PRODUK
INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
VALUES
( 'BAJU-001','KaosPutih',  50000.00,30,2);

INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
VALUES
( 'BAJU-002','KaosPutih',  50000.00,30,2);

SELECT * FROM produk;

--MENGHAPUS KAOS PUTIH
BEGIN TRAN;

DELETE FROM produk
WHERE proudukID = 1004

ROLLBACK TRANSACTION;

COMMIT TRANSACTION





