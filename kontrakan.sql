-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 08:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kontrakan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `nohp`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin 1', '6281319894484', '$2y$12$PxdAWjWGs.G7XHwnuXZqY.xMb1AoSvFXcX4nK.bfF07t6SWl2dLSy', NULL, NULL),
(2, 'Admin 2', '6281382206488', '$2y$12$mhPl1HQ7rM9FdgkzVCVH/OA28wiOPZoRqFWJe3MtcBykT545lGgJy', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `nama_fasilitas`, `deskripsi`, `created_at`, `updated_at`) VALUES
(8, 'Kamar Depan', 'Kamar cukup luas yang nyaman untuk tidur dan menyimpan barang pribadi Anda ', '2025-05-03 15:14:30', '2025-05-03 15:14:30'),
(9, 'Dapur & Wastafel', 'Area dapur bersih dengan wastafel, cocok untuk memasak makanan harian Anda ', '2025-05-03 15:14:30', '2025-05-03 15:14:30'),
(10, 'Kamar Mandi', 'Kamar mandi bersih dan terawat lengkap dengan kloset jongkok yang higienis.', '2025-05-03 15:14:30', '2025-05-03 15:14:30'),
(11, 'CCTV Keamanan', 'Sistem pengawasan 24 jam dengan CCTV untuk menjamin keamanan dan kenyamanan Anda ', '2025-05-03 15:14:30', '2025-05-03 15:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jumlah_pintu`
--

CREATE TABLE `jumlah_pintu` (
  `id` int(10) UNSIGNED NOT NULL,
  `jumlah_pintu` int(5) NOT NULL DEFAULT 15,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jumlah_pintu`
--

INSERT INTO `jumlah_pintu` (`id`, `jumlah_pintu`, `created_at`, `updated_at`) VALUES
(1, 12, NULL, '2025-05-12 17:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_16_162448_create_pelanggans_table', 1),
(5, '2025_04_16_162448_create_pembayarans_table', 1),
(6, '2025_04_28_060525_create_admins_table', 1),
(7, '2025_04_28_063415_create_fasilitas_table', 1),
(8, '2025_04_28_191622_create_jumlah_pintu_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggans`
--

CREATE TABLE `pelanggans` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tanggal_mulai_sewa` date NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'nonaktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggans`
--

INSERT INTO `pelanggans` (`id`, `nama`, `nohp`, `password`, `tanggal_mulai_sewa`, `status`, `created_at`, `updated_at`) VALUES
(35, 'Mia', '6289518850475', '$2y$12$klR0rPBj.QvZtVxynB4Xyur3SL39fI6j9BgHIWqZy13muiLDYUoe2', '2025-04-16', 'aktif', '2025-05-11 11:43:22', '2025-05-12 10:32:46'),
(36, 'mflh', '6281382206488', '$2y$12$PfX.sfVgsBmYlXarciafcOgFhw8IfEMxBgbAuetLuouvs2ad91th2', '2025-04-06', 'aktif', '2025-05-11 11:43:22', '2025-05-11 12:00:39'),
(37, 'tiwi', '6281319894484', '$2y$12$4Woape3rCRsH8JQx2ZKczeUO2klOawGofq.4CxmU8rOvp.HlbISoC', '2025-04-14', 'aktif', '2025-04-11 11:45:08', '2025-04-11 11:49:41'),
(39, 'Ririn', '6283813956913', '$2y$12$wyzZKrMheU/aCeGV8ALObO8XZyRXHY0H.t6qiUHhevTbwY72qNNB6', '2022-09-12', 'nonaktif', '2025-05-11 18:15:07', '2025-05-11 18:15:07'),
(40, 'Rahayu', '6285890250012', '$2y$12$Ns.QXf2/75aGKgsPS2niHuPx6BFGtMjCojYaDzXbo6yNkH5KNQIrq', '2017-08-11', 'nonaktif', '2025-05-11 18:56:55', '2025-05-11 18:56:55'),
(41, 'Abel', '6285839332190', '$2y$12$exvutO2FEbVDKRTCDKTLAOn2cENO851fZvYM4dcW8hfI8B6caZP0e', '2024-02-10', 'nonaktif', '2025-05-11 19:48:56', '2025-05-11 19:48:56'),
(42, 'ijal', '6282282574200', '$2y$12$vjI9wyD5Se8dUm0kxOfsT.XbXVvKV4mtq7sOU98sIldej1ojmpFYK', '2022-04-15', 'nonaktif', '2025-05-11 20:37:18', '2025-05-11 20:37:18'),
(43, 'Amin', '6285839273612', '$2y$12$rk9uNNn2BN3AWZwHy0uibe8OLyhZ/r.0LGTB.0PlRKPHmk2PZibXW', '2022-05-11', 'nonaktif', '2025-05-11 21:14:01', '2025-05-11 21:14:01'),
(44, 'Halfis', '6285365867116', '$2y$12$7Y.NNymoQ6kFUIHZOiCBMONnmpfFGJZasaePloG6ni/JDJzOPJ/jG', '2024-01-29', 'nonaktif', '2025-05-11 21:58:05', '2025-05-11 21:58:05'),
(45, 'Fatir', '6285210384025', '$2y$12$Cq8AYDLi3ZtKnFnSxq9QIuPVpv9HzgRInkl7df2VePBKj7WVuzDa.', '2023-12-12', 'nonaktif', '2025-05-11 22:36:30', '2025-05-11 22:36:30'),
(46, 'Meli', '6282122636660', '$2y$12$DM3AGV1.cyVe8OynyjAxWOMSWlWZqnlcyeM6SNkgHWPXJ2eZRrNPy', '2025-01-08', 'nonaktif', '2025-05-11 23:24:53', '2025-05-11 23:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` int(10) UNSIGNED NOT NULL,
  `pelanggan_id` int(10) UNSIGNED NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `konfirmasi` enum('sudah di konfirmasi','menunggu konfirmasi') NOT NULL DEFAULT 'menunggu konfirmasi',
  `status_pembayaran` enum('sudah bayar','belum bayar') NOT NULL DEFAULT 'belum bayar',
  `tanggal_pembayaran` date DEFAULT NULL,
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayarans`
--

INSERT INTO `pembayarans` (`id`, `pelanggan_id`, `bulan`, `konfirmasi`, `status_pembayaran`, `tanggal_pembayaran`, `bukti_bayar`, `created_at`, `updated_at`) VALUES
(44, 37, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-11', 'bukti_bayar/Av1JCP84CjTNe0YEqIxVSWNI2uANIG8HwELpdDTd.jpg', '2025-04-11 11:45:08', '2025-04-11 11:49:41'),
(45, 36, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-06', 'bukti/A62tFBIx5Ks1jENPHXY1WgWaRSkVaNO15jfnWCZW.jpg', '2025-05-11 11:56:43', '2025-05-11 12:00:39'),
(46, 35, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-13', 'bukti/MS3igH5gPkvRKQan4GivMbc7x8jBAZ3oQhYNy4dp.jpg', '2025-04-11 11:59:35', '2025-04-11 12:00:46'),
(48, 39, '2022-09', 'sudah di konfirmasi', 'sudah bayar', '2022-09-12', 'bukti_bayar/uSZfJ4sQ2Pk2XRu6FfXOQp043IYhUXVFDtJef53h.jpg', '2025-05-11 18:15:07', '2025-05-11 18:15:07'),
(49, 39, '2022-10', 'sudah di konfirmasi', 'sudah bayar', '2022-10-12', 'bukti/2wFeZWyLLS9AUWLRgPhEpjDU4QgeyCgkdYCG2Izp.jpg', '2025-05-11 18:24:48', '2025-05-11 18:39:52'),
(50, 39, '2022-11', 'sudah di konfirmasi', 'sudah bayar', '2022-11-12', 'bukti/qyMbZ8DFKF1CTmiVHLRTMKfkeYSKtFWbuuonU1rm.jpg', '2025-05-11 18:25:01', '2025-05-11 18:39:58'),
(51, 39, '2022-12', 'sudah di konfirmasi', 'sudah bayar', '2022-12-12', 'bukti/gIjaGauNP0qDYwUCxiPE51Umxo3GYBQ6fvyt7Gzd.jpg', '2025-05-11 18:25:49', '2025-05-11 18:40:04'),
(52, 39, '2023-01', 'sudah di konfirmasi', 'sudah bayar', '2023-01-12', 'bukti/SKNmWqFRBTDIMpZKhN2895GzibACZSMIFxss3UlT.jpg', '2025-05-11 18:26:02', '2025-05-11 18:40:10'),
(53, 39, '2023-02', 'sudah di konfirmasi', 'sudah bayar', '2023-02-12', 'bukti/mlXjU4FHvrQqcGACa5zxgAMJa1YUA7sfgjZF6F3e.jpg', '2025-05-11 18:26:20', '2025-05-11 18:40:19'),
(54, 39, '2023-03', 'sudah di konfirmasi', 'sudah bayar', '2023-03-12', 'bukti/LcmnLSw1f7Yj9TPDY42XmK88VJwZnrBVMG8NM712.jpg', '2025-05-11 18:26:30', '2025-05-11 18:40:25'),
(55, 39, '2023-04', 'sudah di konfirmasi', 'sudah bayar', '2023-04-12', 'bukti/biM39sig3Ej42njckf8STmF9gqkAHSbsbRSYFbYx.jpg', '2025-05-11 18:26:43', '2025-05-11 18:40:37'),
(56, 39, '2023-05', 'sudah di konfirmasi', 'sudah bayar', '2023-05-12', 'bukti/7nEmh2ShGVCmS11yisQsKF5hDlUkfPTnjGhnH3v6.jpg', '2025-05-11 18:26:54', '2025-05-11 18:40:44'),
(57, 39, '2023-06', 'sudah di konfirmasi', 'sudah bayar', '2023-06-12', 'bukti/NLUyQ2YkRTniTpOvveFbMjqlWQL1QvtmSEVUjaTI.jpg', '2025-05-11 18:27:05', '2025-05-11 18:41:00'),
(58, 39, '2023-07', 'sudah di konfirmasi', 'sudah bayar', '2023-07-12', 'bukti/TCG1NM78KZwA8PBKrmCgWJtlinrAycKRRFFMb9Lz.jpg', '2025-05-11 18:27:17', '2025-05-11 18:41:09'),
(59, 39, '2023-08', 'sudah di konfirmasi', 'sudah bayar', '2023-08-12', 'bukti/KiPRIfB5Q6fnrn0irFzCavBkSodJJpyAiq3USGTU.jpg', '2025-05-11 18:27:30', '2025-05-11 18:41:15'),
(60, 39, '2023-09', 'sudah di konfirmasi', 'sudah bayar', '2023-09-12', 'bukti/Es1qtNBoPLwYcScZ74XPaA5qZitKqLWt9We7JNkc.jpg', '2025-05-11 18:27:42', '2025-05-11 18:41:22'),
(61, 39, '2023-10', 'sudah di konfirmasi', 'sudah bayar', '2023-10-12', 'bukti/fX4D4SKgKoC0xRgNkHAHdUDPzHAFmHcfYbXEY12t.jpg', '2025-05-11 18:27:53', '2025-05-11 18:42:27'),
(62, 39, '2023-11', 'sudah di konfirmasi', 'sudah bayar', '2023-11-12', 'bukti/lwT2uUjYmYALhZvtZhsuoQXdfVnzrBRsXb1eRgbW.jpg', '2025-05-11 18:28:08', '2025-05-11 18:42:33'),
(63, 39, '2023-12', 'sudah di konfirmasi', 'sudah bayar', '2023-12-12', 'bukti/y6htKQXfUhAtNGWa23JHUZrrPmdB6vLcWpb8hnSE.jpg', '2025-05-11 18:28:19', '2025-05-11 18:42:39'),
(64, 39, '2024-01', 'sudah di konfirmasi', 'sudah bayar', '2024-01-12', 'bukti/KSvtWzyJRAyl38E4kFRVMBErt8lmg6GWOYc6HU1N.jpg', '2025-05-11 18:28:38', '2025-05-11 18:42:46'),
(65, 39, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-12', 'bukti/J0oZQCQbfM0saOasaRmpz0lLxgQUgYgx2oB8RMjS.jpg', '2025-05-11 18:28:56', '2025-05-11 18:42:52'),
(66, 39, '2024-03', 'sudah di konfirmasi', 'sudah bayar', '2024-03-12', 'bukti/qd1vkrbP2jwongSs9hLNyNVdrpMVntDXa0izrHul.jpg', '2025-05-11 18:29:12', '2025-05-11 18:42:58'),
(67, 39, '2024-04', 'sudah di konfirmasi', 'sudah bayar', '2024-04-12', 'bukti/BTglpsd5fXeVV95UBbnpQrUtrZEB09JXh7HjxXD3.jpg', '2025-05-11 18:29:23', '2025-05-11 18:41:35'),
(69, 39, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-12', 'bukti/0ZpwBDl71ACien2fmfhovFI5mtfwbFJApT9b5iaf.jpg', '2025-05-11 18:30:30', '2025-05-11 18:41:40'),
(70, 39, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-12', 'bukti/MZzhojxBasvdk54cIzp6IRVsvSyRCmNskpp3osRw.jpg', '2025-05-11 18:32:41', '2025-05-11 18:41:48'),
(71, 39, '2024-06', 'sudah di konfirmasi', 'sudah bayar', '2024-06-12', 'bukti/uou0eMp6oJq96aevfmbZtV9weeJPIZSiMKOaCNzH.jpg', '2025-05-11 18:33:57', '2025-05-11 18:41:56'),
(72, 39, '2024-07', 'sudah di konfirmasi', 'sudah bayar', '2024-07-12', 'bukti/Z8hnvWbuoni1QfZXpS2yPa125r9A7R5sAvz7rYLK.jpg', '2025-05-11 18:34:14', '2025-05-11 18:42:03'),
(73, 39, '2024-08', 'sudah di konfirmasi', 'sudah bayar', '2024-08-12', 'bukti/aTZ6N6zB0HkInxYx8mDET4m7BVWVwAnhRvILiCkz.jpg', '2025-05-11 18:34:35', '2025-05-11 18:42:10'),
(74, 39, '2024-09', 'sudah di konfirmasi', 'sudah bayar', '2024-09-12', 'bukti/Jy5Wkpzzp3XsT8HzIpVATGp0PfNRlVoSoZOEEgUR.jpg', '2025-05-11 18:35:00', '2025-05-11 18:43:15'),
(75, 39, '2024-10', 'sudah di konfirmasi', 'sudah bayar', '2024-10-12', 'bukti/mDpgXordHtKU9zFQBsFTfuAJl4puKJMiYx5SodP3.jpg', '2025-05-11 18:35:26', '2025-05-11 18:43:20'),
(76, 39, '2024-11', 'sudah di konfirmasi', 'sudah bayar', '2024-11-12', 'bukti/VyolmQM22kxHQJm6sPoBvSySQNzajAkgK41LO2I5.jpg', '2025-05-11 18:36:00', '2025-05-11 18:43:26'),
(77, 39, '2024-12', 'sudah di konfirmasi', 'sudah bayar', '2024-12-12', 'bukti/gqpLKsabBb7tE5wXYaR9liWZjmUPkYPsQaqvbVwz.jpg', '2025-05-11 18:36:29', '2025-05-11 18:43:32'),
(78, 39, '2025-01', 'sudah di konfirmasi', 'sudah bayar', '2025-01-12', 'bukti/tHB76M9qFKsI9AJliJnBuuRjakjddFxeq54ZDEv3.jpg', '2025-05-11 18:37:24', '2025-05-11 18:43:37'),
(79, 39, '2025-02', 'sudah di konfirmasi', 'sudah bayar', '2025-02-12', 'bukti/4Tb1WK8kjnOlSVvqlScV4A8Uao8v7o4G2k0VOYCv.jpg', '2025-05-11 18:37:49', '2025-05-11 18:43:45'),
(80, 39, '2025-03', 'sudah di konfirmasi', 'sudah bayar', '2025-03-12', 'bukti/R7Fw2MhaVxdYmR2fbkf9tfAOmRmFMDTHM00py029.jpg', '2025-05-11 18:38:12', '2025-05-11 18:43:53'),
(81, 39, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-12', 'bukti/lrZrz4avD9AhARZQgS9GgOTrAZEkwqHxvfqXAA4a.jpg', '2025-05-11 18:39:24', '2025-05-11 18:43:58'),
(82, 40, '2017-09', 'sudah di konfirmasi', 'sudah bayar', '2017-09-11', 'bukti_bayar/88d7XVAZsgFRlgpGelVEKUDo1GjYXwXN3yJF05xI.jpg', '2025-05-11 18:56:55', '2025-05-11 18:56:55'),
(83, 40, '2017-08', 'sudah di konfirmasi', 'sudah bayar', '2017-08-11', 'bukti/GysBOSss6xEUJNYQBCfzLNiTWUICZ9gM9tngDZ9K.jpg', '2025-05-11 18:58:34', '2025-05-11 18:58:34'),
(84, 40, '2017-09', 'sudah di konfirmasi', 'sudah bayar', '2017-09-11', 'bukti/sqs6EFbRKW0kL6H8M5BQnBOBh6TA03UBvnekEozo.jpg', '2025-05-11 18:58:46', '2025-05-11 18:58:46'),
(85, 40, '2017-10', 'sudah di konfirmasi', 'sudah bayar', '2017-10-11', 'bukti/yXLN9EEcHDK18YWlCgrrMqZG5cgeQ7ZujgcWO9Sb.jpg', '2025-05-11 18:58:57', '2025-05-11 18:58:57'),
(86, 40, '2017-11', 'sudah di konfirmasi', 'sudah bayar', '2017-11-11', 'bukti/rDNK6fGB3LCizk2a9i4fgpfFUrlozByzXNxfckpa.jpg', '2025-05-11 18:59:08', '2025-05-11 18:59:08'),
(87, 40, '2017-12', 'sudah di konfirmasi', 'sudah bayar', '2017-12-11', 'bukti/UyAdVDIER3g7LoMkAEjfpPv5R19rrF3ZBUxgamEG.jpg', '2025-05-11 18:59:19', '2025-05-11 18:59:19'),
(88, 40, '2018-01', 'sudah di konfirmasi', 'sudah bayar', '2018-01-11', 'bukti/Tq9hDwlfCHjTSZkYlMe6xCXPSpk1LXcooLh6GyLX.jpg', '2025-05-11 18:59:30', '2025-05-11 18:59:30'),
(89, 40, '2018-02', 'sudah di konfirmasi', 'sudah bayar', '2018-02-11', 'bukti/PjAjfEVsJwWreN4QhjkVXh7lDXgwF6mguBtwrpKQ.jpg', '2025-05-11 18:59:42', '2025-05-11 18:59:42'),
(90, 40, '2018-03', 'sudah di konfirmasi', 'sudah bayar', '2018-03-11', 'bukti/VYo2UDJf8EBW24zwoTwVtOvkatmHJotTA6KUKIQj.jpg', '2025-05-11 18:59:54', '2025-05-11 18:59:54'),
(91, 40, '2018-04', 'sudah di konfirmasi', 'sudah bayar', '2018-04-11', 'bukti/p2uBiZ3ZX9KK1WmPb48nQ41TJI2M183Ux8c399ry.jpg', '2025-05-11 19:00:07', '2025-05-11 19:00:07'),
(92, 40, '2018-05', 'sudah di konfirmasi', 'sudah bayar', '2018-05-11', 'bukti/6rI1iJMdUx1wKq3ZOC3tQA72F3ZDOCmjqqA9dtff.jpg', '2025-05-11 19:00:18', '2025-05-11 19:00:18'),
(93, 40, '2018-06', 'sudah di konfirmasi', 'sudah bayar', '2018-06-11', 'bukti/tFVKPaCRUmxmYXTCr2C6RTZhEvHhVWTzMPua1JwD.jpg', '2025-05-11 19:00:31', '2025-05-11 19:00:31'),
(94, 40, '2018-07', 'sudah di konfirmasi', 'sudah bayar', '2018-07-11', 'bukti/i4XqjEQMAlhPrv2YqIKOOsKnNmCanDuDp0jWzWII.jpg', '2025-05-11 19:00:41', '2025-05-11 19:00:41'),
(95, 40, '2018-08', 'sudah di konfirmasi', 'sudah bayar', '2018-08-11', 'bukti/OCDMz6LQMNVJjX8cMJh5ZAbcMzIgq7oFgv9ynaGC.jpg', '2025-05-11 19:00:53', '2025-05-11 19:00:53'),
(96, 40, '2018-09', 'sudah di konfirmasi', 'sudah bayar', '2018-09-11', 'bukti/P0i1xQcrjiUNt6cH1LuclTgDFM7TR3ncuT3BOkc9.jpg', '2025-05-11 19:01:07', '2025-05-11 19:01:07'),
(97, 40, '2018-10', 'sudah di konfirmasi', 'sudah bayar', '2018-10-11', 'bukti/QmIuvSbJNdN90KnwOq1siUK04dV58kv8r7JEPLFs.jpg', '2025-05-11 19:01:20', '2025-05-11 19:01:20'),
(98, 40, '2018-11', 'sudah di konfirmasi', 'sudah bayar', '2018-11-11', 'bukti/jI88XIFidEn9K4uQ8YkjacJqwplyhbkUfF6Qw0Vy.jpg', '2025-05-11 19:01:36', '2025-05-11 19:01:36'),
(99, 40, '2018-12', 'sudah di konfirmasi', 'sudah bayar', '2018-12-11', 'bukti/PlRmLWbpUYFp62oZXeU5QmsIex390crpVdOhBPuc.jpg', '2025-05-11 19:01:51', '2025-05-11 19:01:51'),
(100, 40, '2019-01', 'sudah di konfirmasi', 'sudah bayar', '2019-01-11', 'bukti/inA1fj0TEEH2jQ4eNYTdf8BbGjuoAFVnpPMOGlqk.jpg', '2025-05-11 19:02:05', '2025-05-11 19:02:05'),
(101, 40, '2019-02', 'sudah di konfirmasi', 'sudah bayar', '2019-02-11', 'bukti/TFJp4kYAQdl2VpLjcs9AHlK6SO4hHvIxVGZlIeEU.jpg', '2025-05-11 19:02:26', '2025-05-11 19:02:26'),
(102, 40, '2019-03', 'sudah di konfirmasi', 'sudah bayar', '2019-03-11', 'bukti/DGMcV50b5XXcMYDPoWttD7YvHmxuqw1O3HPFQzSY.jpg', '2025-05-11 19:02:37', '2025-05-11 19:02:37'),
(103, 40, '2019-04', 'sudah di konfirmasi', 'sudah bayar', '2019-04-11', 'bukti/dpkSmTJJEo4l2fNiqOzsHi1z0ozynxL7dMfLqvjQ.jpg', '2025-05-11 19:02:51', '2025-05-11 19:02:51'),
(104, 40, '2019-05', 'sudah di konfirmasi', 'sudah bayar', '2019-05-11', 'bukti/v3ftQiCKKpilfjnZAcOwtdf8cMt8rtqxA1RbgsJ5.jpg', '2025-05-11 19:03:03', '2025-05-11 19:03:03'),
(105, 40, '2019-06', 'sudah di konfirmasi', 'sudah bayar', '2019-06-11', 'bukti/oZzhH7CwWUVgK5BZBogHRNNG0LnHYl7eqO8cJYDz.jpg', '2025-05-11 19:03:14', '2025-05-11 19:03:14'),
(106, 40, '2019-07', 'sudah di konfirmasi', 'sudah bayar', '2019-07-11', 'bukti/OO1fyef7gZFPcEYNJj8JsM6IbNts8Q2clqakOKwI.jpg', '2025-05-11 19:03:25', '2025-05-11 19:03:25'),
(107, 40, '2019-08', 'sudah di konfirmasi', 'sudah bayar', '2019-08-11', 'bukti/U3cKcSGcznIj2p0GsmOTJ55gDNAL9q1diwA8LgNQ.jpg', '2025-05-11 19:03:37', '2025-05-11 19:03:37'),
(108, 40, '2019-09', 'sudah di konfirmasi', 'sudah bayar', '2019-09-11', 'bukti/DA7Hpv3UxCK8SKSnLjwYHZXBWt0z8X67vbBb3YnE.jpg', '2025-05-11 19:03:52', '2025-05-11 19:03:52'),
(109, 40, '2019-10', 'sudah di konfirmasi', 'sudah bayar', '2019-10-11', 'bukti/iXSV6hoAdbaQNaeywidFvnQdMiSgtYowfQZwdBsV.jpg', '2025-05-11 19:04:04', '2025-05-11 19:04:04'),
(110, 40, '2019-11', 'sudah di konfirmasi', 'sudah bayar', '2019-11-11', 'bukti/4KImLUagZRd7GIp7BGMv1n1VI8gNbn2zj9HCdlRo.jpg', '2025-05-11 19:04:17', '2025-05-11 19:04:17'),
(111, 40, '2019-12', 'sudah di konfirmasi', 'sudah bayar', '2019-12-11', 'bukti/mF6YPS7mi2AiGyjSLp8LaimhyyaJCB11zkov4OYO.jpg', '2025-05-11 19:04:37', '2025-05-11 19:04:37'),
(112, 40, '2020-01', 'sudah di konfirmasi', 'sudah bayar', '2020-01-11', 'bukti/9hcWVvjWlXIJSkiYBrRMNkcZXNzRAb36aHuwWqrE.jpg', '2025-05-11 19:04:53', '2025-05-11 19:04:53'),
(113, 40, '2020-02', 'sudah di konfirmasi', 'sudah bayar', '2020-02-11', 'bukti/PaJ8EMkvtzzsmzbplSpAOmEptWRlD7Bm1NuDBL0d.jpg', '2025-05-11 19:05:09', '2025-05-11 19:05:09'),
(114, 40, '2020-03', 'sudah di konfirmasi', 'sudah bayar', '2020-03-11', 'bukti/0L0tIRIgC3iAj1oM68svSDRo7MPerFDQFGXLd3li.jpg', '2025-05-11 19:05:22', '2025-05-11 19:05:22'),
(115, 40, '2020-04', 'sudah di konfirmasi', 'sudah bayar', '2020-04-11', 'bukti/Vi109B6MmmVj868ugJZcqNo19nW5SOcXCf3vXFUJ.jpg', '2025-05-11 19:05:35', '2025-05-11 19:05:35'),
(116, 40, '2020-05', 'sudah di konfirmasi', 'sudah bayar', '2020-05-11', 'bukti/raXGUNVUN04mUrIEJWhtb2zsyDbPTRFqrJbTLPbR.jpg', '2025-05-11 19:05:51', '2025-05-11 19:05:51'),
(117, 40, '2020-06', 'sudah di konfirmasi', 'sudah bayar', '2020-06-11', 'bukti/AL5MaCz64ugmI8BqMhw1Rlnqne9rqzpmXg6Igtga.jpg', '2025-05-11 19:06:03', '2025-05-11 19:06:03'),
(118, 40, '2020-07', 'sudah di konfirmasi', 'sudah bayar', '2020-07-11', 'bukti/TSP9NbsNVTPV3UsORaClqxjxwHWXXSrZMp8FKD1U.jpg', '2025-05-11 19:06:17', '2025-05-11 19:06:17'),
(119, 40, '2020-08', 'sudah di konfirmasi', 'sudah bayar', '2020-08-11', 'bukti/SC5u7Q5UIYSQsqRxzlavDxkzOx8EGETdGG9HrzLe.jpg', '2025-05-11 19:06:29', '2025-05-11 19:06:29'),
(120, 40, '2020-09', 'sudah di konfirmasi', 'sudah bayar', '2020-09-11', 'bukti/rYGvrkiIVOrylR68EVkIBN9XyWoWwcl0tHwJmPUo.jpg', '2025-05-11 19:06:45', '2025-05-11 19:06:45'),
(121, 40, '2020-10', 'sudah di konfirmasi', 'sudah bayar', '2020-10-11', 'bukti/Mhap184V3y09BK4FcgRtjVepXpRTdGWMGiozzrHL.jpg', '2025-05-11 19:07:03', '2025-05-11 19:07:03'),
(122, 40, '2020-11', 'sudah di konfirmasi', 'sudah bayar', '2020-11-11', 'bukti/b63SPBUkyNLC3bbrAmXeUkUYUtQkgmGIfsZR7OOi.jpg', '2025-05-11 19:07:15', '2025-05-11 19:07:15'),
(123, 40, '2020-12', 'sudah di konfirmasi', 'sudah bayar', '2020-12-11', 'bukti/ryqxuLXBFzjaBQR16msGadBkVkwbogEN9kMJwa7K.jpg', '2025-05-11 19:07:27', '2025-05-11 19:07:27'),
(124, 40, '2021-01', 'sudah di konfirmasi', 'sudah bayar', '2021-01-11', 'bukti/WV1ZvS4rMSINSfYWq7ZrXxpoWbHhmk9EHgbdDFHO.jpg', '2025-05-11 19:07:44', '2025-05-11 19:07:44'),
(125, 40, '2021-02', 'sudah di konfirmasi', 'sudah bayar', '2021-02-11', 'bukti/GSmqRgLG5XrSGFkhYa9OkXJqKwqlEvlCrCseVsiG.jpg', '2025-05-11 19:07:57', '2025-05-11 19:07:57'),
(126, 40, '2021-03', 'sudah di konfirmasi', 'sudah bayar', '2021-03-11', 'bukti/fH39wvyIiP4DN0z0QagqwqHuZxKRHZ4vKYtOx8AX.jpg', '2025-05-11 19:08:10', '2025-05-11 19:08:10'),
(127, 40, '2021-04', 'sudah di konfirmasi', 'sudah bayar', '2021-04-11', 'bukti/WbJd6JQSncc1mjwSxwMCUnKQZtK6FMYFwkTrhPRa.jpg', '2025-05-11 19:08:22', '2025-05-11 19:08:22'),
(128, 40, '2021-05', 'sudah di konfirmasi', 'sudah bayar', '2021-05-11', 'bukti/Dr3AVGK4k4zDBVKtOL1yLzFSRwzaQJQXsSpvdBDK.jpg', '2025-05-11 19:08:46', '2025-05-11 19:08:46'),
(129, 40, '2021-06', 'sudah di konfirmasi', 'sudah bayar', '2021-06-11', 'bukti/VCQFTrd92eTrjI7owyAhIPqYBydhu0m8N1LdxI8l.jpg', '2025-05-11 19:09:05', '2025-05-11 19:09:05'),
(130, 40, '2021-07', 'sudah di konfirmasi', 'sudah bayar', '2021-07-11', 'bukti/e6dtJXTAJjkWtBgScUWneAVNr38Q7Yf99l5jZQHT.jpg', '2025-05-11 19:09:19', '2025-05-11 19:09:19'),
(131, 40, '2021-08', 'sudah di konfirmasi', 'sudah bayar', '2021-08-11', 'bukti/1paszqpNZPcynV8KyC5ByAmNDUOJm1BcwHiG4WMf.jpg', '2025-05-11 19:09:34', '2025-05-11 19:09:34'),
(132, 40, '2021-09', 'sudah di konfirmasi', 'sudah bayar', '2021-09-11', 'bukti/Qo1cZczbE9SKx0kt1HmcHKakafzoOdvFpsH1Sszx.jpg', '2025-05-11 19:09:47', '2025-05-11 19:09:47'),
(133, 40, '2021-10', 'sudah di konfirmasi', 'sudah bayar', '2021-10-11', 'bukti/m2rICFTt5O2tofTBjKGWoHcmfH4cDQvxD5tbAWrL.jpg', '2025-05-11 19:10:11', '2025-05-11 19:10:11'),
(134, 40, '2021-11', 'sudah di konfirmasi', 'sudah bayar', '2021-11-11', 'bukti/XMIsVyYHJldXFxBtm64NpzB7raGtm5EopOiX8kwH.jpg', '2025-05-11 19:10:25', '2025-05-11 19:10:25'),
(135, 40, '2021-12', 'sudah di konfirmasi', 'sudah bayar', '2021-12-11', 'bukti/pAu3YR0FwwnyErDN4BjHscpX55eOlJmyJUT3cqul.jpg', '2025-05-11 19:10:41', '2025-05-11 19:10:41'),
(136, 40, '2022-01', 'sudah di konfirmasi', 'sudah bayar', '2022-01-11', 'bukti/OQuce87JYV1T2UVPFXCubbM5bxZM6vdaM8v3Z5j3.jpg', '2025-05-11 19:10:55', '2025-05-11 19:10:55'),
(137, 40, '2022-02', 'sudah di konfirmasi', 'sudah bayar', '2022-02-11', 'bukti/WH0VUC0lk6cdUmeeE18FRrl9YzdgtFUrvjc0ZoD7.jpg', '2025-05-11 19:11:10', '2025-05-11 19:11:10'),
(138, 40, '2022-03', 'sudah di konfirmasi', 'sudah bayar', '2022-03-11', 'bukti/AGPc7DeaWJEE0YxHxjwmQxNCzkQ3M7r9cAQEsY1l.jpg', '2025-05-11 19:11:23', '2025-05-11 19:11:23'),
(139, 40, '2022-04', 'sudah di konfirmasi', 'sudah bayar', '2022-04-11', 'bukti/zLIAFYO4r42MYiDVm7oOSV8NI8vcuExT1BNYlHZF.jpg', '2025-05-11 19:11:37', '2025-05-11 19:11:37'),
(140, 40, '2022-05', 'sudah di konfirmasi', 'sudah bayar', '2022-05-11', 'bukti/Du1nGY9BWVP7BRIBKmt7WlnqlgD6ECdIzWPskfFV.jpg', '2025-05-11 19:11:51', '2025-05-11 19:11:51'),
(141, 40, '2022-06', 'sudah di konfirmasi', 'sudah bayar', '2022-06-11', 'bukti/VUb0xRxNeuOC9KMZXfFm6nWtfeCRY9Lh8joKIoQZ.jpg', '2025-05-11 19:12:06', '2025-05-11 19:12:06'),
(142, 40, '2022-07', 'sudah di konfirmasi', 'sudah bayar', '2022-07-11', 'bukti/JtNvQyJYd0QW19yiEU2MUwKNe5xxGzgi2Pxpzuf2.jpg', '2025-05-11 19:12:19', '2025-05-11 19:12:19'),
(143, 40, '2022-08', 'sudah di konfirmasi', 'sudah bayar', '2022-08-11', 'bukti/F3qw8TB2D70Vbs2YltQGkALAqTx0zprvGrnxkxSS.jpg', '2025-05-11 19:12:34', '2025-05-11 19:12:34'),
(144, 40, '2022-09', 'sudah di konfirmasi', 'sudah bayar', '2022-09-11', 'bukti/xdxPtHSpVFxrIyAKVfcKVCzmBGF4ZBjhlKr2Fzrm.jpg', '2025-05-11 19:12:49', '2025-05-11 19:12:49'),
(145, 40, '2022-10', 'sudah di konfirmasi', 'sudah bayar', '2022-10-11', 'bukti/D94QYGRIlbx8wxc24A55t4GqM1og51YVRZct5L8z.jpg', '2025-05-11 19:13:02', '2025-05-11 19:13:02'),
(146, 40, '2022-11', 'sudah di konfirmasi', 'sudah bayar', '2022-11-11', 'bukti/BR3vpxcdZiHLvIuuLDieu5tjKeEKblcEAMvY2AQQ.jpg', '2025-05-11 19:13:16', '2025-05-11 19:13:16'),
(147, 40, '2022-12', 'sudah di konfirmasi', 'sudah bayar', '2022-12-11', 'bukti/Ac3srnlcAUM08PA4IKxPznr3JeTOO7B55bSvOuHA.jpg', '2025-05-11 19:13:31', '2025-05-11 19:13:31'),
(148, 40, '2023-01', 'sudah di konfirmasi', 'sudah bayar', '2023-01-11', 'bukti/w8ai5ovtMLi9i0qVhrXz4C07b6lI9NswBaQCM2t9.jpg', '2025-05-11 19:13:47', '2025-05-11 19:13:47'),
(149, 40, '2023-02', 'sudah di konfirmasi', 'sudah bayar', '2023-02-11', 'bukti/qvPNcez8QZ983LjiqjP0CkDu9KVZUQGJXHAFr6WQ.jpg', '2025-05-11 19:14:01', '2025-05-11 19:14:01'),
(150, 40, '2023-03', 'sudah di konfirmasi', 'sudah bayar', '2023-03-11', 'bukti/Q4ARfF9kMODBmAWAmi8tV4vKmOXt8teE9aHsONqR.jpg', '2025-05-11 19:14:16', '2025-05-11 19:14:16'),
(151, 40, '2023-04', 'sudah di konfirmasi', 'sudah bayar', '2023-04-11', 'bukti/bB4yU02UziR7p0rT3QOThU7fOvJ4croKhQRapxd6.jpg', '2025-05-11 19:14:30', '2025-05-11 19:14:30'),
(152, 40, '2023-05', 'sudah di konfirmasi', 'sudah bayar', '2023-05-11', 'bukti/4VmwE9DykhYAPMXOIxJaJ1n5zDHvd9N1IMqYaeI4.jpg', '2025-05-11 19:14:46', '2025-05-11 19:14:46'),
(153, 40, '2023-06', 'sudah di konfirmasi', 'sudah bayar', '2023-06-11', 'bukti/JggfZX3n7EV8ON8e8R2ZXZDV7d7pKJ6Goj5okBMk.jpg', '2025-05-11 19:15:04', '2025-05-11 19:15:04'),
(154, 40, '2023-07', 'sudah di konfirmasi', 'sudah bayar', '2023-07-11', 'bukti/iOxRV7ISQ6y6gzQE7LmlY5OdBMoYaYYYa7Tc5lpU.jpg', '2025-05-11 19:15:19', '2025-05-11 19:15:19'),
(155, 40, '2023-08', 'sudah di konfirmasi', 'sudah bayar', '2023-08-11', 'bukti/MjoHLQwa2zr73lPaZ9EhpV7TdnLwhh2V6qdfWU30.jpg', '2025-05-11 19:15:35', '2025-05-11 19:15:35'),
(156, 40, '2023-09', 'sudah di konfirmasi', 'sudah bayar', '2023-09-11', 'bukti/bvXqJTgILIvuE0hcYuGbgOfi8WVjTWhlujzmL7EC.jpg', '2025-05-11 19:15:50', '2025-05-11 19:15:50'),
(157, 40, '2023-10', 'sudah di konfirmasi', 'sudah bayar', '2023-10-11', 'bukti/Wc9bRGrr4Be8ozqEewH6WJgxcjlxKxexg1GSjUAM.jpg', '2025-05-11 19:16:06', '2025-05-11 19:16:06'),
(158, 40, '2023-11', 'sudah di konfirmasi', 'sudah bayar', '2023-11-11', 'bukti/pmnd4SZUrwRO8W2jbkgEJFFODoW6ZNSlf2rrLGUr.jpg', '2025-05-11 19:16:24', '2025-05-11 19:16:24'),
(159, 40, '2023-12', 'sudah di konfirmasi', 'sudah bayar', '2023-12-11', 'bukti/uOaBynoxV6oBg0HBxdP8vAGgRL143sRSPu6rQumj.jpg', '2025-05-11 19:16:39', '2025-05-11 19:16:39'),
(160, 40, '2024-01', 'sudah di konfirmasi', 'sudah bayar', '2024-01-11', 'bukti/NZgwDiE8fIVuf8G49Cv0EqvH8n7I8XYsj8wOtiNR.jpg', '2025-05-11 19:17:10', '2025-05-11 19:17:10'),
(161, 40, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-11', 'bukti/izxYUddXQH86sT8YY8UoM9pySmOxzLl8B6P1fFZq.jpg', '2025-05-11 19:17:25', '2025-05-11 19:17:25'),
(162, 40, '2024-03', 'sudah di konfirmasi', 'sudah bayar', '2024-03-11', 'bukti/IQNzBAyHc7jOCyUshiVGJGn95XwQzP4VUjQy1VzH.jpg', '2025-05-11 19:17:44', '2025-05-11 19:17:44'),
(163, 40, '2024-04', 'sudah di konfirmasi', 'sudah bayar', '2024-04-11', 'bukti/xwUU6CXPT3vVgEleJIjMXYOQPLdwLGPnl3ZODfKe.jpg', '2025-05-11 19:20:17', '2025-05-11 19:20:17'),
(164, 40, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-11', 'bukti/xIDwDGggcgkt5yL16LBdtU0c9KGzNBBrF8mH2rmr.jpg', '2025-05-11 19:21:08', '2025-05-11 19:21:08'),
(165, 40, '2024-06', 'sudah di konfirmasi', 'sudah bayar', '2024-06-11', 'bukti/hMxrTO2FkESystWzdcg2Qqp4C0MLLgWDpSKm1vMJ.jpg', '2025-05-11 19:21:23', '2025-05-11 19:21:23'),
(166, 40, '2024-07', 'sudah di konfirmasi', 'sudah bayar', '2024-07-11', 'bukti/FihzYEck9kkuLKzb2ssvRFXd6lnLud4LehcgRpEu.jpg', '2025-05-11 19:21:43', '2025-05-11 19:21:43'),
(167, 40, '2024-08', 'sudah di konfirmasi', 'sudah bayar', '2024-08-11', 'bukti/BLqoNkHQvPGt9tkVkDm0ngiUfG40i65oOrVHJknk.jpg', '2025-05-11 19:22:02', '2025-05-11 19:22:02'),
(168, 40, '2024-09', 'sudah di konfirmasi', 'sudah bayar', '2024-09-11', 'bukti/w3yfCcGKcVCdi7A9MlpQg0AKxjHhgJptNQTSXPK5.jpg', '2025-05-11 19:22:22', '2025-05-11 19:22:22'),
(169, 40, '2024-10', 'sudah di konfirmasi', 'sudah bayar', '2024-10-11', 'bukti/98zx0CSQBCtnG7gGCh1WiUfTH4ETDPwBAuxhcTJO.jpg', '2025-05-11 19:22:45', '2025-05-11 19:22:45'),
(170, 40, '2024-11', 'sudah di konfirmasi', 'sudah bayar', '2024-11-11', 'bukti/i5sIztiTksqV3Ut5ZLwhS2mwups5zRWBJay8Ykgw.jpg', '2025-05-11 19:23:02', '2025-05-11 19:23:02'),
(171, 40, '2024-12', 'sudah di konfirmasi', 'sudah bayar', '2024-12-11', 'bukti/fXBFMIkXLR0VwRCDfd6jA1WgXNGT61eL4bhk1qGf.jpg', '2025-05-11 19:23:48', '2025-05-11 19:23:48'),
(172, 40, '2025-01', 'sudah di konfirmasi', 'sudah bayar', '2025-01-11', 'bukti/ehpoQbAjehqYaSjMUCopQrzgq2yTda7CG9MLxHXy.jpg', '2025-05-11 19:24:20', '2025-05-11 19:24:20'),
(173, 40, '2025-02', 'sudah di konfirmasi', 'sudah bayar', '2025-02-11', 'bukti/UKdFcgaN7DUEWzKQQdJkr6JNjZeRZn69NGoS0vQT.jpg', '2025-05-11 19:24:52', '2025-05-11 19:24:52'),
(174, 40, '2025-03', 'sudah di konfirmasi', 'sudah bayar', '2025-03-11', 'bukti/N5s0F5Fa4DpxNVWie53NWugBgsact2TqFXesGKyT.jpg', '2025-05-11 19:25:50', '2025-05-11 19:25:50'),
(175, 40, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-11', 'bukti/13Ylbu2hUmw1TtUmz8VGhHUVfYWNgTplnMQZm0BD.jpg', '2025-05-11 19:26:11', '2025-05-11 19:26:11'),
(176, 40, '2025-05', 'sudah di konfirmasi', 'sudah bayar', '2025-05-11', 'bukti/Mgs0zyD7NfZK6HE2v81nePajXBSr8GZ1DnpnblqX.jpg', '2025-05-11 19:29:30', '2025-05-11 19:29:30'),
(177, 41, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-10', 'bukti_bayar/AlbiiVdS42htYAV0N13hO4NkeOqRhT09iKf9UYkq.jpg', '2025-05-11 19:48:56', '2025-05-11 19:48:56'),
(178, 41, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-10', 'bukti/RV5KuGdrPbirfuVDbH3mnzUlpaDYoEX5bDjU3TmQ.jpg', '2025-05-11 19:53:46', '2025-05-11 19:53:46'),
(179, 41, '2024-03', 'sudah di konfirmasi', 'sudah bayar', '2024-03-10', 'bukti/3BWdTvsXis5p5W2AOBJVahyC4Pw1kTOGlaHG5BlN.jpg', '2025-05-11 19:55:26', '2025-05-11 19:55:26'),
(180, 41, '2024-04', 'sudah di konfirmasi', 'sudah bayar', '2024-04-10', 'bukti/RxbLGEJ40J48vBvbiB5qSwguK8E4tF6nh5eLXjjB.jpg', '2025-05-11 19:55:42', '2025-05-11 19:55:42'),
(181, 41, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-10', 'bukti/7whWGkFqTCa5NcZ0XGpfk2zcu1C4AbG8JEP4yaOr.jpg', '2025-05-11 19:56:04', '2025-05-11 19:56:04'),
(182, 41, '2024-06', 'sudah di konfirmasi', 'sudah bayar', '2024-06-10', 'bukti/lWX8QFA4524FZ9wqx3pMeZqf4WkfSkJwdd9IfqEC.jpg', '2025-05-11 19:56:33', '2025-05-11 19:56:33'),
(183, 41, '2024-07', 'sudah di konfirmasi', 'sudah bayar', '2024-07-10', 'bukti/66XWKHNcJ7clL8NoZ8HeW7Z3HKUgHN9DoFeYNBkw.jpg', '2025-05-11 19:56:49', '2025-05-11 19:56:49'),
(184, 41, '2024-08', 'sudah di konfirmasi', 'sudah bayar', '2024-08-10', 'bukti/h3RkLspWPI2fjqvpeHg7J0qfMIifuCFHSvyJj0C0.jpg', '2025-05-11 19:58:37', '2025-05-11 19:58:37'),
(185, 41, '2024-09', 'sudah di konfirmasi', 'sudah bayar', '2024-09-10', 'bukti/Dmuw8JsQ7LAbPUPEHJSyOp0aMXcmMsT48HZLWOwU.jpg', '2025-05-11 19:58:51', '2025-05-11 19:58:51'),
(186, 41, '2024-10', 'sudah di konfirmasi', 'sudah bayar', '2024-10-10', 'bukti/gB57sjjqfSnoAcLuIqPzB5K7pSDiP5jD4iBrK2IB.jpg', '2025-05-11 19:59:16', '2025-05-11 19:59:16'),
(187, 41, '2024-11', 'sudah di konfirmasi', 'sudah bayar', '2024-11-10', 'bukti/P8nUaHo85BeMn1h0kwK6lpgyn60eIiXejNU6UlFP.jpg', '2025-05-11 19:59:39', '2025-05-11 19:59:39'),
(188, 41, '2024-12', 'sudah di konfirmasi', 'sudah bayar', '2024-12-10', 'bukti/pCfLe4dWorgO33J3QZQ6XKFE7882F4XbUi4VOdI1.jpg', '2025-05-11 20:00:05', '2025-05-11 20:00:05'),
(189, 41, '2025-01', 'sudah di konfirmasi', 'sudah bayar', '2025-01-10', 'bukti/oZBT1GEqVQ5JsVVirNbRvT0eq8LfvvXbvtfUuetG.jpg', '2025-05-11 20:00:29', '2025-05-11 20:00:29'),
(190, 41, '2025-02', 'sudah di konfirmasi', 'sudah bayar', '2025-02-10', 'bukti/3o80izY7ChHPv3wuBJN5ceybeidbovQq9aGHNeJf.jpg', '2025-05-11 20:00:47', '2025-05-11 20:00:47'),
(191, 41, '2025-03', 'sudah di konfirmasi', 'sudah bayar', '2025-03-10', 'bukti/KFnbD4uNBztCc8ofi3FEENdUBB1rqUxpORZyX9Pq.jpg', '2025-05-11 20:01:03', '2025-05-11 20:01:03'),
(192, 41, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-10', 'bukti/MNlK5NIjYlQMDybIg9AWqkop0r2CpmEzpRa8F2sO.jpg', '2025-05-11 20:01:32', '2025-05-11 20:01:32'),
(193, 42, '2022-04', 'sudah di konfirmasi', 'sudah bayar', '2022-04-15', 'bukti_bayar/JAx6VzumUVrqscssSym6FUIeO64zAi3IIDDP3DZz.jpg', '2025-05-11 20:37:20', '2025-05-11 20:37:20'),
(194, 42, '2022-05', 'sudah di konfirmasi', 'sudah bayar', '2022-05-15', 'bukti/C5xGfwyE5WcOZNXETCmo6hQ29VqiAmYthO1zmQRP.jpg', '2025-05-11 20:39:23', '2025-05-11 20:39:23'),
(195, 42, '2022-06', 'sudah di konfirmasi', 'sudah bayar', '2022-06-15', 'bukti/UBtiaPkJbdMD14IdAbYG0aCdIgPcLyCQTMFYeG5v.jpg', '2025-05-11 20:39:42', '2025-05-11 20:39:42'),
(196, 42, '2022-07', 'sudah di konfirmasi', 'sudah bayar', '2022-07-15', 'bukti/VOoG27sYOTJp0J2A7yfaUTW2I23ItDLchssI34Iu.jpg', '2025-05-11 20:39:58', '2025-05-11 20:39:58'),
(197, 42, '2022-08', 'sudah di konfirmasi', 'sudah bayar', '2022-08-15', 'bukti/hzQmxmwChkqkQwCXB301iTrWSk6uYHhgjxusoWDj.jpg', '2025-05-11 20:40:16', '2025-05-11 20:40:16'),
(198, 42, '2022-09', 'sudah di konfirmasi', 'sudah bayar', '2022-09-15', 'bukti/2AdgqoyHs3t2GUFehfpT6N5lPSWuoXAyAEsjxgP3.jpg', '2025-05-11 20:40:35', '2025-05-11 20:40:35'),
(199, 42, '2022-10', 'sudah di konfirmasi', 'sudah bayar', '2022-10-15', 'bukti/Uy5AQwhi03sjaiffu3VlAgnfiT9o5JvYCLfbx1l1.jpg', '2025-05-11 20:40:49', '2025-05-11 20:40:49'),
(200, 42, '2022-11', 'sudah di konfirmasi', 'sudah bayar', '2022-11-15', 'bukti/8p86wUbD6Q9almHzk19X5Z28KGq35KUBqOw2cikU.jpg', '2025-05-11 20:41:03', '2025-05-11 20:41:03'),
(201, 42, '2022-12', 'sudah di konfirmasi', 'sudah bayar', '2022-12-15', 'bukti/OiXVMi3rZ5bE3FAGEezRluBzlT2VnYQxpITBH8Zc.jpg', '2025-05-11 20:41:26', '2025-05-11 20:41:26'),
(202, 42, '2023-01', 'sudah di konfirmasi', 'sudah bayar', '2023-01-15', 'bukti/RpXuaQCtJR5bDXOEY9DsyqwYmOCkhsSC4VQwqC7Q.jpg', '2025-05-11 20:41:42', '2025-05-11 20:41:42'),
(203, 42, '2023-01', 'sudah di konfirmasi', 'sudah bayar', '2023-01-15', 'bukti/jgyAhIx09taColgmcoyqSvyGrUVJ6akNHwiEn9Bo.jpg', '2025-05-11 20:41:43', '2025-05-11 20:41:43'),
(204, 42, '2023-02', 'sudah di konfirmasi', 'sudah bayar', '2023-02-15', 'bukti/YK0668hEBvv03TYObuJuicHaAquR3kcUJ5VY2CpC.jpg', '2025-05-11 20:41:56', '2025-05-11 20:41:56'),
(205, 42, '2023-03', 'sudah di konfirmasi', 'sudah bayar', '2023-03-15', 'bukti/ral6zYcLtfCRoW2YWxVbztdx44vMd6HVhRmk2toS.jpg', '2025-05-11 20:42:10', '2025-05-11 20:42:10'),
(206, 42, '2023-04', 'sudah di konfirmasi', 'sudah bayar', '2023-04-15', 'bukti/TSiDL6u2fyv7ERymATAWPrm4RljyFxf2R5Mzg3rA.jpg', '2025-05-11 20:42:24', '2025-05-11 20:42:24'),
(207, 42, '2023-05', 'sudah di konfirmasi', 'sudah bayar', '2023-05-15', 'bukti/UaxfIfjsIgsoXcrh4l1LmpAgCnmDCaxR0RHNtYnU.jpg', '2025-05-11 20:42:40', '2025-05-11 20:42:40'),
(208, 42, '2023-06', 'sudah di konfirmasi', 'sudah bayar', '2023-06-15', 'bukti/KJaLd9nEMVbY6yBPBxF0ap73jTPFNP5b7TnmqEUc.jpg', '2025-05-11 20:42:57', '2025-05-11 20:42:57'),
(209, 42, '2023-07', 'sudah di konfirmasi', 'sudah bayar', '2023-07-15', 'bukti/RA09oAYMeGXlZVDTsMrKp3NAAKPtA2FwN7U1bJS0.jpg', '2025-05-11 20:43:12', '2025-05-11 20:43:12'),
(210, 42, '2023-08', 'sudah di konfirmasi', 'sudah bayar', '2023-08-15', 'bukti/hKkL8gpXtEN2JzJWy7dNAG99J6e3phF25D2ZbMo4.jpg', '2025-05-11 20:43:27', '2025-05-11 20:43:27'),
(211, 42, '2023-09', 'sudah di konfirmasi', 'sudah bayar', '2023-09-15', 'bukti/9mjjE9tXMlnzabKpCFA74wIPOavWtVqSLlKsA4QZ.jpg', '2025-05-11 20:43:40', '2025-05-11 20:43:40'),
(212, 42, '2023-10', 'sudah di konfirmasi', 'sudah bayar', '2023-10-15', 'bukti/mWVJsm9gYrtiDSGAAwbdyELhNioTzYiQSedObSfj.jpg', '2025-05-11 20:44:30', '2025-05-11 20:44:30'),
(213, 42, '2023-11', 'sudah di konfirmasi', 'sudah bayar', '2023-11-15', 'bukti/ReYeFQetQf93qCJGy8AMS94adSCvmGvG4xM3y2OF.jpg', '2025-05-11 20:44:45', '2025-05-11 20:44:45'),
(214, 42, '2023-12', 'sudah di konfirmasi', 'sudah bayar', '2023-12-15', 'bukti/ZbKEbIoPc4u1fDOk4QXR8YkRwg8pOjf9hkPZ1Wym.jpg', '2025-05-11 20:45:03', '2025-05-11 20:45:03'),
(216, 42, '2024-01', 'sudah di konfirmasi', 'sudah bayar', '2024-01-15', 'bukti/FpR7sub2sVIGf3Aud9iWTLibbNJCRFKTYgsKeRlj.jpg', '2025-05-11 20:48:08', '2025-05-11 20:48:08'),
(217, 42, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-15', 'bukti/Ffit8IWm897eCl2DcSpb8m4PQo5RmE9Uoyk0Efov.jpg', '2025-05-11 20:48:20', '2025-05-11 20:48:20'),
(218, 42, '2024-03', 'sudah di konfirmasi', 'sudah bayar', '2024-03-15', 'bukti/BUw5isqXTO2H2pqOdSEDSR1yK5OLPiJe5aVQoIlk.jpg', '2025-05-11 20:49:38', '2025-05-11 20:49:38'),
(219, 42, '2024-04', 'sudah di konfirmasi', 'sudah bayar', '2024-04-15', 'bukti/StCwit3Sn5PP0u9mCYWB3iqplcuWlXif00pZlvYW.jpg', '2025-05-11 20:49:52', '2025-05-11 20:49:52'),
(220, 42, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-15', 'bukti/Y8yELZ25QAHMV7QZbzvDPB33n7KUtqsuOSpTnKwG.jpg', '2025-05-11 20:50:12', '2025-05-11 20:50:12'),
(221, 42, '2024-06', 'sudah di konfirmasi', 'sudah bayar', '2024-06-15', 'bukti/eWzhkte0nPnyl57ZlxzpaehcylEC6NxiYzDH8lLj.jpg', '2025-05-11 20:50:42', '2025-05-11 20:50:42'),
(222, 42, '2024-07', 'sudah di konfirmasi', 'sudah bayar', '2024-07-15', 'bukti/G0YvdIvnDlFb8p7rc5VOrrsIsHZGw7ZfQcsSl1IJ.jpg', '2025-05-11 20:51:00', '2025-05-11 20:51:00'),
(223, 42, '2024-08', 'sudah di konfirmasi', 'sudah bayar', '2024-08-15', 'bukti/PJoDsCIyKopkjfwAVpKnoCShQcNt6RXsQ9U802nV.jpg', '2025-05-11 20:51:14', '2025-05-11 20:51:14'),
(224, 42, '2024-09', 'sudah di konfirmasi', 'sudah bayar', '2024-09-15', 'bukti/o6lcTiyTZPpUdolp9flHPNiqlylodNBFflp5pnkK.jpg', '2025-05-11 20:51:39', '2025-05-11 20:51:39'),
(225, 42, '2024-10', 'sudah di konfirmasi', 'sudah bayar', '2024-10-15', 'bukti/bYi4IxAzimj1GYZCVJ4vaCRL6wJtz7oDauLmpaI5.jpg', '2025-05-11 20:52:02', '2025-05-11 20:52:02'),
(226, 42, '2024-11', 'sudah di konfirmasi', 'sudah bayar', '2024-11-15', 'bukti/jMJxQ8E0W7NS9MzQLnO1cH4Wa9l1Gjy3UlP0Mgf4.jpg', '2025-05-11 20:52:33', '2025-05-11 20:52:33'),
(227, 42, '2024-12', 'sudah di konfirmasi', 'sudah bayar', '2024-12-15', 'bukti/lm0SFayncn5XmRoKZMEwGxHcK8lPGVaX5Qpo0swF.jpg', '2025-05-11 20:52:54', '2025-05-11 20:52:54'),
(228, 42, '2025-01', 'sudah di konfirmasi', 'sudah bayar', '2025-01-15', 'bukti/Gz5bjXyPfBnLRtr8T1OUtVwyVnSpzfVyKn4x0Sm1.jpg', '2025-05-11 20:53:54', '2025-05-11 20:53:54'),
(229, 42, '2025-02', 'sudah di konfirmasi', 'sudah bayar', '2025-02-15', 'bukti/w96LPeOhARMRpNEPgJPe3zSFNGBlD2q6F3NgSt81.jpg', '2025-05-11 20:54:09', '2025-05-11 20:54:09'),
(230, 42, '2025-03', 'sudah di konfirmasi', 'sudah bayar', '2025-03-15', 'bukti/yVXA6fi1XM6qIpP4x6g30R21RRDjh0Sefh0oFBCp.jpg', '2025-05-11 20:54:25', '2025-05-11 20:54:25'),
(231, 42, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-15', 'bukti/3hJlmlsnLI8BvGCXu6goMyPlKpcZA1EkySMRPKq7.jpg', '2025-05-11 20:54:40', '2025-05-11 20:54:40'),
(232, 43, '2022-05', 'sudah di konfirmasi', 'sudah bayar', '2022-05-11', 'bukti_bayar/8X5yUM7jK5DMzGIis3Fu5fyk19WPVTsnjFUX9q2i.jpg', '2025-05-11 21:14:01', '2025-05-11 21:14:01'),
(233, 43, '2022-06', 'sudah di konfirmasi', 'sudah bayar', '2022-06-11', 'bukti/VdyYjm9w9RYMtK45VXCBnL5Ux77AdRYhZH7IS4pU.jpg', '2025-05-11 21:15:44', '2025-05-11 21:15:44'),
(234, 43, '2022-07', 'sudah di konfirmasi', 'sudah bayar', '2022-07-11', 'bukti/Rhp1rB5NPX9v2WqVcjjEfhrApYxGHzlcpPGPDVfI.jpg', '2025-05-11 21:15:56', '2025-05-11 21:15:56'),
(235, 43, '2022-08', 'sudah di konfirmasi', 'sudah bayar', '2022-08-11', 'bukti/idQpKRmUPvkOv11QO9PJFJKi8VIRDMy412ObVGhX.jpg', '2025-05-11 21:16:10', '2025-05-11 21:16:10'),
(236, 43, '2022-09', 'sudah di konfirmasi', 'sudah bayar', '2022-09-11', 'bukti/GQh2KKOMYtl6NFMhY7yOil7hD2lBRlTnMJMwSDJb.jpg', '2025-05-11 21:16:56', '2025-05-11 21:16:56'),
(237, 43, '2022-10', 'sudah di konfirmasi', 'sudah bayar', '2022-10-11', 'bukti/AAgrvHiycdxbWyI8N9IoIl6YPF1z8P98LDbGwxyw.jpg', '2025-05-11 21:17:13', '2025-05-11 21:17:13'),
(238, 43, '2022-11', 'sudah di konfirmasi', 'sudah bayar', '2022-11-11', 'bukti/uAXCVbQOZS43dRFx9w9H38nbuuAQhfHfjVIvaXTo.jpg', '2025-05-11 21:17:26', '2025-05-11 21:17:26'),
(239, 43, '2022-12', 'sudah di konfirmasi', 'sudah bayar', '2022-12-11', 'bukti/fjwXQsOEYtGNfmZci3EPTryfjedeRGA8JK8Xw8K9.jpg', '2025-05-11 21:17:43', '2025-05-11 21:17:43'),
(240, 43, '2023-01', 'sudah di konfirmasi', 'sudah bayar', '2023-01-11', 'bukti/MQX0XnDGUFxNy3DVnht1VucRQuhP0yIjUFhO97zV.jpg', '2025-05-11 21:18:17', '2025-05-11 21:18:17'),
(241, 43, '2023-02', 'sudah di konfirmasi', 'sudah bayar', '2023-02-11', 'bukti/lADrRBkPgYhj8JCuv3phGtz5PwDiZGcWlS7gRgoC.jpg', '2025-05-11 21:18:35', '2025-05-11 21:18:35'),
(242, 43, '2023-03', 'sudah di konfirmasi', 'sudah bayar', '2023-03-11', 'bukti/27exYHmeOpNdsBRujqCRzsTNnSq6ieh02tz65cwC.jpg', '2025-05-11 21:18:50', '2025-05-11 21:18:50'),
(243, 43, '2023-04', 'sudah di konfirmasi', 'sudah bayar', '2023-04-11', 'bukti/4kaaENgTIKhR3rrHmMb3I6IgTK6koyDdgsmaggfh.jpg', '2025-05-11 21:19:06', '2025-05-11 21:19:06'),
(244, 43, '2023-05', 'sudah di konfirmasi', 'sudah bayar', '2023-05-11', 'bukti/hQ5w4Yp9pUqmPwp7hmzwFv8gnzxKhR5MmgFgteFQ.jpg', '2025-05-11 21:19:19', '2025-05-11 21:19:19'),
(245, 43, '2023-06', 'sudah di konfirmasi', 'sudah bayar', '2023-06-11', 'bukti/OXLdIFvYMl2Sy98t9MdxNowIUXGpGkRzmu2a26Yi.jpg', '2025-05-11 21:19:39', '2025-05-11 21:19:39'),
(246, 43, '2023-07', 'sudah di konfirmasi', 'sudah bayar', '2023-07-11', 'bukti/oCONF31CISRhjLw7Ol1BptwLl3RiZx37PZSM4GxQ.jpg', '2025-05-11 21:19:55', '2025-05-11 21:19:55'),
(247, 43, '2023-08', 'sudah di konfirmasi', 'sudah bayar', '2023-08-11', 'bukti/AaVgoDizWnO0AUi0s4tSBWHPWzRtWldC6H6sFb3t.jpg', '2025-05-11 21:20:12', '2025-05-11 21:20:12'),
(248, 43, '2023-09', 'sudah di konfirmasi', 'sudah bayar', '2023-09-11', 'bukti/LacB3YNaWqH01sO2g0TmcmwfkXEQljhOgOUsP4zR.jpg', '2025-05-11 21:20:29', '2025-05-11 21:20:29'),
(249, 43, '2023-10', 'sudah di konfirmasi', 'sudah bayar', '2023-10-11', 'bukti/m7MCcFIYOR9meffPILyPymvMXPomsUDPq7pit40t.jpg', '2025-05-11 21:22:22', '2025-05-11 21:22:22'),
(250, 43, '2023-11', 'sudah di konfirmasi', 'sudah bayar', '2023-11-11', 'bukti/nTyqGVuYx4eapftMhCjgH8YOF8Oko3nle9HkBAke.jpg', '2025-05-11 21:22:36', '2025-05-11 21:22:36'),
(251, 43, '2023-12', 'sudah di konfirmasi', 'sudah bayar', '2023-12-11', 'bukti/5WrGkcf4LTIlrdbfzWWKGHfLlS7s1fRkTnnU9dkg.jpg', '2025-05-11 21:22:50', '2025-05-11 21:22:50'),
(252, 43, '2024-01', 'sudah di konfirmasi', 'sudah bayar', '2024-01-11', 'bukti/hcYC2cLmaXAx6P8CJ9Bnp5fgUtBlOM03DNMQIvP9.jpg', '2025-05-11 21:23:03', '2025-05-11 21:23:03'),
(253, 43, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-11', 'bukti/lS1bo7TC3mUXyxKvGLdKjGebl4WZNArB0Gva46Ku.jpg', '2025-05-11 21:23:16', '2025-05-11 21:23:16'),
(254, 43, '2024-03', 'sudah di konfirmasi', 'sudah bayar', '2024-03-11', 'bukti/qKF3VuLlDs0jnvmTWmrmtA4AK76O6najOCvFpTQC.jpg', '2025-05-11 21:24:42', '2025-05-11 21:24:42'),
(255, 43, '2024-04', 'sudah di konfirmasi', 'sudah bayar', '2024-04-11', 'bukti/cgVkHwIJmVeDAUHNP4Ah7ROxvtaNUyfVyyIcI1Q5.jpg', '2025-05-11 21:24:56', '2025-05-11 21:24:56'),
(256, 43, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-11', 'bukti/v2I0PpbeMe0ejhJosGdUomrWQ7zJSCxv2pOkjTsR.jpg', '2025-05-11 21:25:15', '2025-05-11 21:25:15'),
(257, 43, '2024-06', 'sudah di konfirmasi', 'sudah bayar', '2024-06-11', 'bukti/nx7TMDoLInzuIDKcqSadHmM8ixdjsW84owPKY3fn.jpg', '2025-05-11 21:26:20', '2025-05-11 21:26:20'),
(258, 43, '2024-07', 'sudah di konfirmasi', 'sudah bayar', '2024-07-11', 'bukti/y7zkv9I8bCurzxgs96VgknwKdbwtlr7P4RVHuPgW.jpg', '2025-05-11 21:26:37', '2025-05-11 21:26:37'),
(259, 43, '2024-08', 'sudah di konfirmasi', 'sudah bayar', '2024-08-11', 'bukti/jC0ojP2QCNN6wVomAVqV5tdORjSEkqoY2UjpID4V.jpg', '2025-05-11 21:26:50', '2025-05-11 21:26:50'),
(260, 43, '2024-09', 'sudah di konfirmasi', 'sudah bayar', '2024-09-11', 'bukti/1UXsgq0BOQYFoOCvfMMrXntcnQQikBWESHg3ygD1.jpg', '2025-05-11 21:27:03', '2025-05-11 21:27:03'),
(261, 43, '2024-10', 'sudah di konfirmasi', 'sudah bayar', '2024-10-11', 'bukti/EHsFLimZrYrb6WkTKPOOLWpq0O5ZpCDW9aUAWqss.jpg', '2025-05-11 21:27:27', '2025-05-11 21:27:27'),
(262, 43, '2024-11', 'sudah di konfirmasi', 'sudah bayar', '2024-11-11', 'bukti/ATrRspKMXWDDoL2IDCT9W0QQh3uTje4osovXDvzv.jpg', '2025-05-11 21:28:44', '2025-05-11 21:28:44'),
(263, 43, '2024-12', 'sudah di konfirmasi', 'sudah bayar', '2024-12-11', 'bukti/YGVyTkS28VrY16VZaZT7qEKBOeGgVRVyosWlz4so.jpg', '2025-05-11 21:29:00', '2025-05-11 21:29:00'),
(264, 43, '2025-01', 'sudah di konfirmasi', 'sudah bayar', '2025-01-11', 'bukti/NDnUpasHnbb9fzy5q797pYAXtpuXc2H2eRjh5Bwx.jpg', '2025-05-11 21:29:14', '2025-05-11 21:29:14'),
(265, 43, '2025-02', 'sudah di konfirmasi', 'sudah bayar', '2025-02-11', 'bukti/0SwxID3wGdluQ9pX0V6nQSDiaw2J69GdSZEjt55F.jpg', '2025-05-11 21:29:27', '2025-05-11 21:29:27'),
(266, 43, '2025-03', 'sudah di konfirmasi', 'sudah bayar', '2025-03-11', 'bukti/vaO8DOXlPVP0MsbPEUxzsb3NhtNKlo3G60sGWyzj.jpg', '2025-05-11 21:29:48', '2025-05-11 21:29:48'),
(267, 43, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-11', 'bukti/Z8cIBe3rVf2pn45MkAFeOUMWcSyoP8MEBjmgRVYE.jpg', '2025-05-11 21:30:28', '2025-05-11 21:30:28'),
(268, 44, '2024-01', 'sudah di konfirmasi', 'sudah bayar', '2024-01-29', 'bukti_bayar/MYTrmZiC980kO5ZvMXYJKs417TdA6xlk9NrKs7qC.jpg', '2025-05-11 21:58:05', '2025-05-11 21:58:05'),
(269, 44, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-29', 'bukti/y03kaw19jPckMejKnnI1fE8o1eg4aWBqI5JUV2KL.jpg', '2025-05-11 22:01:02', '2025-05-11 22:01:02'),
(270, 44, '2024-03', 'sudah di konfirmasi', 'sudah bayar', '2024-03-29', 'bukti/22KgNH1JRwwBck7vkZU6kt2ka7iASMulKT4f5Pt8.jpg', '2025-05-11 22:01:20', '2025-05-11 22:01:20'),
(271, 44, '2024-04', 'sudah di konfirmasi', 'sudah bayar', '2024-04-29', 'bukti/K5lV4S4XVm8otOCGV2lqa7EGmuAIPq2OLVY44yDU.jpg', '2025-05-11 22:01:37', '2025-05-11 22:01:37'),
(272, 44, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-29', 'bukti/0n3fjGmybt0c7CoezTjqSShd9yVO2QshEJyuiPIT.jpg', '2025-05-11 22:02:30', '2025-05-11 22:02:30'),
(273, 44, '2024-06', 'sudah di konfirmasi', 'sudah bayar', '2024-06-29', 'bukti/DKYXrAEI3OUWiz263wOP2XTPvas2nLLq0tRTx98r.jpg', '2025-05-11 22:02:46', '2025-05-11 22:02:46'),
(274, 44, '2024-07', 'sudah di konfirmasi', 'sudah bayar', '2024-07-29', 'bukti/5KPx0NUdx4zhEhOGshmgEvlV3X4bJ1lWMzTTKqIg.jpg', '2025-05-11 22:03:04', '2025-05-11 22:03:04'),
(275, 44, '2024-08', 'sudah di konfirmasi', 'sudah bayar', '2024-08-29', 'bukti/UlQ4DCKLmzPtmZct4tZroivdop8pkquXdEascCe0.jpg', '2025-05-11 22:03:35', '2025-05-11 22:03:35'),
(276, 45, '2023-12', 'sudah di konfirmasi', 'sudah bayar', '2023-12-12', 'bukti_bayar/rxijrDjNppel2ZoWsRM5Ahtq9nY4bkyrObNSV76f.jpg', '2025-05-11 22:36:30', '2025-05-11 22:36:30'),
(277, 45, '2024-01', 'sudah di konfirmasi', 'sudah bayar', '2024-01-12', 'bukti/cuR0rAunx9uvCGv9zinq8PZMwBCqU9dHOmVpdYzz.jpg', '2025-05-11 22:38:57', '2025-05-11 22:38:57'),
(278, 45, '2024-02', 'sudah di konfirmasi', 'sudah bayar', '2024-02-12', 'bukti/wu9d6UEJU59EnDTGxJhEZwgWSBuLnsIHaB7ZxWnc.jpg', '2025-05-11 22:39:11', '2025-05-11 22:39:11'),
(279, 45, '2024-03', 'sudah di konfirmasi', 'sudah bayar', '2024-03-12', 'bukti/J6OleGoo3daAbVGZGwde8dcUBrjMvM7DIqJbHFJo.jpg', '2025-05-11 22:39:27', '2025-05-11 22:39:27'),
(280, 45, '2024-04', 'sudah di konfirmasi', 'sudah bayar', '2024-04-12', 'bukti/m2yNXohghvfqcBNbB7ACe8d3mR500QECuW0oL9vb.jpg', '2025-05-11 22:39:42', '2025-05-11 22:39:42'),
(281, 45, '2024-05', 'sudah di konfirmasi', 'sudah bayar', '2024-05-12', 'bukti/tfT3P8tp9aFCSupHYHfUmptSt3ba6njkXSKsi4vM.jpg', '2025-05-11 22:39:56', '2025-05-11 22:39:56'),
(282, 45, '2024-06', 'sudah di konfirmasi', 'sudah bayar', '2024-06-12', 'bukti/W55VgLv0af0ExX22C2s9L5HQ3SOJNstD1tfKxX4A.jpg', '2025-05-11 22:40:09', '2025-05-11 22:40:09'),
(283, 45, '2024-07', 'sudah di konfirmasi', 'sudah bayar', '2024-07-12', 'bukti/5HctZtQJwQksJTOLHKAYdlXSPwMjAY1UFjAu1Rxc.jpg', '2025-05-11 22:40:22', '2025-05-11 22:40:22'),
(284, 45, '2024-08', 'sudah di konfirmasi', 'sudah bayar', '2024-08-12', 'bukti/ykj16z5WvToT6Km6g6yhx4vyZsnz9ZakteOE9Jml.jpg', '2025-05-11 22:40:37', '2025-05-11 22:40:37'),
(285, 45, '2024-09', 'sudah di konfirmasi', 'sudah bayar', '2024-09-12', 'bukti/FLBPycDkJO5ppsETq05eJ51guZFip1CAWIMmOe71.jpg', '2025-05-11 22:40:58', '2025-05-11 22:40:58'),
(286, 45, '2024-10', 'sudah di konfirmasi', 'sudah bayar', '2024-10-12', 'bukti/AtPdJE9l0vMP7ccvMhIxVEJaREmZPNaycX2UUthK.jpg', '2025-05-11 22:41:14', '2025-05-11 22:41:14'),
(287, 45, '2024-11', 'sudah di konfirmasi', 'sudah bayar', '2024-11-12', 'bukti/NuIMzaf5l62dquP6OzBRbeJQmGdTyXWTkPZqyiHN.jpg', '2025-05-11 22:41:31', '2025-05-11 22:41:31'),
(288, 45, '2024-12', 'sudah di konfirmasi', 'sudah bayar', '2024-12-12', 'bukti/fNEf4V53lxsIPphZtaoBHrhstQeoJfF41ESrowl7.jpg', '2025-05-11 22:41:45', '2025-05-11 22:41:45'),
(289, 45, '2025-01', 'sudah di konfirmasi', 'sudah bayar', '2025-01-12', 'bukti/GYxWA8RXrtkazccfY6ri47Ovrb6FUpQVtbZW1stP.jpg', '2025-05-11 22:42:08', '2025-05-11 22:42:08'),
(290, 45, '2025-02', 'sudah di konfirmasi', 'sudah bayar', '2025-02-12', 'bukti/Sgn9E3JXrLBmynd5L1Mwt2KgDBGhrGnfJwc7iwoP.jpg', '2025-05-11 22:42:25', '2025-05-11 22:42:25'),
(291, 45, '2025-03', 'sudah di konfirmasi', 'sudah bayar', '2025-03-12', 'bukti/ES0xEEsFIwtPWxUWCPMFtMszKgve6A22jrPn1cCs.jpg', '2025-05-11 22:43:15', '2025-05-11 22:43:15'),
(292, 45, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-12', 'bukti/EQXBqXlTWQ95T1w2QDPpOpRenv7GlaQpA1WW8yDh.jpg', '2025-05-11 22:43:56', '2025-05-11 22:43:56'),
(293, 46, '2025-01', 'sudah di konfirmasi', 'sudah bayar', '2025-01-08', 'bukti_bayar/0kkNnajxACzKuyXRUfZHYpQvstrodLgINFU5z0qS.jpg', '2025-05-11 23:24:53', '2025-05-11 23:24:53'),
(294, 46, '2025-02', 'sudah di konfirmasi', 'sudah bayar', '2025-02-08', 'bukti/wI0KgcU1rTzLCx9LIvKx3IzU6CKjErLpA7DfYn38.jpg', '2025-05-11 23:27:40', '2025-05-11 23:27:40'),
(295, 46, '2025-03', 'sudah di konfirmasi', 'sudah bayar', '2025-03-08', 'bukti/7msP0SgenTZkL2R7FzFLWiTBv0mxKgRYt4HUZbcx.jpg', '2025-05-11 23:27:54', '2025-05-11 23:27:54'),
(296, 46, '2025-04', 'sudah di konfirmasi', 'sudah bayar', '2025-04-08', 'bukti/qHhtOycfvc5fmHDCe9rLuIbzZWsP9vq9sc5pVOJd.jpg', '2025-05-11 23:28:05', '2025-05-11 23:28:05'),
(297, 46, '2025-05', 'menunggu konfirmasi', 'belum bayar', '2025-05-08', 'bukti/SECvXodBME6qy5QPoS7x4bl9vt6X7mp9rLb2G6ev.jpg', '2025-05-11 23:28:16', '2025-05-11 23:28:16'),
(299, 37, '2025-05', 'sudah di konfirmasi', 'sudah bayar', '2025-05-12', 'bukti/eoP0jC20AGmHbVH1xSnYNUWsKR1cxDhn1K5LxTeq.jpg', '2025-05-12 09:55:42', '2025-05-12 10:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9KlyBRH4nP6lHgKpdeDyUV4JKuwkblGLkMLBuroH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ0JwQlo5YzRUc05BN25FOGhMa3VRbmtLYk1HNEEydGxmUjRLcWdWaCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2RhdGFwZW1iYXlhcmFuIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9kYXRhcGVtYmF5YXJhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747087274),
('fDs0ugefghcQGcrCwl3skPspEP4own4C3b8dpavp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibm5wZVpqdG9DQ2pvdzZCREl4WGc4bE1oVGMwSWNsTTNOaUFTQjhQNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1747076303),
('I3oopA3TQzgd0uXKvwirsr9NsvzVWkQPuQjbV3vu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY0Y2a1FKSTZncnVtQVZKV1VSblc0ZlhMYWR0dHg2SE1xOHBrSTBBcSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2RhdGFwZW1iYXlhcmFuIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9kYXRhcGVtYmF5YXJhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747087275),
('kX0VnDs4I94BxhmcmOE7yAJT7LCESYUjUEXjamEE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSG53ek1Ydzhobm5heEs5SnRzNjhxNDVudUM3RzlzVU9UTHhSS2J6MSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2RhdGFwZW1iYXlhcmFuIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9kYXRhcGVtYmF5YXJhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747087276),
('MDPB5HuS6AMiNM7yGWVJiQ7JElWTxPaclO155eyX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOWNlVmZGUW5rWUZ4RXJvbk5KSmlMempPOUhYM2VyTllVcG5PeVd6MCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2RhdGFwZW1iYXlhcmFuIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9kYXRhcGVtYmF5YXJhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1747087391);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jumlah_pintu`
--
ALTER TABLE `jumlah_pintu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayarans_pelanggan_id_foreign` (`pelanggan_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jumlah_pintu`
--
ALTER TABLE `jumlah_pintu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD CONSTRAINT `pembayarans_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
