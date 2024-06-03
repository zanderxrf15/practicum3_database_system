-- Anggota table
CREATE TABLE Anggota (
    a_id CHAR(5) PRIMARY KEY NOT NULL,
    a_nama VARCHAR(60) NOT NULL,
    a_nrp VARCHAR(12) NOT NULL,
    a_jurusan VARCHAR(60) NOT NULL,
    a_email VARCHAR(60) NOT NULL,
    a_tgl_registrasi DATE NOT NULL
);

INSERT INTO Anggota VALUES
('A001', 'Budi Santoso', '5025211142', 'Teknik Informatika', 'budi.santoso@example.com', '2023-11-23'),
('A002', 'Citra Wijaya', '5025211155', 'Manajemen', 'citra.wijaya@example.com', '2023-11-24'),
('A003', 'Dewi Setiawati', '5025211168', 'Psikologi', 'dewi.setiawati@example.com', '2023-11-25'),
('A004', 'Eko Prasetyo', '5025211171', 'Hukum', 'eko.prasetyo@example.com', '2023-11-26'),
('A005', 'Fitriani Cahyani', '5025211184', 'Ekonomi', 'fitriani.cahyani@example.com', '2023-11-27'),
('A006', 'Gunawan Susanto', '5025211197', 'Desain Grafis', 'gunawan.susanto@example.com', '2023-11-28'),
('A007', 'Hani Lestari', '5025211200', 'Fisika', 'hani.lestari@example.com', '2023-11-29'),
('A008', 'Irfan Setiawan', '5025211213', 'Biologi', 'irfan.setiawan@example.com', '2023-11-30'),
('A009', 'Joko Wibowo', '5025211226', 'Kimia', 'joko.wibowo@example.com', '2023-12-01'),
('A010', 'Kartika Sari', '5025211239', 'Bahasa Inggris', 'kartika.sari@example.com', '2023-12-02');

SELECT * FROM Anggota;

-- Petugas table
CREATE TABLE Petugas (
    p_id CHAR(5) PRIMARY KEY NOT NULL,
    p_nama VARCHAR(60) NOT NULL,
    p_email VARCHAR(60) NOT NULL,
    p_no_telp VARCHAR(15) NOT NULL,
    p_alamat VARCHAR(60) NOT NULL
);

INSERT INTO Petugas VALUES
('P001', 'Anita Widjaja', 'anita.widjaja@example.com', '08123456789', 'Jl. Merdeka No. 123'),
('P002', 'Budi Prasetyo', 'budi.prasetyo@example.com', '08987654321', 'Jl. Pahlawan No. 456'),
('P003', 'Citra Rahayu', 'citra.rahayu@example.com', '08555123456', 'Jl. Pelangi No. 789'),
('P004', 'Dharma Setiawan', 'dharma.setiawan@example.com', '08998887777', 'Jl. Mawar No. 321'),
('P005', 'Eka Suryanto', 'eka.suryanto@example.com', '08111222333', 'Jl. Cendana No. 654'),
('P006', 'Fiona Marwah', 'fiona.marwah@example.com', '08445556666', 'Jl. Anggrek No. 876'),
('P007', 'Galih Wijaya', 'galih.wijaya@example.com', '08778889999', 'Jl. Maple No. 234'),
('P008', 'Hanifah Fitriani', 'hanifah.fitriani@example.com', '08223334444', 'Jl. Pinus No. 567'),
('P009', 'Irfan Santoso', 'irfan.santoso@example.com', '08667778888', 'Jl. Jawa No. 890'),
('P010', 'Jasmine Pratiwi', 'jasmine.pratiwi@example.com', '08334445555', 'Jl. Sumatera No. 123');

SELECT * FROM Petugas;

-- Rak_Buku table
CREATE TABLE Rak_Buku (
    rb_id SERIAL PRIMARY KEY,
    rb_nama VARCHAR(30) NOT NULL,
    rb_lokasi VARCHAR(60) NOT NULL
);

