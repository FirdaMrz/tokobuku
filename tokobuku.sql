-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Sep 2024 pada 08.41
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokobuku`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getallbuku` (IN `buku_id` INT)   BEGIN
    SELECT * FROM buku WHERE id_buku = buku_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(225) NOT NULL,
  `noisbn` varchar(50) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `tahun` int(4) NOT NULL,
  `stok` int(50) NOT NULL,
  `harga_pokok` int(50) NOT NULL,
  `keuntungan` int(50) NOT NULL,
  `harga_jual` int(50) NOT NULL,
  `ppn` int(2) NOT NULL,
  `diskon` int(2) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `noisbn`, `penulis`, `penerbit`, `tahun`, `stok`, `harga_pokok`, `keuntungan`, `harga_jual`, `ppn`, `diskon`, `foto`) VALUES
(1, 'Seni - Apa Itu?', '9792141170', 'Michael Hauskeller', 'Kanisius', 2014, 271, 45500, 0, 47000, 0, 0, '7074131698661450Seni.jpg'),
(3, 'Zaman Kalasurasa', '9791684472', 'Agus Wahyudi', 'Narasi', 2015, 162, 55000, 0, 56100, 2, 0, '5235446763961427zaman kadaluarsa.jpg'),
(8, 'Tarian Dua Wajah', '6029193864', 'S. Prasetyo Utomo', 'Pustaka Alpabet', 2016, 13, 52500, 0, 54000, 0, 0, '9700666711048356tarian dua wajah.jpg'),
(14, 'Filologi Indonesia', '6021186281', 'Oman Fathurahman', 'Kencana', 2015, 14, 45000, 0, 46000, 0, 0, '1796600435394552filologi indonesia.jpg'),
(15, 'Kebudayaan di Nusantara', '6029402412', 'Edi Sedyawati', 'Komunitas Bambu', 2014, 620, 160000, 0, 160000, 0, 0, '4326352036941590kebudayaan di indonesia.jpg'),
(16, 'Kretek Indonesia', '6021217039', 'S. Margana', 'Sejarah FIB UGM', 2014, 20, 85300, 0, 86000, 0, 0, '2188850363326795kretek-indonesia.jpg'),
(17, 'Mengenal Wayang', '6027723238', 'Ardian Kresna', 'LAKSANA', 2012, 10, 65000, 0, 65000, 0, 0, '8075789484305002mengenal wayang.jpg'),
(18, 'Budaya Media Bahasa', '6028252522', 'Stuart Hall', 'Jalasutra', 2011, 4, 50000, 0, 50000, 0, 0, '8145550508017259budaya media bahasa.jpg'),
(19, '100 Keajaiban Indonesia', '6028526320', 'Tim Sunrise Pictures', 'Cikal Aksara', 2010, 75, 30000, 0, 30000, 0, 0, '6330436667981302100 keajaiban indonesia.jpg'),
(20, 'The Papua Paradox', '9792916458', 'Drs. Gasper Liauw,M.Si', 'Andi Publisher', 2010, 10, 78300, 0, 78300, 0, 0, '7015202433351114the papua.jpg'),
(21, 'Defending Indonesia', '9792244344', 'Connie Rahakundini Bakrie', 'Gramedia Pustaka Utama', 2009, 155, 57000, 0, 57000, 0, 0, '9762919874906924defending indonesia.jpg'),
(22, 'Komunikasi Antar Budaya', '9792573771', 'Dadan Anugrah', 'Jala Permata Aksara', 2008, 15, 46000, 0, 46000, 0, 0, '1276471887216890komunikasi antar budaya.png'),
(23, '40 Days In Europe', '9791227128', 'Maulana M. Syuhada', 'Bentang Pustaka', 2007, 17, 68000, 0, 68000, 0, 0, '429837973344347240 days in eroupe.jpg'),
(24, 'Agama Dan Peradaban', '9795235664', 'Hisanori Kato', 'Dian Rakyat', 2007, 25, 57000, 0, 57000, 0, 0, '7904028349810605agama dan peradaban.jpg'),
(27, 'One Piece', '123456789', 'Oda Sensei', 'Shueisha', 1997, 200, 50000, 0, 50500, 1, 0, '60881402133883184176409798871189one piece.jpg'),
(28, 'Naruto', '987654321', 'Masashi Kishimoto', 'Shueisha', 2007, 100, 50000, 5, 52505, 5, 0, '1504885369432430naruto.jpg'),
(29, 'Spy X Family', '22113455', '	Tatsuya End?', 'Shueisha', 2022, 120, 35000, 2, 36052, 3, 0, '4628074346462729spy x family.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_penjualan` int(50) NOT NULL,
  `id_buku` int(50) NOT NULL,
  `id_kasir` int(50) NOT NULL,
  `harga_jual` int(50) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `total` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id_penjualan`, `id_buku`, `id_kasir`, `harga_jual`, `jumlah`, `total`) VALUES
(39, 23, 2, 70500, 1, 70500),
(39, 18, 2, 51500, 1, 51500),
(39, 14, 2, 47000, 1, 47000),
(40, 1, 2, 47000, 4, 188000),
(41, 1, 2, 47000, 1, 47000),
(42, 1, 2, 47000, 4, 188000),
(42, 3, 2, 55000, 1, 55000),
(2, 2, 2, 2, 2, 2),
(56, 3, 2, 55000, 2, 110000),
(56, 1, 2, 47000, 13, 611000),
(56, 8, 2, 53000, 2, 106000),
(57, 3, 2, 55000, 2, 110000),
(57, 1, 2, 47000, 13, 611000),
(57, 8, 2, 53000, 2, 106000),
(58, 1, 2, 47000, 4, 188000),
(58, 3, 2, 55000, 1, 55000),
(58, 8, 2, 53000, 1, 53000),
(59, 1, 2, 47000, 5, 235000),
(59, 3, 2, 55000, 1, 55000),
(59, 8, 2, 53000, 1, 53000),
(60, 1, 4, 0, 1, 0),
(60, 3, 4, 55000, 1, 55000),
(61, 1, 4, 40000, 1, 40000),
(61, 19, 4, 32500, 1, 32500),
(62, 15, 2, 40000, 1, 40000),
(63, 1, 2, 40000, 1, 40000),
(64, 1, 2, 40000, 1, 40000),
(65, 1, 2, 40000, 1, 40000),
(66, 1, 2, 40000, 1, 40000),
(67, 1, 2, 50000, 1, 50000),
(67, 8, 2, 53000, 5, 265000),
(68, 29, 2, 36052, 20, 721040),
(69, 1, 4, 47000, 1, 47000),
(69, 3, 4, 56100, 1, 56100),
(69, 8, 4, 54000, 1, 54000),
(70, 1, 2, 47000, 1, 47000),
(70, 3, 2, 56100, 1, 56100),
(70, 8, 2, 54000, 1, 54000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` int(50) NOT NULL,
  `nama_distributor` varchar(225) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `alamat`, `telepon`) VALUES
