-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2024 at 07:29 PM
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

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `phone`, `address`, `country`, `city`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ad', 'Min', NULL, NULL, NULL, NULL, 'admin@gmail.com', '$2y$10$.sY3uC2u9e2MCAS3VlAJeeApaYcnFkWF1qXnz025U1AYAlba22cxC', NULL, NULL, NULL);

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
  `likes` bigint DEFAULT NULL,
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

INSERT INTO `blogs` (`id`, `title`, `slug`, `image`, `description`, `content`, `is_featured`, `likes`, `views`, `status`, `meta_title`, `meta_description`, `meta_keywords`, `admin_id`, `blog_category_id`, `blog_sub_category_id`, `created_at`, `updated_at`) VALUES
(4, 'The New Sony Solo The Cinematic Dream Brings', 'the-new-sony-solo-the-cinematic-dream-brings', '822221144.blog_img03.jpg', 'Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.', '<p>Blog<br></p>', NULL, NULL, NULL, 1, 'Blog', 'Blog', 'Blog', 1, 2, 1, '2024-05-15 23:26:10', '2024-05-16 01:30:31'),
(5, 'Closeup Of Woman Hands Buying Online With Credit Card', 'closeup-of-woman-hands-buying-online-with-credit-card', '1860368210.inner-blog_img02.jpg', 'Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.', '<p>Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.<br></p>', NULL, NULL, NULL, 1, 'Closeup Of Woman Hands Buying Online With Credit Card', 'Closeup Of Woman Hands Buying Online With Credit Card', 'Closeup Of Woman Hands Buying Online With Credit Card', 1, 2, 1, '2024-05-16 01:31:54', '2024-05-16 01:31:54'),
(6, 'Joyful Father And Son Having Fun Spending Tim', 'joyful-father-and-son-having-fun-spending-tim', '1276934611.blog_img02.jpg', 'Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.', '<p>Lorem Ipsum is simply dumy text the printing and industry orem Ipsum been industry\'s standard dummy.<br></p>', NULL, NULL, NULL, 1, 'Joyful Father And Son Having Fun Spending Tim', 'Joyful Father And Son Having Fun Spending Tim', 'Joyful Father And Son Having Fun Spending Tim', 1, 2, 1, '2024-05-16 01:32:34', '2024-05-16 01:32:34');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generals`
--

INSERT INTO `generals` (`id`, `site_name`, `site_email`, `site_phone`, `site_address`, `site_country`, `site_city`, `site_state`, `site_postal_code`, `site_logo`, `site_favicon`, `created_at`, `updated_at`) VALUES
(1, 'Multi Vendor E-Commerce', 'raahim@gmail.com', '03470993615', 'A-135 Asif Colony', 'Pakistan', 'Karachi', 'Sindh', '00000', '1241382390.favicon-removebg-preview.png', '1421336457.pngwing.com (9).png', NULL, '2024-03-28 13:28:02');

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
(17, '2024_05_13_174945_create_blogs_table', 4);

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
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint NOT NULL,
  `quantity` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `products` (`id`, `title`, `slug`, `image`, `description`, `price`, `quantity`, `status`, `meta_title`, `meta_description`, `meta_keywords`, `category_id`, `sub_category_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
(3, 'T Shirt 007', 't-shirt-007', '865946907.tshirt.jpg', 'T Shirt 007', 2999, 25, '1', 'T Shirt 007', 'T Shirt 007', 'T Shirt 007', 1, 1, 1, '2024-05-14 00:20:19', '2024-05-14 00:25:09');

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

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, '365178907.tshirt.jpg', 3, '2024-05-14 00:20:19', '2024-05-14 00:20:19');

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
(4, 'Shoes', 'shoes', 'flaticon-bag', '774992962.tshirt.jpg', 1, '2024-05-14 00:37:18', '2024-05-14 00:37:18');

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
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smtp_setups`
--
ALTER TABLE `smtp_setups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
