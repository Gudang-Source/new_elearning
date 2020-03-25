-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 19 Jan 2020 pada 12.59
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.5.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_elearning`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_field_tambahan`
--

CREATE TABLE `el_field_tambahan` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_field_tambahan`
--

INSERT INTO `el_field_tambahan` (`id`, `nama`, `value`) VALUES
('check-urgent-info', 'Check Urgent Info', '{"info":"","last_check":"2020-01-19 18:54:50"}'),
('history-mengerjakan-3-2', 'History pengerjaan tugas', '{"mulai":"2019-12-20 13:33:38","selesai":"2019-12-20 14:03:38","uri_string":"tugas\\/kerjakan\\/2","valid_route":["\\/tugas\\/kerjakan","\\/tugas\\/finish","\\/tugas\\/submit_essay","\\/tugas\\/submit_upload"],"tugas":{"id":"2","mapel_id":"6","pengajar_id":"2","type_id":"3","judul":"SISTEM GERAK PADA MANUSIA","durasi":"30","info":"<p>KERJAKAN SOAL DENGAN BAIK DAN BENAR<\\/p>\\r\\n","aktif":"1","tgl_buat":"2019-12-20 13:30:29","tampil_siswa":"1"},"unix_id":"bfb0f813ef2c997245f7651a0cd45fba701601","ip":"::1","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","pertanyaan_id":["2"],"jawaban":{"2":"7"},"nilai":100,"jml_benar":1,"jml_salah":0,"tgl_submit":"2019-12-20 13:41:15","total_waktu":"7 menit 37 detik"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_kelas`
--

CREATE TABLE `el_kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=aktif 0=tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_kelas`
--