(1, 'CV Bambang Jaya', 'Jalan Panglima Sudirman No.254 Tuban', '0356 330330'),
(2, 'CV Adib Jaya', 'Jalan Panglima Sudirman No.254 Tuban', '0356 330330'),
(4, 'CV Bintang Jaya', 'Jalan Panglima Sudirman No.254 Tuban', '0356 330330'),
(5, 'TB. Asa Paradiso', 'Jl. Diponegoro No.23 Bandung', '022-7308415'),
(6, 'TB. Asa Paradiso', 'Jl. Diponegoro No.23 Bandung', '022-7308415'),
(7, 'TB. Rumah Buku', 'Jl. Supratman No. 96 Surabaya', '022-7233257'),
(8, 'TB. Gramedia Merdeka', 'Jl. Merdeka No. 43 Yogyakarta', '021-5643466'),
(9, 'TB. Alinea Book Corners', 'Jl. Mayor Abdurrohman No. 153 Jakarta', '031-5462685'),
(10, 'CV. Berkah Abadi', 'Jl. Pattimura No. 12 Lamongan', '024-8411511'),
(12, 'Gramedia Paris Van Java', 'Jl. Sukajadi No. 137-139 Bandung', '022-5224275'),
(13, 'Bandung Book Center', 'Jl. Karapitan No. 38 Bandung', '022-4205916'),
(14, 'TB. Nusa Cendana', 'Jl. Braga 115 Semarang', '022-4231544'),
(15, 'TB. Setia Kawan', 'Jl. Kramat Raya No. 3L Jakarta', '022-3155243'),
(16, 'Pustaka Indah', 'Jl. Soekarno No. 34 Surabaya', '022-75176363'),
(17, 'CV. Sumber Ilmu', 'Jl. Pramuka No. 2 Malang', '0341-494740'),
(18, 'Pustaka Media', 'Jl. Veteran No. 32 Sidoarjo', '031-5462685'),
(19, 'TB. Mandiri Buku', 'Jl. Plaosan No. 45 Surabaya', '024-3518674'),
(20, 'TB. Gramedia Istana Plaza', 'Jl. Pasir Kaliki No. 123 Surabaya', '022-5224275');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `akses` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama`, `alamat`, `telepon`, `status`, `username`, `email`, `fullname`, `password`, `akses`) VALUES
(2, 'Firda Mareza ', 'Jl. Isekai No. 25', '085730677732', '1', 'admin', 'firdamareza@gmail.com', 'Firda Mareza Laila Khummaira', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin'),
(3, 'Rara', 'Jalan Basuki Rahmat', '085342534567', '1', 'rara', 'rara@gmail.com', 'Rara Putri', 'fe96dd39756ac41b74283a9292652d366d73931f', 'operator'),
(4, 'sese', 'Malang', '08156317587', '1', 'sese', 'sese@gmail.com', 'Seseliaa', '8691e4fc53b99da544ce86e22acba62d13352eff', 'kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_kasir` int(50) NOT NULL,
  `id_buku` int(50) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasok`
--

CREATE TABLE `pasok` (
  `id_pasok` int(50) NOT NULL,
  `id_distributor` int(50) NOT NULL,
  `id_buku` int(50) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pasok`
