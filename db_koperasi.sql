-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jul 2021 pada 14.39
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `nik_admin` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`nik_admin`, `nama`) VALUES
('1234567890123456', 'Admin Koperasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login`
--

CREATE TABLE `tb_login` (
  `id_login` int(4) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `nik_admin` varchar(16) DEFAULT NULL,
  `nik_user` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_login`
--

INSERT INTO `tb_login` (`id_login`, `username`, `password`, `level`, `nik_admin`, `nik_user`) VALUES
(1, 'admin_koperasi', 'admin_koperasi', 'admin', '1234567890123456', NULL),
(25, '196308121986031028', '196308121986031028', 'user', NULL, '196308121986031028'),
(26, '197504012000032005', '197504012000032005', 'user', NULL, '197504012000032005'),
(27, '198307172006041012', '198307172006041012', 'user', NULL, '198307172006041012'),
(28, '197012311990032016', '197012311990032016', 'user', NULL, '197012311990032016'),
(29, '197807152005022001', '197807152005022001', 'user', NULL, '197807152005022001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `nik_user` varchar(18) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `tanggal_pendaftaran` datetime DEFAULT NULL,
  `simpanan_pokok` varchar(10) DEFAULT NULL,
  `simpanan_wajib` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `total_simpanan_wajib` varchar(7) DEFAULT NULL,
  `simpanan_sukarela` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(11) DEFAULT 'Aktif',
  `tanggal_berhenti` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`nik_user`, `nama`, `alamat`, `tanggal_pendaftaran`, `simpanan_pokok`, `simpanan_wajib`, `total_simpanan_wajib`, `simpanan_sukarela`, `status`, `tanggal_berhenti`) VALUES
('196308121986031028', 'SYAFRUDDIN, SE', 'ENREKANG', '2021-01-23 09:06:49', '10000000', '[{\"tahun\":\"2021\",\"bulan\":\"01\",\"tanggal_simpan\":\"2021-01-23 9:06:49\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"02\",\"tanggal_simpan\":\"2021-06-23 16:06:55\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"04\",\"tanggal_simpan\":\"2021-06-23 16:06:35\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"06\",\"tanggal_simpan\":\"2021-06-23 16:06:35\",\"simpanan\":\"500000\"}]', '500000', NULL, 'Aktif', NULL),
('197012311990032016', 'HASNAH, S.Pd', 'ENREKANG', '2021-01-25 10:00:24', '5000000', '[{\"tahun\":\"2021\",\"bulan\":\"01\",\"tanggal_simpan\":\"2021-01-25 10:00:24\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"02\",\"tanggal_simpan\":\"2021-06-23 16:06:06\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"03\",\"tanggal_simpan\":\"2021-06-23 16:06:06\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"04\",\"tanggal_simpan\":\"2021-06-23 16:06:26\",\"simpanan\":\"500000\"}]', '500000', NULL, 'Aktif', NULL),
('197504012000032005', 'APRIANTY,SE., M.A.P', 'ENREKANG', '2021-01-28 15:00:00', '5000000', '[{\"tahun\":\"2021\",\"bulan\":\"01\",\"tanggal_simpan\":\"2021-01-28 15:00:00\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"02\",\"tanggal_simpan\":\"2021-06-23 16:06:36\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"03\",\"tanggal_simpan\":\"2021-06-23 16:06:36\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"04\",\"tanggal_simpan\":\"2021-06-23 16:06:36\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"06\",\"tanggal_simpan\":\"2021-06-23 16:06:36\",\"simpanan\":\"500000\"}]', '500000', NULL, 'Aktif', NULL),
('197807152005022001', 'SARI MAYA, S. A.P', 'ENREKANG', '2021-02-05 15:06:31', '5000000', '[{\"tahun\":\"2021\",\"bulan\":\"02\",\"tanggal_simpan\":\"2021-02-05 15:06:31\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"03\",\"tanggal_simpan\":\"2021-06-23 16:06:07\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"04\",\"tanggal_simpan\":\"2021-06-23 16:06:07\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"05\",\"tanggal_simpan\":\"2021-06-23 16:06:07\",\"simpanan\":\"500000\"}]', '500000', NULL, 'Aktif', NULL),
('198307172006041012', 'RAHMAD HIDAYAT, S.Pd', 'ENREKANG', '2021-02-10 10:06:54', '5000000', '[{\"tahun\":\"2021\",\"bulan\":\"02\",\"tanggal_simpan\":\"2021-02-10 10:06:54\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"03\",\"tanggal_simpan\":\"2021-06-23 16:06:32\",\"simpanan\":\"500000\"},{\"tahun\":\"2021\",\"bulan\":\"04\",\"tanggal_simpan\":\"2021-06-23 16:06:32\",\"simpanan\":\"500000\"}]', '500000', NULL, 'Aktif', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`nik_admin`);

--
-- Indeks untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `nik_admin` (`nik_admin`),
  ADD KEY `nik_user` (`nik_user`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`nik_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `id_login` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `tb_login_ibfk_1` FOREIGN KEY (`nik_admin`) REFERENCES `tb_admin` (`nik_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_login_ibfk_2` FOREIGN KEY (`nik_user`) REFERENCES `tb_user` (`nik_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
