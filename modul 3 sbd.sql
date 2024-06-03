CREATE TABLE customer (
  id_customer CHAR(6) PRIMARY KEY,
  nama_customer VARCHAR(100) NOT NULL
);

-- Insert data for table `customer`
INSERT INTO customer (id_customer, nama_customer) VALUES
  ('CTR001', 'Budi Santoso'),
  ('CTR002', 'Sisil Triana'),
  ('CTR003', 'Davi Liam'),
  ('CTR004', 'Sutris Ten An'),
  ('CTR005', 'Hendra Asto');

SELECT * FROM customer;

-- Table structure for table `membership`
CREATE TABLE membership (
  id_membership CHAR(6) PRIMARY KEY,
  no_telp_customer VARCHAR(15) NOT NULL,
  alamat_customer VARCHAR(150),
  tanggal_pembuatan DATE,
  tanggal_kedaluwarsa DATE,
  total_poin int NOT NULL,
  m_id_customer CHAR(6) REFERENCES customer(id_customer) ON UPDATE CASCADE
);

-- Insert data for table `membership`
INSERT INTO membership (id_membership, no_telp_customer, alamat_customer, tanggal_pembuatan, tanggal_kedaluwarsa, total_poin, m_id_customer) VALUES
  ('MBR001', '08123456789', 'Jl. Imam Bonjol', '2023-10-24', '2023-11-30', 0, 'CTR001'),
  ('MBR002', '0812345678', 'Jl. Kelinci', '2023-10-24', '2023-11-30', 0, 'CTR002'),
  ('MBR003', '081234567890', 'Jl. Abah Ojak', '2023-10-25', '2023-12-01', 2, 'CTR003'),
  ('MBR004', '08987654321', 'Jl. Kenangan', '2023-10-26', '2023-12-02', 6, 'CTR005');

SELECT * FROM membership;

-- Table structure for table `menu_minuman`
CREATE TABLE menu_minuman (
  id_minuman CHAR(6) PRIMARY KEY,
  nama_minuman VARCHAR(50) NOT NULL,
  harga_minuman float NOT NULL
);

-- Insert data for table `menu_minuman`
INSERT INTO menu_minuman (id_minuman, nama_minuman, harga_minuman) VALUES
  ('MNM001', 'Expresso', 18000),
  ('MNM002', 'Cappucino', 20000),
  ('MNM003', 'Latte', 21000),
  ('MNM004', 'Americano', 19000),
  ('MNM005', 'Mocha', 22000),
  ('MNM006', 'Macchiato', 23000),
  ('MNM007', 'Cold Brew', 21000),
  ('MNM008', 'Iced Coffee', 18000),
  ('MNM009', 'Affogato', 23000),
  ('MNM010', 'Coffee Frappe', 22000);
  
SELECT * FROM menu_minuman;

-- Table structure for table `pegawai`
CREATE TABLE pegawai (
  nik CHAR(16) PRIMARY KEY,
  nama_pegawai VARCHAR(100) NOT NULL,
  jenis_kelamin CHAR(1),
  email VARCHAR(50),
  umur INT NOT NULL,
  telepon VARCHAR(15) NOT NULL
);

-- Insert data for table `pegawai`
INSERT INTO pegawai (nik, nama_pegawai, jenis_kelamin, email, umur, telepon) VALUES
  ('1111222233334444', 'Maimunah', 'P', 'maimunah@gmail.com', 25, '621234567'),
  ('1234567890123456', 'Naufal Raf', 'L', 'naufal@gmail.com', 19, '62123456789'),
  ('2345678901234561', 'Surinala', 'P', 'surinala@gmail.com', 24, '621234567890'),
  ('3456789012345612', 'Ben John', 'L', 'benjohn@gmail.com', 22, '6212345678');

SELECT * FROM pegawai;

