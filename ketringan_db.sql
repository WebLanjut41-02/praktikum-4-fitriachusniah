-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2019 pada 03.58
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ketringan_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_akun`
--

CREATE TABLE `tb_akun` (
  `Id_Akun` varchar(20) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Role` enum('Admin','Bg_Keuangan','CS','Vendor') NOT NULL,
  `Aktifitas_Akun` enum('online','offline','','') NOT NULL DEFAULT 'offline',
  `Status_Akun` enum('aktif','nonaktif') NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Delete_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_akun`
--

INSERT INTO `tb_akun` (`Id_Akun`, `Username`, `Password`, `Role`, `Aktifitas_Akun`, `Status_Akun`, `Created_at`, `Update_at`, `Delete_at`) VALUES
('AKN-1', 'NiaAdmin', '8728075abafefc9ed2c8e5e610c64917', 'Admin', 'offline', 'aktif', '2019-02-26 05:46:22', '2019-02-26 17:54:29', '0000-00-00 00:00:00'),
('AKN-2', 'RmBarokahJaya', '5aa04265e451ee708dd82432ba066dd8', 'Vendor', 'offline', 'aktif', '2019-03-03 17:24:19', '2019-03-07 14:30:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bank`
--

CREATE TABLE `tb_bank` (
  `Id_Bank` varchar(20) NOT NULL,
  `Nama_Bank` varchar(50) NOT NULL,
  `No_Rekening` varchar(100) NOT NULL,
  `Deskripsi` varchar(100) NOT NULL,
  `Logo_Bank` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_bank`
--

INSERT INTO `tb_bank` (`Id_Bank`, `Nama_Bank`, `No_Rekening`, `Deskripsi`, `Logo_Bank`) VALUES
('BNK-1', 'BRI', '1111 2222 3333', 'Rizsa El Akbar', 'bri.jpg'),
('BNK-2', 'BNI', '1111 2222 3333', 'Rizsa El Akbar', 'bank_bni.png'),
('BNK-3', 'Mandiri', '1111 2222 3333', 'Rizsa El Akbar', 'bank_mandiri.png'),
('BNK-4', 'BCA', '1111 2222 3333', 'Rizsa El Akbar', 'bank_bca.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_banner`
--

CREATE TABLE `tb_banner` (
  `Id_Banner` varchar(20) NOT NULL,
  `Nama_Banner` varchar(100) NOT NULL,
  `Banner` text NOT NULL,
  `Status` enum('Enable','Disable') NOT NULL DEFAULT 'Disable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_denda`
--

CREATE TABLE `tb_denda` (
  `Id_Denda` varchar(20) NOT NULL,
  `Id_Pembayaran` varchar(20) NOT NULL,
  `Jumlah_Denda` int(11) NOT NULL,
  `Keterangan` varchar(50) DEFAULT NULL,
  `Tgl_Denda` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_deposit`
--

CREATE TABLE `tb_deposit` (
  `Id_Deposit` varchar(20) NOT NULL,
  `Id_Vendor` varchar(20) NOT NULL,
  `Nominal_Deposit` int(100) NOT NULL DEFAULT '0',
  `Status_Deposit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_deposit`
--

INSERT INTO `tb_deposit` (`Id_Deposit`, `Id_Vendor`, `Nominal_Deposit`, `Status_Deposit`) VALUES
('DPS-1', 'VEN-1', 1250000, 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_diskon`
--

CREATE TABLE `tb_diskon` (
  `Id_Diskon` varchar(20) NOT NULL,
  `Kode_Diskon` varchar(50) NOT NULL,
  `Nominal` int(11) NOT NULL,
  `Keterangan_Diskon` varchar(200) NOT NULL,
  `Status_Diskon` enum('enable','disable') NOT NULL DEFAULT 'disable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_diskon`
--

INSERT INTO `tb_diskon` (`Id_Diskon`, `Kode_Diskon`, `Nominal`, `Keterangan_Diskon`, `Status_Diskon`) VALUES
('DSK-1', 'OPENINGDISKON', 10000, '', 'disable');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dompet`
--

CREATE TABLE `tb_dompet` (
  `Id_Dompet` varchar(20) NOT NULL,
  `Id_Konsumen` varchar(20) NOT NULL,
  `Nominal_Dompet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_dompet`
--

INSERT INTO `tb_dompet` (`Id_Dompet`, `Id_Konsumen`, `Nominal_Dompet`) VALUES
('DPT-1', 'KSM-3', 450000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_feedback`
--

CREATE TABLE `tb_feedback` (
  `Id_Feedback` varchar(20) NOT NULL,
  `Id_Konsumen` varchar(20) NOT NULL,
  `Id_Menu_Paket` varchar(20) NOT NULL,
  `Komentar` varchar(100) NOT NULL,
  `Rating` decimal(2,2) NOT NULL,
  `Tanggal_Feedback` timestamp NULL DEFAULT NULL,
  `Status_Feedback` enum('show','hidden','','') NOT NULL DEFAULT 'show'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kecamatan`
--

CREATE TABLE `tb_kecamatan` (
  `Id_Kecamatan` varchar(11) NOT NULL,
  `Kecamatan` varchar(40) NOT NULL,
  `Id_Kota` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_keranjang`
--

CREATE TABLE `tb_keranjang` (
  `Id_Konsumen` varchar(20) NOT NULL,
  `Id_Menu_Paket` varchar(20) NOT NULL,
  `Jumlah` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_keranjang`
--

INSERT INTO `tb_keranjang` (`Id_Konsumen`, `Id_Menu_Paket`, `Jumlah`) VALUES
('KSM-1', '1', 4),
('KSM-1', '2', 3),
('KSM-1', '1', 3),
('KSM-1', '2', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_komplain`
--

CREATE TABLE `tb_komplain` (
  `Id_Komplain` varchar(20) NOT NULL,
  `Id_Konsumen` varchar(20) NOT NULL,
  `isi_komplain` text NOT NULL,
  `tanggal_komplain` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konsumen`
--

CREATE TABLE `tb_konsumen` (
  `Id_Konsumen` varchar(20) NOT NULL,
  `Nama_Konsumen` varchar(50) NOT NULL,
  `Role` enum('perseorangan','organisasi') NOT NULL,
  `No_Telfon_Konsumen` varchar(20) NOT NULL,
  `Email_Konsumen` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `Alamat_Konsumen` varchar(50) NOT NULL,
  `Foto_Profil_Konsumen` varchar(50) DEFAULT NULL,
  `Membership` enum('VIP','Reguler','','') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_konsumen`
--

INSERT INTO `tb_konsumen` (`Id_Konsumen`, `Nama_Konsumen`, `Role`, `No_Telfon_Konsumen`, `Email_Konsumen`, `Password`, `Alamat_Konsumen`, `Foto_Profil_Konsumen`, `Membership`, `created_at`, `updated_at`, `deleted_at`) VALUES
('KSM-1', 'Bagus Adiyaksa', 'perseorangan', '081338320960', 'bagus@gmail.com', '698d51a19d8a121ce581499d7b701668', 'Asrama Putra Gedung 5 Telkom Univeristy', '', 'VIP', '2019-02-12 14:47:17', '2019-03-03 18:01:48', NULL),
('KSM-2', 'Fitria Riadatul', 'perseorangan', '087678567345', 'fitriachusniah@gmail.com', '698d51a19d8a121ce581499d7b701668', 'Asrama Putra Gedung 8 Telkom University', '', 'Reguler', '2019-02-22 17:18:24', '2019-03-08 01:27:17', NULL),
('KSM-3', 'HMSI Telkom Univeristy', 'organisasi', '089765456837', 'HMSItelu@gmail.com', '8728075abafefc9ed2c8e5e610c64917', 'Fakultas Ilmu terapan Telkom University', '', 'VIP', '2019-02-26 07:09:20', '2019-03-03 18:03:23', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konten_statis`
--

CREATE TABLE `tb_konten_statis` (
  `Id_Konten_Statis` varchar(20) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Konten` text NOT NULL,
  `Status` enum('enable','disable','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_konten_statis`
--

INSERT INTO `tb_konten_statis` (`Id_Konten_Statis`, `Judul`, `Konten`, `Status`) VALUES
('KST-1', 'Tentang', 'Ketringan adalah aplikasi yang', 'enable');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kota`
--

CREATE TABLE `tb_kota` (
  `Id_Kota` varchar(11) NOT NULL,
  `Kota` varchar(40) NOT NULL,
  `Id_Provinsi` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kurir`
--

CREATE TABLE `tb_kurir` (
  `Id_Kurir` varchar(20) NOT NULL,
  `Nama_Kurir` varchar(50) NOT NULL,
  `No_Telfon_Kurir` varchar(12) NOT NULL,
  `Status_Akun` enum('aktif','nonaktif') NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Delete_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_menu_paket`
--

CREATE TABLE `tb_menu_paket` (
  `Id_Menu_Paket` varchar(20) NOT NULL,
  `Nama_Paket` varchar(50) NOT NULL,
  `Gambar_Paket` text,
  `Harga_Paket` int(11) NOT NULL,
  `Deskripsi_Paket` varchar(100) NOT NULL,
  `Kategori_Paket` enum('event','harian') NOT NULL,
  `Jenis_Paket` enum('nasi','kue') NOT NULL,
  `Kategori_Menu_Paket` enum('ayam dan bebek','aneka nasi','bakso, soto dan soup','mie','snack dan roti') NOT NULL,
  `Id_Vendor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_menu_paket`
--

INSERT INTO `tb_menu_paket` (`Id_Menu_Paket`, `Nama_Paket`, `Gambar_Paket`, `Harga_Paket`, `Deskripsi_Paket`, `Kategori_Paket`, `Jenis_Paket`, `Kategori_Menu_Paket`, `Id_Vendor`) VALUES
('MEN-1', 'Nasi Rendang ala RM Barokah Jaya', '', 17000, 'Nasi disajikan dengan daging Rendang khas Padang yang lezat', 'event', 'nasi', 'aneka nasi', 'VEN-1'),
('MEN-2', 'Nasi Ayam ala RM Barokah Jaya', '', 13000, 'Nasi disajikan dengan daging ayam khas Padang yang lezat', 'event', 'nasi', 'ayam dan bebek', 'VEN-1'),
('MEN-3', 'Nasi Ikan ala RM Barokah Jaya', '', 12000, 'Nasi disajikan dengan daging ikan khas Padang yang lezat', 'event', 'nasi', 'aneka nasi', 'VEN-1'),
('MEN-4', 'Nasi Ikan Lele ala RM Barokah Jaya', '', 11000, 'Nasi disajikan dengan daging ikan lele khas Padang yang lezat', 'event', 'nasi', 'aneka nasi', 'VEN-1'),
('MEN-5', 'Nasi Paru ala RM Berkah Jaya', '', 13000, 'Nasi disajikan dengan paru sapi khas Padang yang lezat', 'event', 'nasi', 'aneka nasi', 'VEN-1'),
('MEN-6', 'Nasi Kikil ala RM Barokah Jaya', '', 12000, 'Nasi disajikan dengan kikil sapi khas Padang yang lezat', 'event', 'nasi', 'aneka nasi', 'VEN-1'),
('MEN-7', 'Nasi Usus ala RM Berkah Jaya', '', 12000, 'Nasi disajikan dengan usus ayam khas Padang yang lezat', 'event', 'nasi', 'aneka nasi', 'VEN-1'),
('MEN-8', 'Nasi Ikan Bakar ala RM Barokah Jaya', '', 12000, 'Nasi disajikan dengan ikan bakar yang lezat', 'event', 'nasi', 'aneka nasi', 'VEN-1'),
('MEN-9', 'Nasi Uduk', '', 12000, 'Nasi Campur sayur', 'event', 'nasi', 'aneka nasi', 'VEN-1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket_dipesan`
--

CREATE TABLE `tb_paket_dipesan` (
  `Id_Pesanan` varchar(20) NOT NULL,
  `Id_Menu_Paket` varchar(20) NOT NULL,
  `Jumlah_Kotak` int(11) NOT NULL,
  `Catatan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_paket_dipesan`
--

INSERT INTO `tb_paket_dipesan` (`Id_Pesanan`, `Id_Menu_Paket`, `Jumlah_Kotak`, `Catatan`) VALUES
('PSNE1903011', 'MEN-1', 100, NULL),
('PSNE1903013', 'MEN-7', 80, NULL),
('PSNE1903014', 'MEN-3', 45, NULL),
('PSNE1903015', 'MEN-6', 200, NULL),
('PSNE1903012', 'MEN-5', 60, NULL),
('PSNE1903012', 'MEN-4', 40, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `Id_Pembayaran` varchar(20) NOT NULL,
  `Id_Pesanan` varchar(20) DEFAULT NULL,
  `Metode_Pembayaran` enum('cash','cicil') NOT NULL,
  `Tagihan` int(11) NOT NULL,
  `Total_Telah_Dibayar` int(11) NOT NULL,
  `Denda` int(11) DEFAULT '0',
  `Total_Tagihan` int(11) NOT NULL,
  `Sisa_Tagihan` int(11) NOT NULL,
  `Keterangan_Pembayaran` enum('lunas','belum_lunas','belum_dikembalikan','dikembalikan') NOT NULL DEFAULT 'belum_lunas'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`Id_Pembayaran`, `Id_Pesanan`, `Metode_Pembayaran`, `Tagihan`, `Total_Telah_Dibayar`, `Denda`, `Total_Tagihan`, `Sisa_Tagihan`, `Keterangan_Pembayaran`) VALUES
('PMB-1', 'PSNE1903011', 'cash', 1700000, 1700000, 0, 1700000, 0, 'belum_dikembalikan'),
('PMB-2', 'PSNE1903012', 'cash', 1220000, 1220000, 0, 1220000, 0, 'dikembalikan'),
('PMB-3', 'PSNE1903013', 'cash', 960000, 960000, 0, 960000, 0, 'lunas'),
('PMB-4', 'PSNE1903014', 'cash', 540000, 540000, 0, 540000, 0, 'lunas'),
('PMB-5', 'PSNE1903015', 'cash', 2400000, 2400000, 0, 2400000, 0, 'lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penambahan_deposit`
--

CREATE TABLE `tb_penambahan_deposit` (
  `Id_Penambahan_Deposit` varchar(20) NOT NULL,
  `Id_Deposit` varchar(20) NOT NULL,
  `Nominal_Penambahan` int(50) NOT NULL,
  `Tanggal_Penambahan` date NOT NULL,
  `Waktu_Penambahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penarikan_deposit`
--

CREATE TABLE `tb_penarikan_deposit` (
  `Id_Penarikan_Deposit` varchar(20) NOT NULL,
  `Id_Deposit` varchar(20) NOT NULL,
  `Nominal_Penarikan` int(200) NOT NULL,
  `Tanggal_Penarikan` date NOT NULL,
  `Waktu_Penarikan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_penarikan_deposit`
--

INSERT INTO `tb_penarikan_deposit` (`Id_Penarikan_Deposit`, `Id_Deposit`, `Nominal_Penarikan`, `Tanggal_Penarikan`, `Waktu_Penarikan`) VALUES
('TRD-1', 'DPS-1', 250000, '2019-02-26', '2019-02-26 17:05:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan_event`
--

CREATE TABLE `tb_pesanan_event` (
  `Id_Pesanan` varchar(20) NOT NULL,
  `Id_Konsumen` varchar(20) NOT NULL,
  `Alamat_Pengiriman` text NOT NULL,
  `No_Telfon_Aktif` varchar(20) NOT NULL,
  `No_Telfon_Alternatif` varchar(20) DEFAULT NULL,
  `Total_Harga` int(20) NOT NULL,
  `Tanggal_Pesan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Tanggal_Kegiatan` date NOT NULL,
  `Waktu_Kegiatan` text NOT NULL,
  `Waktu_Diterima` timestamp NULL DEFAULT NULL,
  `Status_Pesanan` enum('menunggu_verifikasi_cicilan','belum_dibayar','menunggu_verifikasi','diproses','belum_dikirim','dikirim','selesai','dibatalkan') NOT NULL DEFAULT 'belum_dibayar',
  `Id_Kurir` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pesanan_event`
--

INSERT INTO `tb_pesanan_event` (`Id_Pesanan`, `Id_Konsumen`, `Alamat_Pengiriman`, `No_Telfon_Aktif`, `No_Telfon_Alternatif`, `Total_Harga`, `Tanggal_Pesan`, `Tanggal_Kegiatan`, `Waktu_Kegiatan`, `Waktu_Diterima`, `Status_Pesanan`, `Id_Kurir`) VALUES
('PSNE1903011', 'KSM-3', 'Jl. Sukabirus No. 40', '082240660389', '081331973596', 1200000, '2019-03-01 00:51:19', '2019-03-20', '08:00', '0000-00-00 00:00:00', 'dibatalkan', NULL),
('PSNE1903012', 'KSM-2', 'Jl. Sukapura No. 40', '082240660389', '081331973596', 1000000, '2019-03-01 00:51:19', '2019-03-09', '08:00', '0000-00-00 00:00:00', 'dibatalkan', NULL),
('PSNE1903013', 'KSM-1', 'Jl. GBA No. 40', '082240660389', '081331973596', 900000, '2019-03-01 00:51:19', '2019-03-17', '08:00', '0000-00-00 00:00:00', 'selesai', NULL),
('PSNE1903014', 'KSM-2', 'Pesona Bali Blok G-8', '089876543123', '089876543123', 3900000, '2019-03-01 01:21:27', '2019-03-12', '09:00', '0000-00-00 00:00:00', 'diproses', NULL),
('PSNE1903015', 'KSM-3', 'GBA Blok C', '089876543123', '089876543123', 1200000, '2019-03-01 01:21:27', '2019-03-29', '09:00', '2019-03-08 02:50:29', 'selesai', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `Id_Petugas` varchar(20) NOT NULL,
  `Nama_Petugas` varchar(50) NOT NULL,
  `No_Telfon` varchar(20) NOT NULL,
  `Divisi` varchar(20) NOT NULL,
  `Id_Akun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_provinsi`
--

CREATE TABLE `tb_provinsi` (
  `Id_Provinsi` varchar(11) NOT NULL,
  `Provinsi` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_testimoni`
--

CREATE TABLE `tb_testimoni` (
  `Id_Testimoni` varchar(20) NOT NULL,
  `Nama_Pemtestimoni` varchar(50) NOT NULL,
  `Jabatan` text NOT NULL,
  `Foto_Pemtestimoni` text NOT NULL,
  `Isi_Testimoni` text NOT NULL,
  `Tgl_Testimoni` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status_Testimoni` enum('enable','disable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_testimoni`
--

INSERT INTO `tb_testimoni` (`Id_Testimoni`, `Nama_Pemtestimoni`, `Jabatan`, `Foto_Pemtestimoni`, `Isi_Testimoni`, `Tgl_Testimoni`, `Status_Testimoni`) VALUES
('TTM-1', 'Dafa', 'Mahasiswa Telkom Univeristy', 'user1.png', 'Kalian harus nyobain Ketringan pokoknya!', '2019-03-03 16:06:59', 'enable');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transfer`
--

CREATE TABLE `tb_transfer` (
  `Id_Transfer` varchar(20) NOT NULL,
  `Id_Pembayaran` varchar(20) NOT NULL,
  `Nama_Pemegang_Rekening` varchar(50) NOT NULL,
  `Nama_Bank_Pengirim` varchar(20) NOT NULL,
  `Status_Verifikasi` enum('sudah','belum') NOT NULL DEFAULT 'belum',
  `Jumlah_Transfer` int(11) NOT NULL,
  `Keterangan` text,
  `Tgl_Transfer` timestamp NULL DEFAULT NULL,
  `Tgl_Batas_Transfer` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Tgl_Dikonfirmasi` timestamp NULL DEFAULT NULL,
  `Bukti_Transfer` text,
  `Id_Bank` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_transfer`
--

INSERT INTO `tb_transfer` (`Id_Transfer`, `Id_Pembayaran`, `Nama_Pemegang_Rekening`, `Nama_Bank_Pengirim`, `Status_Verifikasi`, `Jumlah_Transfer`, `Keterangan`, `Tgl_Transfer`, `Tgl_Batas_Transfer`, `Tgl_Dikonfirmasi`, `Bukti_Transfer`, `Id_Bank`) VALUES
('TRF-1', 'PMB-1', 'Bagus Adiyaksa', 'Mandiri', 'sudah', 1700000, NULL, '2019-02-28 03:00:00', '0000-00-00 00:00:00', '2019-03-07 16:57:03', 'bukti_trf.jpg', 'BNK-1'),
('TRF-2', 'PMB-2', 'Aji Saputra', 'BCA', 'sudah', 1220000, NULL, '2019-02-28 03:00:00', '0000-00-00 00:00:00', '2019-03-07 14:40:16', 'bukti_trf.jpg', 'BNK-1'),
('TRF-3', 'PMB-3', 'Aji Handoyo', 'BRI', 'sudah', 960000, NULL, '2019-02-28 03:00:00', '0000-00-00 00:00:00', '2019-03-01 08:10:00', 'bukti_trf.jpg', 'BNK-1'),
('TRF-4', 'PMB-4', 'Dwi Sartika', 'BCA', 'sudah', 540000, NULL, '2019-03-01 10:00:00', '0000-00-00 00:00:00', '2019-03-08 01:28:16', 'bukti_trf.jpg', 'BNK-4'),
('TRF-5', 'PMB-5', 'Avivah Maharani', 'BCA', 'sudah', 2400000, NULL, '2019-03-01 10:00:00', '0000-00-00 00:00:00', '2019-03-02 10:00:00', 'bukti_trf.jpg', 'BNK-4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_vendor`
--

CREATE TABLE `tb_vendor` (
  `Id_Vendor` varchar(20) NOT NULL,
  `Nama_Vendor` varchar(50) NOT NULL,
  `Kategori_Vendor` enum('Restaurant','Rumah Makan','Rumahan','') NOT NULL,
  `No_Telfon_Vendor` varchar(20) NOT NULL,
  `No_Telfon_Alternatif_Vendor` varchar(15) NOT NULL,
  `Email_Vendor` varchar(50) NOT NULL,
  `Alamat_Vendor` text NOT NULL,
  `Deskripsi_Vendor` text NOT NULL,
  `Foto_Profil_Vendor` text NOT NULL,
  `Nama_Pemilik` varchar(50) NOT NULL,
  `No_KTP` varchar(20) NOT NULL,
  `Kuota_Pemesanan` int(11) NOT NULL,
  `Minimal_Pemesanan` int(11) NOT NULL,
  `Status_Vendor` enum('aktif','nonaktif') NOT NULL,
  `Id_Akun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_vendor`
--

INSERT INTO `tb_vendor` (`Id_Vendor`, `Nama_Vendor`, `Kategori_Vendor`, `No_Telfon_Vendor`, `No_Telfon_Alternatif_Vendor`, `Email_Vendor`, `Alamat_Vendor`, `Deskripsi_Vendor`, `Foto_Profil_Vendor`, `Nama_Pemilik`, `No_KTP`, `Kuota_Pemesanan`, `Minimal_Pemesanan`, `Status_Vendor`, `Id_Akun`) VALUES
('VEN-1', 'RM Barokah Jaya Masakan Padang', 'Rumah Makan', '0822345678909', '081328211390', 'rmbarokahjaya89@gmail.com', 'Sukapura', 'Rumah makan yang menyediakan masakan khas Padang dengan menu yang lengkap', '', 'Julianto', '1812061707890004', 1000, 10, 'aktif', 'AKN-2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_akun`
--
ALTER TABLE `tb_akun`
  ADD PRIMARY KEY (`Id_Akun`);

--
-- Indeks untuk tabel `tb_bank`
--
ALTER TABLE `tb_bank`
  ADD PRIMARY KEY (`Id_Bank`);

--
-- Indeks untuk tabel `tb_denda`
--
ALTER TABLE `tb_denda`
  ADD PRIMARY KEY (`Id_Denda`),
  ADD KEY `Id_Pembayaran` (`Id_Pembayaran`);

--
-- Indeks untuk tabel `tb_deposit`
--
ALTER TABLE `tb_deposit`
  ADD PRIMARY KEY (`Id_Deposit`),
  ADD KEY `Id_Vendor` (`Id_Vendor`);

--
-- Indeks untuk tabel `tb_diskon`
--
ALTER TABLE `tb_diskon`
  ADD PRIMARY KEY (`Id_Diskon`);

--
-- Indeks untuk tabel `tb_dompet`
--
ALTER TABLE `tb_dompet`
  ADD PRIMARY KEY (`Id_Dompet`),
  ADD KEY `Id_Konsumen` (`Id_Konsumen`);

--
-- Indeks untuk tabel `tb_feedback`
--
ALTER TABLE `tb_feedback`
  ADD KEY `Id_Konsumen` (`Id_Konsumen`),
  ADD KEY `Id_Menu_Paket` (`Id_Menu_Paket`);

--
-- Indeks untuk tabel `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD PRIMARY KEY (`Id_Kecamatan`),
  ADD KEY `fk_kota` (`Id_Kota`);

--
-- Indeks untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD KEY `Id_Konsumen` (`Id_Konsumen`),
  ADD KEY `Id_Menu_Paket` (`Id_Menu_Paket`);

--
-- Indeks untuk tabel `tb_konsumen`
--
ALTER TABLE `tb_konsumen`
  ADD PRIMARY KEY (`Id_Konsumen`);

--
-- Indeks untuk tabel `tb_konten_statis`
--
ALTER TABLE `tb_konten_statis`
  ADD PRIMARY KEY (`Id_Konten_Statis`);

--
-- Indeks untuk tabel `tb_kota`
--
ALTER TABLE `tb_kota`
  ADD PRIMARY KEY (`Id_Kota`),
  ADD KEY `fk_proovinsi` (`Id_Provinsi`);

--
-- Indeks untuk tabel `tb_kurir`
--
ALTER TABLE `tb_kurir`
  ADD PRIMARY KEY (`Id_Kurir`);

--
-- Indeks untuk tabel `tb_menu_paket`
--
ALTER TABLE `tb_menu_paket`
  ADD PRIMARY KEY (`Id_Menu_Paket`),
  ADD KEY `fk_vendor` (`Id_Vendor`);

--
-- Indeks untuk tabel `tb_paket_dipesan`
--
ALTER TABLE `tb_paket_dipesan`
  ADD KEY `fk_pesanan` (`Id_Pesanan`),
  ADD KEY `fk_menu_paket` (`Id_Menu_Paket`);

--
-- Indeks untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`Id_Pembayaran`),
  ADD KEY `Id_Pesanan` (`Id_Pesanan`);

--
-- Indeks untuk tabel `tb_penambahan_deposit`
--
ALTER TABLE `tb_penambahan_deposit`
  ADD PRIMARY KEY (`Id_Penambahan_Deposit`),
  ADD KEY `Id_Deposit` (`Id_Deposit`);

--
-- Indeks untuk tabel `tb_penarikan_deposit`
--
ALTER TABLE `tb_penarikan_deposit`
  ADD PRIMARY KEY (`Id_Penarikan_Deposit`),
  ADD KEY `Id_Deposit` (`Id_Deposit`);

--
-- Indeks untuk tabel `tb_pesanan_event`
--
ALTER TABLE `tb_pesanan_event`
  ADD PRIMARY KEY (`Id_Pesanan`),
  ADD KEY `Id_Konsumen` (`Id_Konsumen`),
  ADD KEY `Id_Kurir` (`Id_Kurir`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`Id_Petugas`),
  ADD KEY `Id_Akun` (`Id_Akun`);

--
-- Indeks untuk tabel `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  ADD PRIMARY KEY (`Id_Provinsi`);

--
-- Indeks untuk tabel `tb_testimoni`
--
ALTER TABLE `tb_testimoni`
  ADD PRIMARY KEY (`Id_Testimoni`);

--
-- Indeks untuk tabel `tb_transfer`
--
ALTER TABLE `tb_transfer`
  ADD PRIMARY KEY (`Id_Transfer`),
  ADD KEY `Id_Bank` (`Id_Bank`),
  ADD KEY `Id_Pembayaran` (`Id_Pembayaran`);

--
-- Indeks untuk tabel `tb_vendor`
--
ALTER TABLE `tb_vendor`
  ADD PRIMARY KEY (`Id_Vendor`),
  ADD KEY `Id_Akun` (`Id_Akun`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_denda`
--
ALTER TABLE `tb_denda`
  ADD CONSTRAINT `tb_denda_ibfk_1` FOREIGN KEY (`Id_Pembayaran`) REFERENCES `tb_pembayaran` (`Id_Pembayaran`);

--
-- Ketidakleluasaan untuk tabel `tb_feedback`
--
ALTER TABLE `tb_feedback`
  ADD CONSTRAINT `tb_feedback_ibfk_1` FOREIGN KEY (`Id_Konsumen`) REFERENCES `tb_konsumen` (`Id_Konsumen`),
  ADD CONSTRAINT `tb_feedback_ibfk_2` FOREIGN KEY (`Id_Menu_Paket`) REFERENCES `tb_menu_paket` (`Id_Menu_Paket`);

--
-- Ketidakleluasaan untuk tabel `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD CONSTRAINT `tb_kecamatan_ibfk_1` FOREIGN KEY (`Id_Kota`) REFERENCES `tb_kota` (`Id_Kota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_kota`
--
ALTER TABLE `tb_kota`
  ADD CONSTRAINT `tb_kota_ibfk_1` FOREIGN KEY (`Id_Provinsi`) REFERENCES `tb_provinsi` (`Id_Provinsi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_menu_paket`
--
ALTER TABLE `tb_menu_paket`
  ADD CONSTRAINT `tb_menu_paket_ibfk_1` FOREIGN KEY (`Id_Vendor`) REFERENCES `tb_vendor` (`Id_Vendor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_paket_dipesan`
--
ALTER TABLE `tb_paket_dipesan`
  ADD CONSTRAINT `tb_paket_dipesan_ibfk_1` FOREIGN KEY (`Id_Pesanan`) REFERENCES `tb_pesanan_event` (`Id_Pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`Id_Pesanan`) REFERENCES `tb_pesanan_event` (`Id_Pesanan`);

--
-- Ketidakleluasaan untuk tabel `tb_penambahan_deposit`
--
ALTER TABLE `tb_penambahan_deposit`
  ADD CONSTRAINT `tb_penambahan_deposit_ibfk_1` FOREIGN KEY (`Id_Deposit`) REFERENCES `tb_deposit` (`Id_Deposit`);

--
-- Ketidakleluasaan untuk tabel `tb_penarikan_deposit`
--
ALTER TABLE `tb_penarikan_deposit`
  ADD CONSTRAINT `tb_penarikan_deposit_ibfk_1` FOREIGN KEY (`Id_Deposit`) REFERENCES `tb_deposit` (`Id_Deposit`);

--
-- Ketidakleluasaan untuk tabel `tb_pesanan_event`
--
ALTER TABLE `tb_pesanan_event`
  ADD CONSTRAINT `tb_pesanan_event_ibfk_1` FOREIGN KEY (`Id_Konsumen`) REFERENCES `tb_konsumen` (`Id_Konsumen`),
  ADD CONSTRAINT `tb_pesanan_event_ibfk_5` FOREIGN KEY (`Id_Kurir`) REFERENCES `tb_kurir` (`Id_Kurir`);

--
-- Ketidakleluasaan untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD CONSTRAINT `tb_petugas_ibfk_1` FOREIGN KEY (`Id_Akun`) REFERENCES `tb_akun` (`Id_Akun`);

--
-- Ketidakleluasaan untuk tabel `tb_transfer`
--
ALTER TABLE `tb_transfer`
  ADD CONSTRAINT `tb_transfer_ibfk_1` FOREIGN KEY (`Id_Bank`) REFERENCES `tb_bank` (`Id_Bank`),
  ADD CONSTRAINT `tb_transfer_ibfk_2` FOREIGN KEY (`Id_Pembayaran`) REFERENCES `tb_pembayaran` (`Id_Pembayaran`);

--
-- Ketidakleluasaan untuk tabel `tb_vendor`
--
ALTER TABLE `tb_vendor`
  ADD CONSTRAINT `tb_vendor_ibfk_1` FOREIGN KEY (`Id_Akun`) REFERENCES `tb_akun` (`Id_Akun`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
