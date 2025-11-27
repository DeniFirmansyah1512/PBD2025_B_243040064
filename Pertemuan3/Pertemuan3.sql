--Menamampilkan semua data pada taebl produk
SELECT *
FROM Production.Product;

--Menampilkan Nama, ProductNumber, Dan Listprice
SELECT Name, ProductNumber, ListPrice
FROM Production.Product;

--menampilkan data menggunakan alias kolom
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

--menampilkan harga baru = ListPrice * 1.1
SELECT Name, ListPrice, (ListPrice * 1.1) AS HargaBaru
FROM Production.Product;

--menampilkan data dengan menggabungkan string
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.product;

--filterisasi data
-- menampilkan produk yang berwarna red
SELECT Name, Color, ListPrice
FROM Production.Product
Where Color = 'red';

--menampilkan produk yang listprice nya lebih dari 1000
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice < 1000;

--menampilkan produk yang berwarna black list price nya dari 500
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'black' AND ListPrice > 500;

--menampilkan produk yang berwarna red blue black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('red', 'blue', 'black'); 

--menampilkan  produk yang namanya mengandung  kata 'road' 
SELECT Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%Road%';

--agrerisasi Product dan pengemlempokan
--penghitung total baris
 SELECT COUNT (*) AS TotalProduk
 FROM Production.Product;

 --menampilkan warna produk dan jumlah nya
 SELECT Color, COUNT(*) AS JumlahProduk
 FROM Production.Product
 GROUP BY Color;
 
 --menampilkan ProductID, Jumlah orderqty, dan rata rata unitprice
 SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
 FROM Sales.SalesOrderDetail
 GROUP BY ProductID;

 SELECT *
 FROM Sales.SalesOrderDetail

 --menampilkan data dengan grouping lebih dari satu kolom
 SELECT COLOR, SIZE, COUNT(*) AS Jumlah
 FROM Production.Product
 GROUP BY Color,Size
 
 SELECT *
 FROM Production.Product

 --filter hasil agrerasi
 --menampilkan warna produk yang jumlah nya lebih dari 20
 SELECT COLOR, COUNT(*) AS Jumlah
 FROM Production.Product
 GROUP BY Color
 HAVING COUNT(*) > 2;

 --menampilkab warna produk yang ListPrice nya > 500 Dan jumlah nya > 10
 SELECT COLOR, COUNT(*) AS Jumlah
 FROM Production.Product
 WHERE ListPrice > 500
 GROUP BY Color
 HAVING COUNT(*)  < 10;

--menampilkan productid yang jumlah orderqty nya lebih dari 100
SELECT ProductID, SUM(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > 10;

--menampilkan Specialofferid yang ratarata orderqty nya lebihdari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) > 2;

--menampilkan warna yang ListPrice nya lebih dari 3000 menggunakan MAX
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) > 3000;

--advanced select dari Order By
--menampilkan JobTittle tanpa duplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

--menampilkan 5 nama produk termahal DESK, ASC.
SELECT TOP 5 Name ,ListPrice
FROM Production.Product
ORDER BY ListPrice ASC;

--offset fetch
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 2 ROWS 
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC


SELECT TOP 3 COLOR, SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice > 0
GROUP BY Color
ORDER BY TotalNilaiStok DESC;

--TUGAS MANDIRI
--NO 1
SELECT ProductID,
       SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID;


--NO 2
SELECT ProductID, OrderQty, UnitPrice, LineTotal
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2;



--no 3
SELECT ProductID,
       SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID;


--no 4
SELECT ProductID,SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > 30000;


--no 5
SELECT ProductID,
       SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalUang DESC;


--no 6
SELECT TOP 10
       ProductID,
       SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalUang DESC;
