-- Table structure for table `transaksi`
CREATE TABLE transaksi (
  id_transaksi CHAR(10) PRIMARY KEY,
  tanggal_transaksi DATE NOT NULL,
  metode_pembayaran VARCHAR(15) NOT NULL,
  customer_id_customer CHAR(6) REFERENCES customer(id_customer) ON DELETE CASCADE ON UPDATE CASCADE,
  pegawai_nik CHAR(16) REFERENCES pegawai(nik) ON UPDATE CASCADE
);

-- Insert data for table `transaksi`
INSERT INTO transaksi (id_transaksi, tanggal_transaksi, metode_pembayaran, customer_id_customer, pegawai_nik) VALUES
  ('TRX0000001', '2023-10-01', 'Kartu kredit', 'CTR002', '2345678901234561'),
  ('TRX0000002', '2023-10-03', 'Transfer bank', 'CTR004', '3456789012345612'),
  ('TRX0000003', '2023-10-05', 'Tunai', 'CTR001', '3456789012345612'),
  ('TRX0000004', '2023-10-15', 'Kartu debit', 'CTR003', '1234567890123456'),
  ('TRX0000005', '2023-10-15', 'E-wallet', 'CTR004', '1234567890123456'),
  ('TRX0000006', '2023-10-21', 'Tunai', 'CTR001', '2345678901234561'),
  ('TRX0000007', '2023-10-03', 'Transfer bank', 'CTR004', '2345678901234561');

SELECT * FROM transaksi;

-- Table structure for table `transaksi_minuman`
CREATE TABLE transaksi_minuman (
  tm_menu_minuman_id CHAR(6) REFERENCES menu_minuman(id_minuman) ON UPDATE CASCADE,
  tm_transaksi_id CHAR(10) REFERENCES transaksi(id_transaksi) ON UPDATE CASCADE,
  jumlah_minuman INT NOT NULL,
  PRIMARY KEY (tm_menu_minuman_id, tm_transaksi_id)
);

-- Insert data for table `transaksi_minuman`
INSERT INTO transaksi_minuman (tm_menu_minuman_id, tm_transaksi_id, jumlah_minuman) VALUES
  ('MNM001', 'TRX0000003', 3),
  ('MNM001', 'TRX0000005', 1),
  ('MNM003', 'TRX0000002', 2),
  ('MNM003', 'TRX0000003', 1),
  ('MNM003', 'TRX0000006', 2),
  ('MNM004', 'TRX0000004', 2),
  ('MNM005', 'TRX0000002', 1),
  ('MNM005', 'TRX0000007', 1),
  ('MNM006', 'TRX0000005', 2),
  ('MNM007', 'TRX0000001', 1),
  ('MNM009', 'TRX0000005', 1),
  ('MNM010', 'TRX0000001', 1),
  ('MNM010', 'TRX0000004', 1);
  
SELECT * FROM transaksi_minuman;  

-- Constraints for table `membership`
ALTER TABLE membership
ADD CONSTRAINT fk_customer_membership FOREIGN KEY (m_id_customer) REFERENCES customer (id_customer) ON UPDATE CASCADE;

-- Constraints for table `transaksi`
ALTER TABLE transaksi
  ADD CONSTRAINT fk_customer_transaksi FOREIGN KEY (customer_id_customer) REFERENCES customer (id_customer) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_pegawai_transaksi FOREIGN KEY (pegawai_nik) REFERENCES pegawai (nik) ON UPDATE CASCADE;

-- Constraints for table `transaksi_minuman`
ALTER TABLE transaksi_minuman
  ADD CONSTRAINT fk_menu_minuman FOREIGN KEY (tm_menu_minuman_id) REFERENCES menu_minuman (id_minuman),
  ADD CONSTRAINT fk_transaksi_minuman FOREIGN KEY (tm_transaksi_id) REFERENCES transaksi (id_transaksi) ON UPDATE CASCADE;

SELECT * FROM transaksi
WHERE tanggal_transaksi BETWEEN '2023-10-10' AND '2023-10-20';