INSERT INTO Rak_Buku (rb_nama, rb_lokasi) VALUES
('Rak A', 'Lantai 1, Area Fiksi'),
('Rak B', 'Lantai 2, Area Sains'),
('Rak C', 'Lantai 3, Area Sejarah'),
('Rak D', 'Lantai 1, Area Anak-anak'),
('Rak E', 'Lantai 2, Area Seni'),
('Rak F', 'Lantai 3, Area Agama'),
('Rak G', 'Lantai 1, Area Teknologi'),
('Rak H', 'Lantai 2, Area Referensi'),
('Rak I', 'Lantai 3, Area Pendidikan'),
('Rak J', 'Lantai 1, Area Bisnis');

SELECT * FROM Rak_Buku;

-- Buku table
CREATE TABLE Buku (
    b_kode CHAR(5) PRIMARY KEY,
    b_judul VARCHAR(30),
    b_penulis VARCHAR(60),
    b_penerbit VARCHAR(60),
    b_tahun_terbit INT,
    Rak_Buku_rb_id SERIAL,
    FOREIGN KEY (Rak_Buku_rb_id) REFERENCES Rak_Buku(rb_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Buku VALUES
('B011', 'Cinta dan Air Mata', 'Lia Susanti', 'Pustaka Abadi', 2015, 1),
('B012', 'Langit Senja di Jakarta', 'Agus Pramana', 'Cahaya Bangsa', 2018, 2),
('B013', 'Hujan di Tengah Malam', 'Dewi Kusuma', 'Karya Nusantara', 2019, 3),
('B014', 'Pulang ke Desa', 'Hendra Saputra', 'Pustaka Emas', 2017, 4),
('B015', 'Rindu di Ujung Jalan', 'Ani Wijaya', 'Lentera Cinta', 2020, 5),
('B016', 'Sejuta Bintang Terang', 'Bambang Prasetyo', 'Pustaka Mulia', 2016, 6),
('B017', 'Cerita dari Gunung Merapi', 'Nia Kartika', 'Citra Pustaka', 2014, 7),
('B018', 'Pelukis Langit Bali', 'Ilham Santoso', 'Senja Pena', 2021, 8),
('B019', 'Seruling Senja di Kalimantan', 'Joko Susanto', 'Citra Pustaka', 2013, 9),
('B020', 'Pagi di Pantai Sulawesi', 'Kartini Sari', 'Bumi Nusantara', 2012, 10);

SELECT * FROM Buku;

-- Transaksi_Peminjaman table
CREATE TABLE Transaksi_Peminjaman (
    tp_id CHAR(5) PRIMARY KEY,
    tp_tgl_pinjam DATE,
    tp_tgl_kembali DATE,
    tp_denda FLOAT,
    Anggota_a_id CHAR(5),
    Petugas_p_id CHAR(5),
    FOREIGN KEY (Anggota_a_id) REFERENCES Anggota(a_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Petugas_p_id) REFERENCES Petugas(p_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Transaksi_Peminjaman VALUES
('T001', '2023-11-01', '2023-11-10', 0, 'A001', 'P001'),
('T002', '2023-11-03', '2023-11-12', 0, 'A002', 'P002'),
('T003', '2023-11-05', '2023-11-15', 0, 'A003', 'P003'),
('T004', '2023-11-07', '2023-11-18', 3000, 'A004', 'P004'),
('T005', '2023-11-09', '2023-11-20', 0, 'A005', 'P005'),
('T006', '2023-11-11', '2023-11-22', 0, 'A006', 'P006'),
('T007', '2023-11-13', '2023-11-24', 20000, 'A007', 'P007'),
('T008', '2023-11-15', '2023-11-26', 0, 'A008', 'P008'),
('T009', '2023-11-17', '2023-11-28', 10000, 'A009', 'P009'),
('T010', '2023-11-19', '2023-11-30', 0, 'A010', 'P010');

SELECT * FROM Transaksi_Peminjaman;

-- Transaksi_Peminjaman_Buku table
CREATE TABLE Transaksi_Peminjaman_Buku (
    Transaksi_Peminjaman_tp_id CHAR(5),
    Buku_b_kode CHAR(5),
    PRIMARY KEY (Transaksi_Peminjaman_tp_id, Buku_b_kode),
    FOREIGN KEY (Transaksi_Peminjaman_tp_id) REFERENCES Transaksi_Peminjaman(tp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Buku_b_kode) REFERENCES Buku(b_kode) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Transaksi_Peminjaman_Buku (Transaksi_Peminjaman_tp_id, Buku_b_kode) VALUES
('T001', 'B011'),
('T002', 'B012'),
('T003', 'B013'),
('T004', 'B014'),
('T005', 'B015'),
('T006', 'B016'),
('T007', 'B017'),
('T007', 'B016'),
('T008', 'B018'),
('T009', 'B019'),
('T010', 'B020');

SELECT * FROM Transaksi_Peminjaman_Buku;

SELECT * FROM Transaksi_Peminjaman
WHERE Petugas_p_id IN ('P001', 'P005', 'P010');

SELECT * FROM Transaksi_Peminjaman
WHERE tp_tgl_pinjam = '2023-11-15';

SELECT Anggota_a_id, a_nama, COUNT(tp_id) AS total_transactions 
FROM Transaksi_Peminjaman 
JOIN Anggota ON Transaksi_Peminjaman.Anggota_a_id = Anggota.a_id 
GROUP BY Anggota_a_id, a_nama
HAVING COUNT(tp_id) >= 1;

SELECT DISTINCT a_nama, a_jurusan 
FROM Transaksi_Peminjaman 
JOIN Anggota ON Transaksi_Peminjaman.Anggota_a_id = Anggota.a_id;

SELECT rb_nama, COUNT(b_kode) AS number_of_books 
FROM Buku 
JOIN Rak_Buku ON Buku.Rak_Buku_rb_id = Rak_Buku.rb_id 
GROUP BY rb_nama 
HAVING COUNT(b_kode) < 2 
ORDER BY COUNT(b_kode) DESC;

SELECT * FROM Anggota 
WHERE a_jurusan = 'Teknik Informatika' 
AND (a_email LIKE '%@example.com' OR a_nama LIKE 'B%');

SELECT A.a_id, A.a_nama, MIN(B.b_tahun_terbit) AS earliest_publication_year
FROM Anggota A
JOIN Transaksi_Peminjaman TP ON A.a_id = TP.Anggota_a_id
JOIN Transaksi_Peminjaman_Buku TPB ON TP.tp_id = TPB.Transaksi_Peminjaman_tp_id
JOIN Buku B ON TPB.Buku_b_kode = B.b_kode
GROUP BY A.a_id, A.a_nama;

SELECT B2.*
FROM Buku B1
JOIN Transaksi_Peminjaman_Buku TPB ON B1.b_kode = TPB.Buku_b_kode
JOIN Transaksi_Peminjaman TP ON TPB.Transaksi_Peminjaman_tp_id = TP.tp_id
JOIN Buku B2 ON TPB.Buku_b_kode = B2.b_kode
WHERE TP.tp_denda = (SELECT MAX(tp_denda) FROM Transaksi_Peminjaman);

SELECT COUNT(tp_id) AS number_of_transactions, SUM(tp_denda) AS total_fine
FROM Transaksi_Peminjaman;

SELECT A.a_id, A.a_nama, COUNT(TPB.Buku_b_kode) AS number_of_books_borrowed
FROM Anggota A
JOIN Transaksi_Peminjaman TP ON A.a_id = TP.Anggota_a_id
JOIN Transaksi_Peminjaman_Buku TPB ON TP.tp_id = TPB.Transaksi_Peminjaman_tp_id
JOIN Buku B ON TPB.Buku_b_kode = B.b_kode
WHERE B.b_judul LIKE '%Cinta%'
GROUP BY A.a_id, A.a_nama;
