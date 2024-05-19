-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 19, 2024 at 01:32 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multi_vendor_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `first_name`, `last_name`, `phone`, `address`, `country`, `city`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ad Min', 'Ad', 'Min', NULL, NULL, NULL, NULL, 'admin@gmail.com', '$2y$10$.sY3uC2u9e2MCAS3VlAJeeApaYcnFkWF1qXnz025U1AYAlba22cxC', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` int DEFAULT NULL,
  `views` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `blog_category_id` bigint UNSIGNED NOT NULL,
  `blog_sub_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `image`, `description`, `content`, `is_featured`, `views`, `status`, `meta_title`, `meta_description`, `meta_keywords`, `admin_id`, `blog_category_id`, `blog_sub_category_id`, `created_at`, `updated_at`) VALUES
(4, 'The New Sony Solo The Cinematic Dream Brings', 'the-new-sony-solo-the-cinematic-dream-brings', '822221144.blog_img03.jpg', 'Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.', '<p>Blog<br></p>', 1, NULL, 1, 'Blog', 'Blog', 'Blog', 1, 2, 1, '2024-05-15 23:26:10', '2024-05-18 01:32:36'),
(5, 'Closeup Of Woman Hands Buying Online With Credit Card', 'closeup-of-woman-hands-buying-online-with-credit-card', '1860368210.inner-blog_img02.jpg', 'Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.', '<p>Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.<br></p>', 1, NULL, 1, 'Closeup Of Woman Hands Buying Online With Credit Card', 'Closeup Of Woman Hands Buying Online With Credit Card', 'Closeup Of Woman Hands Buying Online With Credit Card', 1, 2, 1, '2024-05-16 01:31:54', '2024-05-18 01:32:26'),
(6, 'Joyful Father And Son Having Fun Spending Tim', 'joyful-father-and-son-having-fun-spending-tim', '1276934611.blog_img02.jpg', 'Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.', '<p>Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.<br></p>', 1, NULL, 1, 'Joyful Father And Son Having Fun Spending Tim', 'Joyful Father And Son Having Fun Spending Tim', 'Joyful Father And Son Having Fun Spending Tim', 1, 2, 1, '2024-05-16 01:32:34', '2024-05-18 01:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Sports', 'sports', '2024-05-14 01:50:12', '2024-05-14 01:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `name`, `email`, `comment`, `blog_id`, `user_id`, `vendor_id`, `admin_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ad Min', 'admin@gmail.com', 'Nice...', 6, NULL, NULL, 1, 0, '2024-05-17 02:23:05', '2024-05-17 02:23:05'),
(2, 'Ad Min', 'admin@gmail.com', 'sdfsdf', 6, NULL, NULL, 1, 0, '2024-05-17 02:24:23', '2024-05-17 02:24:23'),
(3, 'Ad Min', 'admin@gmail.com', 'Nice', 6, NULL, NULL, 1, 0, '2024-05-17 02:33:25', '2024-05-17 02:33:25'),
(4, 'Ad Min', 'admin@gmail.com', 'Nice', 6, NULL, NULL, 1, 0, '2024-05-17 02:33:26', '2024-05-17 02:33:26'),
(5, 'Ad Min', 'admin@gmail.com', 'Nice', 6, NULL, NULL, 1, 0, '2024-05-17 02:33:36', '2024-05-17 02:33:36'),
(6, 'Ad Min', 'admin@gmail.com', 'Nice', 6, NULL, NULL, 1, 0, '2024-05-17 02:33:37', '2024-05-17 02:33:37'),
(7, 'Ad Min', 'admin@gmail.com', 'v', 6, NULL, NULL, 1, 0, '2024-05-17 02:34:52', '2024-05-17 02:34:52'),
(8, 'Ad Min', 'admin@gmail.com', 'v', 6, NULL, NULL, 1, 0, '2024-05-17 02:34:52', '2024-05-17 02:34:52'),
(9, 'Ad Min', 'admin@gmail.com', 'xz', 6, NULL, NULL, 1, 0, '2024-05-17 02:36:03', '2024-05-17 02:36:03'),
(10, 'Ad Min', 'admin@gmail.com', 'werwer', 6, NULL, NULL, 1, 0, '2024-05-17 02:46:36', '2024-05-17 02:46:36'),
(11, 'Ad Min', 'admin@gmail.com', 'xcvxc', 6, NULL, NULL, 1, 0, '2024-05-17 02:48:18', '2024-05-17 02:48:18'),
(12, 'Muhammad Rahim', 'raahim32006@gmail.com', 'Nice', 5, NULL, NULL, NULL, 0, '2024-05-18 00:48:57', '2024-05-18 00:48:57'),
(13, 'Ad Min', 'admin@gmail.com', 'Nice', 4, NULL, NULL, 1, 0, '2024-05-18 01:48:38', '2024-05-18 01:48:38'),
(14, 'Ad Min', 'admin@gmail.com', 'hello', 4, NULL, NULL, 1, 0, '2024-05-18 01:54:32', '2024-05-18 01:54:32'),
(15, 'Ad Min', 'admin@gmail.com', '.', 4, NULL, NULL, 1, 0, '2024-05-18 01:56:07', '2024-05-18 01:56:07'),
(16, 'Ad Min', 'admin@gmail.com', 's', 5, NULL, NULL, 1, 0, '2024-05-18 01:56:27', '2024-05-18 01:56:27'),
(17, 'Ad Min', 'admin@gmail.com', 's', 5, NULL, NULL, 1, 1, '2024-05-18 01:56:57', '2024-05-18 02:45:18'),
(18, 'Ad Min', 'admin@gmail.com', 's', 5, NULL, NULL, 1, 0, '2024-05-18 02:03:41', '2024-05-18 02:45:20'),
(19, 'Ad Min', 'admin@gmail.com', 'z', 5, NULL, NULL, 1, 1, '2024-05-18 02:04:31', '2024-05-18 02:04:31'),
(20, 'Ad Min', 'admin@gmail.com', 'niyc', 5, NULL, NULL, 1, 1, '2024-05-18 02:05:15', '2024-05-18 02:05:15'),
(21, 'Ad Min', 'admin@gmail.com', 'ss', 5, NULL, NULL, 1, 1, '2024-05-18 02:05:43', '2024-05-18 02:49:35'),
(24, 'Ad Min', 'admin@gmail.com', 'new Comment', 6, NULL, NULL, 1, 0, '2024-05-18 22:33:42', '2024-05-18 22:33:42'),
(25, 'Ad Min', 'admin@gmail.com', 'New Comment 2', 6, NULL, NULL, 1, 0, '2024-05-18 22:34:14', '2024-05-18 22:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `blog_likes`
--

CREATE TABLE `blog_likes` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_likes`
--

INSERT INTO `blog_likes` (`id`, `blog_id`, `user_id`, `vendor_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(8, 6, NULL, NULL, 1, '2024-05-17 01:18:58', '2024-05-17 01:18:58'),
(17, 4, NULL, NULL, 1, '2024-05-17 01:34:24', '2024-05-17 01:34:24'),
(18, 5, NULL, NULL, NULL, '2024-05-18 00:44:32', '2024-05-18 00:44:32'),
(19, 5, NULL, NULL, 1, '2024-05-18 02:18:13', '2024-05-18 02:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `blog_sub_categories`
--

CREATE TABLE `blog_sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_sub_categories`
--

INSERT INTO `blog_sub_categories` (`id`, `title`, `slug`, `blog_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Cricket', 'cricket', 2, '2024-05-14 01:54:14', '2024-05-14 02:02:12'),
(3, 'Hockey', 'hockey', 2, '2024-05-15 23:39:16', '2024-05-15 23:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Mens', 'mens', '2024-03-28 13:33:31', '2024-03-28 13:33:31'),
(2, 'Womens', 'womens', '2024-03-28 14:13:27', '2024-03-28 14:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generals`
--

CREATE TABLE `generals` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_approaval` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generals`
--

INSERT INTO `generals` (`id`, `site_name`, `site_email`, `site_phone`, `site_address`, `site_country`, `site_city`, `site_state`, `site_postal_code`, `site_logo`, `site_favicon`, `comment_approaval`, `created_at`, `updated_at`) VALUES
(1, 'Multi Vendor E-Commerce', 'raahim@gmail.com', '03470993615', 'A-135 Asif Colony', 'Pakistan', 'Karachi', 'Sindh', '00000', '1241382390.favicon-removebg-preview.png', '1421336457.pngwing.com (9).png', 0, NULL, '2024-05-18 22:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_03_02_065216_create_generals_table', 1),
(7, '2024_03_02_115248_create_smtp_setups_table', 1),
(8, '2024_03_26_051309_create_vendors_table', 1),
(9, '2024_03_26_104943_create_admins_table', 1),
(10, '2024_03_27_102849_create_categories_table', 1),
(11, '2024_03_27_102859_create_sub_categories_table', 1),
(12, '2024_03_28_092214_create_products_table', 1),
(13, '2024_03_31_172857_create_product_images_table', 2),
(14, '2024_05_13_174935_create_blog_categories_table', 3),
(15, '2024_05_13_174941_create_blog_sub_categories_table', 3),
(17, '2024_05_13_174945_create_blogs_table', 4),
(18, '2024_05_16_163526_create_blog_likes_table', 5),
(19, '2024_05_16_183612_create_blog_comments_table', 6),
(20, '2024_05_19_112433_create_product_colors_table', 7),
(21, '2024_05_19_113057_create_product_sizes_table', 7),
(22, '2024_05_19_113414_create_product_additional_infos_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` bigint NOT NULL,
  `quantity` int NOT NULL,
  `discount` int DEFAULT NULL,
  `actual_price` bigint DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `sub_category_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `image`, `description`, `content`, `price`, `quantity`, `discount`, `actual_price`, `status`, `meta_title`, `meta_description`, `meta_keywords`, `category_id`, `sub_category_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
(3, 'T Shirt 007', 't-shirt-007', '2135209074.download.jpg', 'T Shirt 007', NULL, 2999, 25, 0, 2999, '1', 'T Shirt 007', 'T Shirt 007', 'T Shirt 007', 1, 1, 1, '2024-05-14 00:20:19', '2024-05-19 20:20:56'),
(4, 'Nike V2K Run', 'nike-v2k-run', '593594397.dunk-low-big-kids-shoes-l6Jxh2.png', 'Fast forward. Rewind. Doesn’t matter—this shoe takes retro into the future. The V2K remasters everything you love about the Vomero in a look pulled straight from an early aughts running catalog. Layer up in a mixture of flashy metallics, referential plastic details and a midsole with a perfectly vintage aesthetic. And the chunky heel makes sure wherever you go, it\'s in comfort.', '<p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">Fast forward. Rewind. Doesn’t matter—this shoe takes retro into the future. The V2K remasters everything you love about the Vomero in a look pulled straight from an early aughts running catalog. Layer up in a mixture of flashy metallics, referential plastic details and a midsole with a perfectly vintage aesthetic. And the chunky heel makes sure wherever you go, it\'s in comfort.</p><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Benefits</span></p><ul style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style: none; color: rgb(17, 17, 17);\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Mesh upper feels light and airy.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Dual-density foam midsole creates a comfortable ride.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Translucent plastic accents reference the classic Nike Vomero 5.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Rubber outsole gives you durable traction.</li></ul><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Product Details</span></p><ul style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style: none; color: rgb(17, 17, 17);\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Not intended for use as Personal Protective Equipment (PPE)</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Shown: Summit White/Pure Platinum/Light Iron Ore/Metallic Silver</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Style: FD0736-100</li></ul>', 33250, 10, 10, 29925, '1', 'Nike V2K Run', 'Fast forward. Rewind. Doesn’t matter—this shoe takes retro into the future. The V2K remasters everything you love about the Vomero in a look pulled straight from an early aughts running catalog. Layer up in a mixture of flashy metallics, referential plastic details and a midsole with a perfectly vintage aesthetic. And the chunky heel makes sure wherever you go, it\'s in comfort.', 'Nike V2K Run', 1, 4, 1, '2024-05-19 18:57:38', '2024-05-19 20:18:41'),
(5, 'Nike V2K Run', 'nike-v2k-run', '97880628.v2k-run-shoes-ZKMJLX (1).png', 'Fast forward. Rewind. Doesn’t matter—this shoe takes retro into the future. The V2K remasters everything you love about the Vomero in a look pulled straight from an early aughts running catalog. Layer up in a mixture of flashy metallics, referential plastic details and a midsole with a perfectly vintage aesthetic. And the chunky heel makes sure wherever you go, it\'s in comfort.', '<p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">Fast forward. Rewind. Doesn’t matter—this shoe takes retro into the future. The V2K remasters everything you love about the Vomero in a look pulled straight from an early aughts running catalog. Layer up in a mixture of flashy metallics, referential plastic details and a midsole with a perfectly vintage aesthetic. And the chunky heel makes sure wherever you go, it\'s in comfort.</p><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Benefits</span></p><ul style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style: none; color: rgb(17, 17, 17);\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Mesh upper feels light and airy.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Dual-density foam midsole creates a comfortable ride.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Translucent plastic accents reference the classic Nike Vomero 5.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Rubber outsole gives you durable traction.</li></ul><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Product Details</span></p><ul style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style: none; color: rgb(17, 17, 17);\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Not intended for use as Personal Protective Equipment (PPE)</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Shown: Summit White/Pure Platinum/Light Iron Ore/Metallic Silver</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Style: FD0736-100</li></ul>', 33250, 10, 10, 29925, '1', 'Nike V2K Run', 'Fast forward. Rewind. Doesn’t matter—this shoe takes retro into the future. The V2K remasters everything you love about the Vomero in a look pulled straight from an early aughts running catalog. Layer up in a mixture of flashy metallics, referential plastic details and a midsole with a perfectly vintage aesthetic. And the chunky heel makes sure wherever you go, it\'s in comfort.', 'Nike V2K Run', 1, 4, 1, '2024-05-19 18:58:32', '2024-05-19 20:18:25'),
(6, 'Nike Dunk Low', 'nike-dunk-low', '418677513.v2k-run-shoes-ZKMJLX.png', 'Designed for basketball but adopted by skaters, the Nike Dunk Low helped define sneaker culture. Now this mid-\'80s icon is an easy score for your closet. With ankle padding and durable rubber traction, these are a slam dunk whether you\'re learning to skate or getting ready for school.', '<p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">Designed for basketball but adopted by skaters, the Nike Dunk Low helped define sneaker culture. Now this mid-\'80s icon is an easy score for your closet. With ankle padding and durable rubber traction, these are a slam dunk whether you\'re learning to skate or getting ready for school.</p><p><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Made to Last</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">Real and synthetic leather is durable and adds a classic feel.</p><p><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Heritage Look</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">Collar and tongue pair with perforations on the toe area to give these sneakers an iconic look rooted in the original Dunk.</p><p><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">All-Day Traction</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">Full-length rubber outsole provides durable traction and features a traction pattern similar to the original.</p><p><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Product Details</span></p><ul style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style: none; color: rgb(17, 17, 17);\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Classic laces</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Cupsole construction</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Shown: White/Platinum Violet/Viotech</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px 0px 0px 1em; border: 0px; font: inherit; vertical-align: baseline; position: relative; list-style-type: none;\">Style: FB9109-104</li></ul><p><br style=\"box-sizing: inherit; color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\"></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\">Nike Dunk</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">Born from a series of mash-ups, hacks and tight deadlines, the Nike Dunk landed on college basketball courts during the \'85–\'86 season. While the original College Colors designs helped you stay true to your school, the Dunk didn\'t prove to be popular. But it was this humble sneaker\'s lack of popularity—and flat, grippy soles—that helped it jump the rails to captivate skateboarders. Decades later, this everyday favorite continues to be snatched up in countless colorways, proving its influence is undeniable.</p>', 2600, 10, 50, 1300, '1', 'Nike Dunk Low', 'Designed for basketball but adopted by skaters, the Nike Dunk Low helped define sneaker culture. Now this mid-\'80s icon is an easy score for your closet. With ankle padding and durable rubber traction, these are a slam dunk whether you\'re learning to skate or getting ready for school.', 'Nike Dunk Low', 2, 5, 1, '2024-05-19 19:10:01', '2024-05-19 20:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_additional_infos`
--

CREATE TABLE `product_additional_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_additional_infos`
--

INSERT INTO `product_additional_infos` (`id`, `key`, `value`, `product_id`, `created_at`, `updated_at`) VALUES
(19, 'Brand Name', 'Nike', 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(20, 'style', 'New', 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(21, 'Brand Name', 'Nike', 5, '2024-05-19 20:18:25', '2024-05-19 20:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `name`, `color`, `status`, `product_id`, `created_at`, `updated_at`) VALUES
(26, 'Red', '#ff0000', 1, 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(27, 'Blue', '#0400ff', 1, 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(28, 'Yellow', '#e2ff05', 1, 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(29, 'black', '#000000', 1, 5, '2024-05-19 20:18:25', '2024-05-19 20:18:25'),
(30, 'black', '#000000', 1, 4, '2024-05-19 20:18:41', '2024-05-19 20:18:41'),
(31, 'black', '#000000', 1, 3, '2024-05-19 20:20:56', '2024-05-19 20:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `size`, `status`, `product_id`, `created_at`, `updated_at`) VALUES
(36, 'SM', 1, 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(37, 'Md', 1, 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(38, 'LG', 1, 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(39, 'XL', 1, 6, '2024-05-19 20:18:07', '2024-05-19 20:18:07'),
(40, 'sm', 1, 5, '2024-05-19 20:18:25', '2024-05-19 20:18:25'),
(41, 'sm', 1, 4, '2024-05-19 20:18:41', '2024-05-19 20:18:41'),
(42, 'md', 1, 3, '2024-05-19 20:20:56', '2024-05-19 20:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_setups`
--

CREATE TABLE `smtp_setups` (
  `id` bigint UNSIGNED NOT NULL,
  `smtp_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_encryption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_transport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `title`, `slug`, `icon`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Shirts', 'shirts', NULL, NULL, 1, '2024-03-28 13:34:03', '2024-03-28 13:34:03'),
(2, 'Pents', 'pents', NULL, NULL, 1, '2024-03-28 13:34:03', '2024-03-28 13:34:03'),
(4, 'Shoes', 'shoes', 'flaticon-bag', '774992962.tshirt.jpg', 1, '2024-05-14 00:37:18', '2024-05-14 00:37:18'),
(5, 'Shoes', 'shoes', 'flaticon-shoes', '1072903108.shoes.png', 2, '2024-05-19 18:42:34', '2024-05-19 18:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `first_name`, `last_name`, `phone`, `address`, `country`, `city`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'First Vendor', 'First', 'Vendor', NULL, NULL, NULL, NULL, 'vendor@gmail.com', '$2y$12$jRqaa3TRtqn2rEElZ4KCJ.k8uV4uick23feRZYKqrUBuSncBp1OaG', '1', '2024-03-28 13:34:50', '2024-03-28 13:37:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_admin_id_foreign` (`admin_id`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`),
  ADD KEY `blogs_blog_sub_category_id_foreign` (`blog_sub_category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`),
  ADD KEY `blog_comments_vendor_id_foreign` (`vendor_id`),
  ADD KEY `blog_comments_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_likes_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_likes_user_id_foreign` (`user_id`),
  ADD KEY `blog_likes_vendor_id_foreign` (`vendor_id`),
  ADD KEY `blog_likes_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `blog_sub_categories`
--
ALTER TABLE `blog_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_sub_categories_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `generals`
--
ALTER TABLE `generals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `product_additional_infos`
--
ALTER TABLE `product_additional_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_additional_infos_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `smtp_setups`
--
ALTER TABLE `smtp_setups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blog_likes`
--
ALTER TABLE `blog_likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `blog_sub_categories`
--
ALTER TABLE `blog_sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generals`
--
ALTER TABLE `generals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_additional_infos`
--
ALTER TABLE `product_additional_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `smtp_setups`
--
ALTER TABLE `smtp_setups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_blog_sub_category_id_foreign` FOREIGN KEY (`blog_sub_category_id`) REFERENCES `blog_sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD CONSTRAINT `blog_likes_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_likes_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_likes_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_sub_categories`
--
ALTER TABLE `blog_sub_categories`
  ADD CONSTRAINT `blog_sub_categories_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_additional_infos`
--
ALTER TABLE `product_additional_infos`
  ADD CONSTRAINT `product_additional_infos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