SELECT tm.tm_transaksi_id AS id_transaksi, 
SUM(mm.harga_minuman * tm.jumlah_minuman) AS TOTAL_HARGA
FROM transaksi_minuman tm
JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
GROUP BY tm.tm_transaksi_id;

SELECT c.*, 
COALESCE(SUM(harga_minuman * jumlah_minuman), 0) AS Total_Belanja
FROM customer c
LEFT JOIN transaksi t ON c.id_customer = t.customer_id_customer
LEFT JOIN transaksi_minuman tm ON t.id_transaksi = tm.tm_transaksi_id
LEFT JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
WHERE t.tanggal_transaksi BETWEEN '2023-10-03' AND '2023-10-22'
GROUP BY c.id_customer
ORDER BY c.nama_customer;

SELECT DISTINCT p.*
FROM pegawai p
JOIN transaksi t ON p.nik = t.pegawai_nik
JOIN customer c ON t.customer_id_customer = c.id_customer
WHERE c.nama_customer IN ('Davi Liam', 'Sisil Triana', 'Hendra Asto');

SELECT EXTRACT(MONTH FROM t.tanggal_transaksi) AS BULAN,
       EXTRACT(YEAR FROM t.tanggal_transaksi) AS TAHUN,
       SUM(tm.jumlah_minuman) AS JUMLAH_CUP
FROM transaksi_minuman tm
JOIN transaksi t ON tm.tm_transaksi_id = t.id_transaksi
JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
GROUP BY TAHUN, BULAN
ORDER BY TAHUN DESC, BULAN;

SELECT AVG(Total_Belanja) AS Rata_Rata_Total_Belanja
FROM (
    SELECT c.id_customer, COALESCE(SUM(harga_minuman * jumlah_minuman), 0) AS Total_Belanja
    FROM customer c
    LEFT JOIN transaksi t ON c.id_customer = t.customer_id_customer
    LEFT JOIN transaksi_minuman tm ON t.id_transaksi = tm.tm_transaksi_id
    LEFT JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
    GROUP BY c.id_customer
) Customer_Total_Belanja;

SELECT c.id_customer, c.nama_customer, COALESCE(SUM(harga_minuman * jumlah_minuman), 0) AS Total_Belanja
FROM customer c
LEFT JOIN transaksi t ON c.id_customer = t.customer_id_customer
LEFT JOIN transaksi_minuman tm ON t.id_transaksi = tm.tm_transaksi_id
LEFT JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
GROUP BY c.id_customer, c.nama_customer
HAVING COALESCE(SUM(harga_minuman * jumlah_minuman), 0) > (
    SELECT AVG(Total_Belanja)
    FROM (
        SELECT COALESCE(SUM(harga_minuman * jumlah_minuman), 0) AS Total_Belanja
        FROM transaksi_minuman tm
        JOIN transaksi t ON tm.tm_transaksi_id = t.id_transaksi
        JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
        GROUP BY t.customer_id_customer
    ) AS Customer_Total_Belanja
);

SELECT c.*
FROM customer c
LEFT JOIN membership m ON c.id_customer = m.m_id_customer
WHERE m.id_membership IS NULL;

SELECT COUNT(DISTINCT t.customer_id_customer) AS Jumlah_Customer_Latte
FROM transaksi_minuman tm
JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
JOIN transaksi t ON tm.tm_transaksi_id = t.id_transaksi
WHERE mm.nama_minuman = 'Latte';

SELECT c.nama_customer, mm.nama_minuman, SUM(tm.jumlah_minuman) AS Jumlah_Cup
FROM customer c
JOIN transaksi t ON c.id_customer = t.customer_id_customer
JOIN transaksi_minuman tm ON t.id_transaksi = tm.tm_transaksi_id
JOIN menu_minuman mm ON tm.tm_menu_minuman_id = mm.id_minuman
WHERE c.nama_customer LIKE 'S%'
GROUP BY c.nama_customer, mm.nama_minuman;