-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2025 at 02:59 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sirajasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `jasa_id` int(11) DEFAULT NULL,
  `jadwal_id` int(11) DEFAULT NULL,
  `alamat_layanan` text DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `jasa_id`, `jadwal_id`, `alamat_layanan`, `catatan`) VALUES
(1, 1, 1, 1, 'ada', 'ada'),
(14, 2, 2, 3, 'asda', 'asda');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_jasa`
--

CREATE TABLE `jadwal_jasa` (
  `jadwal_id` int(11) NOT NULL,
  `jasa_id` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` enum('tersedia','dipesan') DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_jasa`
--

INSERT INTO `jadwal_jasa` (`jadwal_id`, `jasa_id`, `tanggal`, `jam_mulai`, `jam_selesai`, `status`) VALUES
(1, 1, '1212-11-11', '11:22:33', '11:11:11', 'tersedia'),
(3, 2, '2222-11-11', '22:11:11', '21:11:11', 'tersedia'),
(4, 2, '2223-10-22', '22:22:11', '22:22:11', 'tersedia'),
(5, 2, '2223-10-22', '11:11:11', '11:11:11', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `jasa`
--

CREATE TABLE `jasa` (
  `jasa_id` int(11) NOT NULL,
  `nama_jasa` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `mitra_id` int(11) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jasa`
--

INSERT INTO `jasa` (`jasa_id`, `nama_jasa`, `deskripsi`, `harga`, `kategori_id`, `mitra_id`, `durasi`) VALUES
(1, 'sczxcz', 'asasad', '112313.00', 1, 1, 1),
(2, 'dassda', 'asdsad', '222.00', 2, 2, 22);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `pembayaran_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `metode` enum('transfer','e-wallet','cod') NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `status` enum('belum bayar','sudah bayar') DEFAULT 'belum bayar',
  `tanggal_bayar` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`pembayaran_id`, `booking_id`, `metode`, `jumlah`, `status`, `tanggal_bayar`) VALUES
(1, 1, 'transfer', '1.00', 'belum bayar', '2025-11-11 11:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `user_id` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `tanggal_transaksi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`user_id`, `nama_lengkap`, `email`, `password`, `no_hp`, `alamat`, `pekerjaan`, `tanggal_transaksi`) VALUES
('01', 'iii', 'ii', '111111111', '3322', 'adasdad', 'adad', '2026-01-13'),
('1', 'riski', 'dadas', '1321', '123213', 'alamat cafe', 'dokter', '1223-12-12'),
('12', 'aradad', 'adasd', '12313', '12312', 'sddfsd', 'safas', '2002-10-11'),
('1231', 'aqdas', 'qwdaasda', 'asdada', '12313131', 'sadasxas', 'asdasasdas', '2005-01-12'),
('2', 'asdaa', 'adadadadada', '1231412', '121243134', '12412241421', 'adsada', '2223-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_transaksi`
--

CREATE TABLE `riwayat_transaksi` (
  `riwayat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `status_akhir` varchar(50) DEFAULT NULL,
  `waktu_perubahan` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_transaksi`
--

INSERT INTO `riwayat_transaksi` (`riwayat_id`, `user_id`, `booking_id`, `status_akhir`, `waktu_perubahan`) VALUES
(1, 1, 1, '1', '2424-11-11 11:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `pekerjaan` enum('admin','user','mitra') DEFAULT 'user',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `nama_lengkap`, `email`, `password`, `no_hp`, `alamat`, `pekerjaan`, `created_at`) VALUES
(1, 'riski', 'adada', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '09876', 'jl bauroq', 'admin', '2025-06-23 19:29:13'),
(2, 'asda', 'asda', '64e1094057fa72b74ea088417fe5bd342a54786e6f5bc7587e1348cc95069752', '1231312', 'adasdasdsa', 'admin', '2025-06-24 20:13:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `jasa_id` (`jasa_id`),
  ADD KEY `jadwal_id` (`jadwal_id`);

--
-- Indexes for table `jadwal_jasa`
--
ALTER TABLE `jadwal_jasa`
  ADD PRIMARY KEY (`jadwal_id`),
  ADD KEY `jasa_id` (`jasa_id`);

--
-- Indexes for table `jasa`
--
ALTER TABLE `jasa`
  ADD PRIMARY KEY (`jasa_id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`pembayaran_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `riwayat_transaksi`
--
ALTER TABLE `riwayat_transaksi`
  ADD PRIMARY KEY (`riwayat_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jadwal_jasa`
--
ALTER TABLE `jadwal_jasa`
  MODIFY `jadwal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jasa`
--
ALTER TABLE `jasa`
  MODIFY `jasa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13124;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `riwayat_transaksi`
--
ALTER TABLE `riwayat_transaksi`
  MODIFY `riwayat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`jasa_id`) REFERENCES `jasa` (`jasa_id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal_jasa` (`jadwal_id`);

--
-- Constraints for table `jadwal_jasa`
--
ALTER TABLE `jadwal_jasa`
  ADD CONSTRAINT `jadwal_jasa_ibfk_1` FOREIGN KEY (`jasa_id`) REFERENCES `jasa` (`jasa_id`);

--
-- Constraints for table `jasa`
--
ALTER TABLE `jasa`
  ADD CONSTRAINT `jasa_ibfk_2` FOREIGN KEY (`mitra_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `riwayat_transaksi`
--
ALTER TABLE `riwayat_transaksi`
  ADD CONSTRAINT `riwayat_transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `riwayat_transaksi_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