--

INSERT INTO `pasok` (`id_pasok`, `id_distributor`, `id_buku`, `jumlah`, `tanggal`) VALUES
(2, 3, 2, 23, '2017-01-04'),
(5, 1, 1, 5635, '2017-01-27'),
(8, 4, 1, 150, '2024-05-25'),
(9, 1, 21, 150, '2024-05-25'),
(10, 0, 3, 4, '2024-06-04'),
(11, 1, 3, 4, '2024-06-04'),
(12, 2, 15, 1, '2024-06-04'),
(13, 1, 15, 100, '2024-06-04'),
(14, 1, 15, 100, '2024-06-05'),
(15, 2, 15, 100, '2024-06-05'),
(16, 1, 15, 100, '2024-06-04'),
(17, 1, 1, 100, '2024-06-06'),
(18, 1, 1, 20, '2024-06-06'),
(19, 1, 3, 100, '2024-06-06'),
(20, 1, 8, 7, '2024-06-06'),
(21, 1, 3, 50, '2024-06-06'),
(22, 17, 29, 80, '2024-07-18');

--
-- Trigger `pasok`
--
DELIMITER $$
CREATE TRIGGER `Menambah Stok Saat Pasokan Baru` AFTER INSERT ON `pasok` FOR EACH ROW BEGIN
    UPDATE buku
    SET stok = stok + NEW.jumlah
    WHERE id_buku = NEW.id_buku;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(50) NOT NULL,
  `id_kasir` varchar(50) NOT NULL,
  `total` int(50) NOT NULL,
  `tanggal` date NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_kasir`, `total`, `tanggal`, `id_buku`) VALUES
(39, '2', 169000, '2017-01-31', 0),
(40, '2', 188000, '2017-02-01', 0),
(41, '2', 47000, '2017-02-01', 0),
(42, '2', 243000, '2017-02-01', 0),
(43, '2', 827000, '2017-02-25', 0),
(44, '2', 12000, '2017-02-25', 0),
(45, '2', 827000, '2017-02-25', 0),
(46, '2', 827000, '2017-02-25', 0),
(47, '2', 827000, '2017-02-25', 0),
(48, '2', 827000, '2017-02-25', 0),
(49, '2', 827000, '2017-02-25', 0),
(50, '2', 827000, '2017-02-25', 0),
(51, '2', 827000, '2017-02-25', 0),
(52, '2', 827000, '2017-02-25', 0),
(53, '2', 827000, '2017-02-25', 0),
(54, '2', 827000, '2017-02-25', 0),
(55, '2', 827000, '2017-02-25', 0),
(56, '2', 827000, '2017-02-25', 0),
(57, '2', 827000, '2017-02-27', 0),
(58, '2', 296000, '2017-03-12', 0),
(59, '2', 343000, '2017-03-12', 0),
(60, '4', 55000, '2024-05-25', 0),
(61, '4', 72500, '2024-05-25', 0),
(62, '2', 40000, '2024-05-25', 0),
(63, '2', 40000, '2024-05-25', 0),
(64, '2', 40000, '2024-06-04', 0),
(65, '2', 40000, '2024-06-04', 0),
(66, '2', 40000, '2024-06-04', 0),
(67, '2', 315000, '2024-07-16', 0),
(68, '2', 721040, '2024-07-18', 0),
(69, '4', 157100, '2024-09-02', 0),
(70, '2', 157100, '2024-09-20', 0);

--
-- Trigger `penjualan`
--
DELIMITER $$
CREATE TRIGGER `Mengurangi Stok Saat Penjualan` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
    UPDATE buku
    SET stok = stok - NEW.total
    WHERE id_buku = NEW.id_buku;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indeks untuk tabel `pasok`
--
ALTER TABLE `pasok`
  ADD PRIMARY KEY (`id_pasok`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id_distributor` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pasok`
--
ALTER TABLE `pasok`
  MODIFY `id_pasok` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