INSERT INTO `el_kelas` (`id`, `nama`, `parent_id`, `urutan`, `aktif`) VALUES
(1, 'KELAS X', NULL, 1, 1),
(2, 'KELAS X - A', 1, 2, 1),
(3, 'KELAS X - B', 1, 3, 1),
(4, 'KELAS X - C', 1, 4, 1),
(5, 'KELAS X - D', 1, 5, 1),
(6, 'KELAS XI', NULL, 6, 1),
(7, 'KELAS XI - Mia I', 6, 7, 1),
(8, 'KELAS XI - B', 6, 8, 1),
(9, 'KELAS XI - C', 6, 9, 1),
(10, 'KELAS XI - D', 6, 10, 1),
(11, 'KELAS XII', NULL, 11, 1),
(12, 'KELAS XII - A', 11, 12, 1),
(13, 'KELAS XII - B', 11, 13, 1),
(14, 'KELAS XII - C', 11, 14, 1),
(15, 'KELAS XII - D', 11, 15, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_kelas_siswa`
--

CREATE TABLE `el_kelas_siswa` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL COMMENT '0 jika bukan, 1 jika ya'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_kelas_siswa`
--

INSERT INTO `el_kelas_siswa` (`id`, `kelas_id`, `siswa_id`, `aktif`) VALUES
(1, 3, 1, 0),
(2, 2, 1, 1),
(3, 7, 2, 1),
(4, 7, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_komentar`
--

CREATE TABLE `el_komentar` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `tampil` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=tidak,1=tampil',
  `konten` text,
  `tgl_posting` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_login`
--

CREATE TABLE `el_login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL COMMENT '0=tidak,1=ya',
  `reset_kode` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_login`
--

INSERT INTO `el_login` (`id`, `username`, `password`, `siswa_id`, `pengajar_id`, `is_admin`, `reset_kode`) VALUES
(1, 'almadani279@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', NULL, 1, 1, '17de5f50653ae14b14fe8d73b5376daf'),
(2, 'murid@gmail.com', 'cb2e3758e31399f183c8e75eb0055ef9', 1, NULL, 0, NULL),
(3, 'guru1l@gmail.com', '92afb435ceb16630e9827f54330c59c9', NULL, 2, 0, NULL),
(4, 'murid2@gmail.com', '6d24580569bcdc2a7e5405616bf388b9', 2, NULL, 0, NULL),
(5, 'murid3@gmail.com', '95fad2832018df75ef8b9356edab728c', 3, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_login_log`
--

CREATE TABLE `el_login_log` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `lasttime` datetime NOT NULL,
  `agent` text NOT NULL,
  `last_activity` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_login_log`
--

INSERT INTO `el_login_log` (`id`, `login_id`, `lasttime`, `agent`, `last_activity`) VALUES
(1, 1, '2019-12-14 00:05:18', '{"is_mobile":0,"browser":"Chrome 70.0.3538.102","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362","ip":"::1"}', 1576256924),
(2, 2, '2019-12-14 00:24:52', '{"is_mobile":0,"browser":"Chrome 70.0.3538.102","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362","ip":"::1"}', 1576257844),
(3, 1, '2019-12-14 00:26:23', '{"is_mobile":0,"browser":"Chrome 70.0.3538.102","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362","ip":"::1"}', 1576257967),
(4, 3, '2019-12-14 00:28:23', '{"is_mobile":0,"browser":"Chrome 70.0.3538.102","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362","ip":"::1"}', 1576260424),
(5, 1, '2019-12-14 00:40:18', '{"is_mobile":0,"browser":"Chrome 78.0.3904.108","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36","ip":"::1"}', 1576259433),
(6, 1, '2019-12-14 00:53:02', '{"is_mobile":0,"browser":"Chrome 78.0.3904.108","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36","ip":"::1"}', 1576259641),
(7, 1, '2019-12-14 00:58:43', '{"is_mobile":0,"browser":"Chrome 78.0.3904.108","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36","ip":"::1"}', 1576260072),
(8, 1, '2019-12-14 01:05:59', '{"is_mobile":0,"browser":"Chrome 78.0.3904.108","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36","ip":"::1"}', 1576260409),
(9, 1, '2019-12-14 01:32:20', '{"is_mobile":0,"browser":"Chrome 70.0.3538.102","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362","ip":"::1"}', 1576261830),
(10, 2, '2019-12-14 01:32:50', '{"is_mobile":0,"browser":"Chrome 70.0.3538.102","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362","ip":"::1"}', 1576261880),
(11, 1, '2019-12-14 01:34:00', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576261954),
(12, 2, '2019-12-14 01:34:52', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576262031),
(13, 1, '2019-12-14 01:36:13', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576262248),
(14, 1, '2019-12-14 01:40:12', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576262408),
(15, 3, '2019-12-14 01:42:39', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576262709),
(16, 2, '2019-12-14 01:47:27', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576262792),
(17, 1, '2019-12-14 01:48:47', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576262868),
(18, 1, '2019-12-14 18:42:00', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576323947),
(19, 1, '2019-12-14 18:52:48', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576325407),
(20, 1, '2019-12-14 19:27:29', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576326435),
(21, 2, '2019-12-14 19:29:32', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576326543),
(22, 1, '2019-12-14 19:31:19', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576326603),
(23, 2, '2019-12-14 19:32:22', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576326828),
(24, 1, '2019-12-14 19:36:03', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576327415),
(25, 1, '2019-12-18 03:40:38', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576615488),
(26, 1, '2019-12-18 03:53:17', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576616158),
(27, 1, '2019-12-18 03:56:56', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576616218),
(28, 1, '2019-12-18 03:57:45', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576616267),
(29, 1, '2019-12-18 04:01:14', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576616617),
(30, 1, '2019-12-18 04:04:42', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576617133),
(31, 1, '2019-12-20 10:13:59', '{"is_mobile":0,"browser":"Chrome 79.0.3945.79","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36","ip":"::1"}', 1576812841),
(32, 1, '2019-12-20 11:49:12', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576820379),
(33, 1, '2019-12-20 12:42:23', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576820456),
(34, 1, '2019-12-20 13:10:57', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576823044),
(35, 5, '2019-12-20 13:26:20', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576823085),
(36, 1, '2019-12-20 13:27:03', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576823134),
(37, 1, '2019-12-20 13:28:29', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576823243),
(38, 3, '2019-12-20 13:29:43', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576823454),
(39, 5, '2019-12-20 13:33:28', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1576823972),
(40, 1, '2019-12-23 15:16:39', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1577088930),
(41, 5, '2019-12-23 15:17:47', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1577089249),
(42, 1, '2019-12-28 19:11:44', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1577535120),
(43, 1, '2020-01-01 21:52:00', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1577890379),
(44, 1, '2020-01-03 20:04:32', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1578056697),
(45, 1, '2020-01-04 01:54:09', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1578077878),
(46, 1, '2020-01-04 02:08:50', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1578078774),
(47, 1, '2020-01-06 10:49:53', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1578282656),
(48, 1, '2020-01-06 10:52:34', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1578282662),
(49, 1, '2020-01-06 10:53:34', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1578282720),
(50, 4, '2020-01-06 10:54:10', '{"is_mobile":0,"browser":"Chrome 79.0.3945.88","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36","ip":"::1"}', 1578283968),
(51, 1, '2020-01-19 18:54:48', '{"is_mobile":0,"browser":"Chrome 79.0.3945.130","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36","ip":"::1"}', 1579434841),
(52, 1, '2020-01-19 18:56:12', '{"is_mobile":0,"browser":"Chrome 79.0.3945.130","platform":"Unknown Windows OS","agent_string":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36","ip":"::1"}', 1579435070);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_mapel`
--

CREATE TABLE `el_mapel` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `info` text,
  `aktif` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = ya, 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_mapel`
--

INSERT INTO `el_mapel` (`id`, `nama`, `info`, `aktif`) VALUES
(1, 'Bahasa Indonesia', NULL, 1),
(2, 'Bahasa Inggris', NULL, 1),
(3, 'Matematika', NULL, 1),
(4, 'Ekonomi', NULL, 1),
(5, 'Geografi', NULL, 1),
(6, 'Biologi', NULL, 1),
(7, 'Penjas', NULL, 1),
(8, 'Agama', NULL, 1),
(9, 'Fisika', NULL, 1),
(10, 'Kimia', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_mapel_ajar`
--

CREATE TABLE `el_mapel_ajar` (
  `id` int(11) NOT NULL,
  `hari_id` tinyint(1) NOT NULL COMMENT '1=senin,2=selasa,3=rabu,4=kamis,5=jum''at,6=sabtu,7=minggu',
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `mapel_kelas_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = aktif 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_mapel_ajar`
--

INSERT INTO `el_mapel_ajar` (`id`, `hari_id`, `jam_mulai`, `jam_selesai`, `pengajar_id`, `mapel_kelas_id`, `aktif`) VALUES
(1, 1, '08:00:00', '10:30:00', 2, 11, 1),
(2, 3, '11:00:00', '13:00:00', 2, 11, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_mapel_kelas`
--

CREATE TABLE `el_mapel_kelas` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_mapel_kelas`
--

INSERT INTO `el_mapel_kelas` (`id`, `kelas_id`, `mapel_id`, `aktif`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1),
(4, 2, 4, 1),
(5, 2, 5, 1),
(6, 2, 6, 1),
(7, 2, 7, 1),
(8, 2, 8, 1),
(9, 2, 9, 1),
(10, 2, 10, 1),
(11, 7, 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_materi`
--

CREATE TABLE `el_materi` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text,
  `file` text,
  `tgl_posting` datetime NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_materi_kelas`
--

CREATE TABLE `el_materi_kelas` (
  `id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_messages`
--

CREATE TABLE `el_messages` (
  `id` int(11) NOT NULL,
  `type_id` tinyint(1) NOT NULL COMMENT '1=inbox,2=outbox',
  `content` text NOT NULL,
  `owner_id` int(11) NOT NULL,
  `sender_receiver_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=belum,1=sudah'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_messages`
--

INSERT INTO `el_messages` (`id`, `type_id`, `content`, `owner_id`, `sender_receiver_id`, `date`, `opened`) VALUES
(1, 2, '<p>saya sangat senang belajar e-learning</p>\r\n', 2, 1, '2019-12-14 19:30:49', 1),
(8, 1, '<p>cgcgcgcgcg</p>\r\n', 5, 1, '2020-01-04 02:11:39', 0),
(5, 2, '<p>ok bos&nbsp;</p>\r\n', 2, 1, '2019-12-14 19:32:37', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_nilai_tugas`
--

CREATE TABLE `el_nilai_tugas` (
  `id` int(11) NOT NULL,
  `nilai` float NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_nilai_tugas`
--

INSERT INTO `el_nilai_tugas` (`id`, `nilai`, `tugas_id`, `siswa_id`) VALUES
(2, 100, 2, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_pengajar`
--

CREATE TABLE `el_pengajar` (
  `id` int(11) NOT NULL,
  `nip` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `foto` text,
  `status_id` tinyint(1) NOT NULL COMMENT '0=pending, 1=aktif, 2=blok'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_pengajar`
--

INSERT INTO `el_pengajar` (`id`, `nip`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `alamat`, `foto`, `status_id`) VALUES
(1, '150212046', 'ALMADANI', 'Laki-laki', 'ACEH SELATAN', '1997-04-07', 'Pasi Kuala Bau, Kluet Utara, Kabupaten Aceh Selatan, Aceh 23771', NULL, 1),
(2, '150212045', 'Sanusi S.Pd', 'Laki-laki', 'ACEH SELATAN', '1997-03-04', 'Pasi Kuala Bau, Kluet Utara, Kabupaten Aceh Selatan, Aceh 23771', 'pengajar-muhammad-asrul1.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_pengaturan`
--

CREATE TABLE `el_pengaturan` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_pengaturan`
--

INSERT INTO `el_pengaturan` (`id`, `nama`, `value`) VALUES
('email-server', 'Email server', 'no-reply@domain.com'),
('email-template-approve-pengajar', 'Approve pengajar (email pengajar)', '{"subject":"Pengaktifan Akun","body":"<p>Hai {$nama},<\\/p>\\n<p>Anda telah diterima sebagai pengajar pada {$nama_sekolah}, berikut informasi data diri anda:<\\/p>\\n<p>{$tabel_profil}<\\/p>\\n<p>Anda dapat login ke sistem E-Learning menggunakan username dan password yang telah anda buat saat pendaftaran, login pada url berikut : {$url_login}<\\/p>"}'),
('email-template-approve-siswa', 'Approve siswa (email siswa)', '{"subject":"Pengaktifan Akun","body":"<p>Hai {$nama},<\\/p>\\n<p>Anda telah diterima sebagai siswa pada {$nama_sekolah}, berikut informasi data diri anda:<\\/p>\\n<p>{$tabel_profil}<\\/p>\\n<p>Anda dapat login ke sistem E-Learning menggunakan username dan password yang telah anda buat saat pendaftaran, login pada url berikut : {$url_login}<\\/p>"}'),
('email-template-link-reset', 'Link Reset Password', '{"subject":"Reset Password","body":"<p>Hai,<\\/p>\\n<p>Anda mengirimkan permintaan untuk reset password anda, klik link berikut untuk memulai reset password : {$link_reset}<\\/p>"}'),
('email-template-register-pengajar', 'Register pengajar (email pengajar)', '{"subject":"Registrasi Berhasil","body":"<p>Hai {$nama},<\\/p>\\n<p>Terimakasih telah melakukan pendaftaran sebagai pengajar di E-Learning {$nama_sekolah}. Akun anda akan segera diaktifkan oleh admin.<\\/p>"}'),
('email-template-register-siswa', 'Register siswa (email siswa)', '{"subject":"Registrasi Berhasil","body":"<p>Hai {$nama},<\\/p>\\n<p>Terimakasih telah melakukan pendaftaran sebagai siswa di E-Learning {$nama_sekolah}. Akun anda akan segera diaktifkan oleh admin.<\\/p>"}'),
('info-registrasi', 'Info Registrasi', '<p>Silakan mendaftar sebagai siswa atau pengajar (jika anda sebagai pengajar) dengan memilih sesuai tab berikut :</p>'),
('peraturan-elearning', 'Peraturan E-learning', ''),
('registrasi-pengajar', 'Registrasi Pengajar', '1'),
('registrasi-siswa', 'Registrasi Siswa', '1'),
('versi', 'Versi', '2.0'),
('jenjang', 'jenjang', 'SMA'),
('nama-sekolah', 'nama-sekolah', 'SMAN 2 KLUET UTARA'),
('alamat', 'alamat', 'Pasi Kuala Bau, Kluet Utara, Kabupaten Aceh Selatan, Aceh 23771'),
('telp', 'telp', '081263423585'),
('install-success', 'install-success', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_pengumuman`
--

CREATE TABLE `el_pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `tgl_tampil` date NOT NULL,
  `tgl_tutup` date NOT NULL,
  `tampil_siswa` tinyint(1) NOT NULL DEFAULT '1',
  `tampil_pengajar` tinyint(1) NOT NULL DEFAULT '1',
  `pengajar_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_pilihan`
--

CREATE TABLE `el_pilihan` (
  `id` int(11) NOT NULL,
  `pertanyaan_id` int(11) NOT NULL,
  `konten` text NOT NULL,
  `kunci` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=tidak',
  `urutan` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_pilihan`
--

INSERT INTO `el_pilihan` (`id`, `pertanyaan_id`, `konten`, `kunci`, `urutan`, `aktif`) VALUES
(1, 1, '<p>otot</p>\r\n', 1, 1, 1),
(2, 1, '<p>rangka</p>\r\n', 0, 2, 1),
(3, 1, '<p>saraf</p>\r\n', 0, 3, 1),
(4, 1, '<p>pencernaan</p>\r\n', 0, 4, 1),
(5, 1, '<p>anjai</p>\r\n', 0, 5, 0),
(6, 2, '<p>rangka</p>\r\n', 0, 4, 1),
(7, 2, '<p>otot</p>\r\n', 1, 1, 1),
(8, 2, '<p>saraf</p>\r\n', 0, 2, 1),
(9, 2, '<p>pencernaan</p>\r\n', 0, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_siswa`
--

CREATE TABLE `el_siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL COMMENT 'Laki-laki dan Perempuan',
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `agama` char(7) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `tahun_masuk` year(4) NOT NULL,
  `foto` text,
  `status_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending, 1=aktif, 2=blok, 3=alumni, 4=deleted'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_siswa`
--

INSERT INTO `el_siswa` (`id`, `nis`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `agama`, `alamat`, `tahun_masuk`, `foto`, `status_id`) VALUES
(1, '1151', 'Afriadi', 'Laki-laki', 'ACEH SELATAN', '2005-04-21', 'ISLAM', 'Pasi Kuala Bau, Kluet Utara, Kabupaten Aceh Selatan, Aceh 23771', 2018, 'siswa-afriadi-1151.jpg', 1),
(2, '1157', 'SAIYIDA NATISA', 'Perempuan', 'aceh selatan', '2002-03-07', 'ISLAM', 'aceh selatan', 2018, NULL, 1),
(3, '1152', 'FITRIA SUKMA', 'Perempuan', 'aceh selatan', '2002-10-07', 'ISLAM', 'aceh selatan', 2018, 'siswa-fitria-sukma-11521.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_tugas`
--

CREATE TABLE `el_tugas` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `type_id` tinyint(1) NOT NULL COMMENT '1=upload,2=essay,3=ganda',
  `judul` varchar(255) NOT NULL,
  `durasi` int(11) DEFAULT NULL COMMENT 'lama pengerjaan dalam menit',
  `info` text,
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `tgl_buat` datetime DEFAULT NULL,
  `tampil_siswa` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=tidak tampil di siswa, 1=tampil siswa'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_tugas`
--

INSERT INTO `el_tugas` (`id`, `mapel_id`, `pengajar_id`, `type_id`, `judul`, `durasi`, `info`, `aktif`, `tgl_buat`, `tampil_siswa`) VALUES
(1, 6, 2, 3, 'SISTEM GERAK PADA MANUSIA', 30, '<p>kerjakan soal ini dengan baik dan benar&nbsp;</p>\r\n', 0, '2019-12-14 01:43:45', 1),
(2, 6, 2, 3, 'SISTEM GERAK PADA MANUSIA', 30, '<p>KERJAKAN SOAL DENGAN BAIK DAN BENAR</p>\r\n', 0, '2019-12-20 13:30:29', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_tugas_kelas`
--

CREATE TABLE `el_tugas_kelas` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_tugas_kelas`
--

INSERT INTO `el_tugas_kelas` (`id`, `tugas_id`, `kelas_id`) VALUES
(1, 1, 2),
(2, 2, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `el_tugas_pertanyaan`
--

CREATE TABLE `el_tugas_pertanyaan` (
  `id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `urutan` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `el_tugas_pertanyaan`
--

INSERT INTO `el_tugas_pertanyaan` (`id`, `pertanyaan`, `urutan`, `tugas_id`, `aktif`) VALUES
(1, '<p>sistem tubuh yang berfungsi sebagai penyangga, pemberi bentuk tubuh, dan alat gerak pasif adalah &hellip;</p>\r\n', 1, 1, 1),
(2, '<p>sistem tubuh yang berfungsi sebagai penyangga, pemberi bentuk tubuh, dan alat gerak pasif adalah &hellip;</p>\r\n', 1, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `el_field_tambahan`
--
ALTER TABLE `el_field_tambahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_kelas`
--
ALTER TABLE `el_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `parent_id_2` (`parent_id`);

--
-- Indexes for table `el_kelas_siswa`
--
ALTER TABLE `el_kelas_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`,`siswa_id`),
  ADD KEY `kelas_id_2` (`kelas_id`,`siswa_id`);

--
-- Indexes for table `el_komentar`
--
ALTER TABLE `el_komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_id` (`login_id`,`materi_id`),
  ADD KEY `login_id_2` (`login_id`,`materi_id`),
  ADD KEY `login_id_3` (`login_id`,`materi_id`);

--
-- Indexes for table `el_login`
--
ALTER TABLE `el_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`siswa_id`,`pengajar_id`),
  ADD KEY `username_2` (`username`,`siswa_id`,`pengajar_id`);

--
-- Indexes for table `el_login_log`
--
ALTER TABLE `el_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_id` (`login_id`),
  ADD KEY `login_id_2` (`login_id`),
  ADD KEY `login_id_3` (`login_id`);

--
-- Indexes for table `el_mapel`
--
ALTER TABLE `el_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_mapel_ajar`
--
ALTER TABLE `el_mapel_ajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hari_id` (`hari_id`,`pengajar_id`,`mapel_kelas_id`),
  ADD KEY `hari_id_2` (`hari_id`,`pengajar_id`,`mapel_kelas_id`);

--
-- Indexes for table `el_mapel_kelas`
--
ALTER TABLE `el_mapel_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`,`mapel_id`),
  ADD KEY `kelas_id_2` (`kelas_id`,`mapel_id`);

--
-- Indexes for table `el_materi`
--
ALTER TABLE `el_materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mapel_id` (`mapel_id`,`pengajar_id`,`siswa_id`),
  ADD KEY `mapel_id_2` (`mapel_id`,`pengajar_id`,`siswa_id`);

--
-- Indexes for table `el_materi_kelas`
--
ALTER TABLE `el_materi_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materi_id` (`materi_id`,`kelas_id`),
  ADD KEY `materi_id_2` (`materi_id`,`kelas_id`);

--
-- Indexes for table `el_messages`
--
ALTER TABLE `el_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`,`owner_id`,`sender_receiver_id`),
  ADD KEY `type_id_2` (`type_id`,`owner_id`,`sender_receiver_id`);

--
-- Indexes for table `el_nilai_tugas`
--
ALTER TABLE `el_nilai_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tugas_id` (`tugas_id`,`siswa_id`),
  ADD KEY `tugas_id_2` (`tugas_id`,`siswa_id`);

--
-- Indexes for table `el_pengajar`
--
ALTER TABLE `el_pengajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`),
  ADD KEY `nip_2` (`nip`);

--
-- Indexes for table `el_pengaturan`
--
ALTER TABLE `el_pengaturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_pengumuman`
--
ALTER TABLE `el_pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajar_id` (`pengajar_id`),
  ADD KEY `pengajar_id_2` (`pengajar_id`),
  ADD KEY `pengajar_id_3` (`pengajar_id`);

--
-- Indexes for table `el_pilihan`
--
ALTER TABLE `el_pilihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pertanyaan_id` (`pertanyaan_id`),
  ADD KEY `pertanyaan_id_2` (`pertanyaan_id`,`kunci`);

--
-- Indexes for table `el_siswa`
--
ALTER TABLE `el_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nis` (`nis`,`nama`,`status_id`),
  ADD KEY `nis_2` (`nis`,`nama`,`status_id`);

--
-- Indexes for table `el_tugas`
--
ALTER TABLE `el_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mapel_id` (`mapel_id`,`pengajar_id`,`type_id`),
  ADD KEY `mapel_id_2` (`mapel_id`,`pengajar_id`,`type_id`);

--
-- Indexes for table `el_tugas_kelas`
--
ALTER TABLE `el_tugas_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tugas_id` (`tugas_id`,`kelas_id`),
  ADD KEY `tugas_id_2` (`tugas_id`,`kelas_id`);

--
-- Indexes for table `el_tugas_pertanyaan`
--
ALTER TABLE `el_tugas_pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tugas_id` (`tugas_id`),
  ADD KEY `tugas_id_2` (`tugas_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `el_kelas`
--
ALTER TABLE `el_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `el_kelas_siswa`
--
ALTER TABLE `el_kelas_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `el_komentar`
--
ALTER TABLE `el_komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `el_login`
--
ALTER TABLE `el_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `el_login_log`
--
ALTER TABLE `el_login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `el_mapel`
--
ALTER TABLE `el_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `el_mapel_ajar`
--
ALTER TABLE `el_mapel_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_mapel_kelas`
--
ALTER TABLE `el_mapel_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `el_materi`
--
ALTER TABLE `el_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `el_materi_kelas`
--
ALTER TABLE `el_materi_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `el_messages`
--
ALTER TABLE `el_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `el_nilai_tugas`
--
ALTER TABLE `el_nilai_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_pengajar`
--
ALTER TABLE `el_pengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_pengumuman`
--
ALTER TABLE `el_pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `el_pilihan`
--
ALTER TABLE `el_pilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `el_siswa`
--
ALTER TABLE `el_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `el_tugas`
--
ALTER TABLE `el_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_tugas_kelas`
--
ALTER TABLE `el_tugas_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `el_tugas_pertanyaan`
--
ALTER TABLE `el_tugas_pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
