-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 17, 2022 at 10:37 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upayments`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', '1', '2022-07-17 08:36:27', '2022-07-17 08:36:27'),
(2, 'Computer', '1', '2022-07-17 08:36:27', '2022-07-17 08:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_07_15_045320_create_categories_table', 1),
(11, '2022_07_15_045322_create_product_table', 1),
(12, '2022_07_15_045329_create_cart_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0c69775708acd5286ed45a20cb8399d84f21e367c8f2e6dfe7aaeefedbff1dc11b40edb8120ad9f9', 25, 1, 'upayment', '[]', 0, '2022-07-17 02:39:09', '2022-07-17 02:39:09', '2023-07-17 08:09:09'),
('0e511272a31f8e5b7fc5b485e76ea420a9193fb3f18cf5782fd66c59bf1506d9e4604283fe820ec7', 29, 1, 'upayment', '[]', 0, '2022-07-17 02:45:45', '2022-07-17 02:45:45', '2023-07-17 08:15:45'),
('12d02d88c963995fb8fd98ca9cfb50727b8e32d1939d3d3679bf21a9942bb028693ae7644e7f98df', 40, 1, 'upayment', '[]', 0, '2022-07-17 00:56:50', '2022-07-17 00:56:50', '2023-07-17 06:26:50'),
('13d1d31c29fb6dd16b1c88bbfa16bf52396a0a780a3bcb8518f97d01c8fdb460cc1c72fcba5b778a', 1, 1, 'upayment', '[]', 0, '2022-07-16 22:31:30', '2022-07-16 22:31:30', '2023-07-17 04:01:30'),
('15562150f86776db2552e18c40afae9b18c88c9848b9e4c379678caae4071467993614b2f1cd03b3', 1, 1, 'upayment', '[]', 0, '2022-07-17 00:57:23', '2022-07-17 00:57:23', '2023-07-17 06:27:23'),
('1e08613e2e920674b0e4daeecfd0c441a633677baafdc4e681dfcf13d45d418802d5240d06d0a7df', 30, 1, 'upayment', '[]', 0, '2022-07-17 00:55:11', '2022-07-17 00:55:11', '2023-07-17 06:25:11'),
('2882a16243b616d06178df7ec0d92c6401f3be459314469f19b319d80a5c743c4e0731d9481228c7', 1, 1, 'upayment', '[]', 0, '2022-07-15 05:13:40', '2022-07-15 05:13:40', '2023-07-15 10:43:40'),
('299a370a23427a41d9ec04ebc8f4448e074e6be669b16dc371460e327a886f397a0c3dc23bdc0849', 22, 1, 'upayment', '[]', 0, '2022-07-17 02:38:52', '2022-07-17 02:38:52', '2023-07-17 08:08:52'),
('2f283aa66072722d89ac79f80614eb1074cea3dc868580d8fe53b12644736690ebd9e651f8920aac', 1, 1, 'upayment', '[]', 0, '2022-07-15 05:16:40', '2022-07-15 05:16:40', '2023-07-15 10:46:40'),
('376b71dca0507bb2cecb090b2f5aa8b4aafeec4dc0efecc92a299c1682030b30086c4dd13d3960c1', 30, 1, 'upayment', '[]', 0, '2022-07-17 02:45:45', '2022-07-17 02:45:45', '2023-07-17 08:15:45'),
('38f42d2387e5fd97e4a6f347d827312255c80cb718c4ea911a1b3b3853a7c5293388d3288de5b03d', 25, 1, 'upayment', '[]', 0, '2022-07-17 00:54:41', '2022-07-17 00:54:41', '2023-07-17 06:24:41'),
('3ebb7ef5b8b82c8eb01a591ef2e6d088f0efeac68ff6b11093c4b5e4c42d9e8c4dbec4168b180eb5', 34, 1, 'upayment', '[]', 0, '2022-07-17 00:55:43', '2022-07-17 00:55:43', '2023-07-17 06:25:43'),
('412d53df70232692c82c8e2a3380ce4a61e3bcac20708fb05f87bc7a91372dc933c8ce9250610149', 23, 1, 'upayment', '[]', 0, '2022-07-17 02:38:52', '2022-07-17 02:38:52', '2023-07-17 08:08:52'),
('4f2829346f27b0485e23d9d73fe461cde5c6b7182945bc6aa5d98631f4e0d75913cb61a23795a893', 28, 1, 'upayment', '[]', 0, '2022-07-17 02:40:19', '2022-07-17 02:40:19', '2023-07-17 08:10:19'),
('4f79c73f2e27997ef04cdfa245bdd170b6a0fe9f97024368c7bc639c4971db4a75374ddadbb0fd6e', 26, 1, 'upayment', '[]', 0, '2022-07-17 00:54:52', '2022-07-17 00:54:52', '2023-07-17 06:24:52'),
('503d4771b8c86d982a3237a98ef9b64b5763ff7b9af7738530c8920acf8df34719f512fd27ac351d', 20, 1, 'upayment', '[]', 0, '2022-07-17 02:38:15', '2022-07-17 02:38:15', '2023-07-17 08:08:15'),
('56abab16c35d71c17292e77bd2d3867061d60b7b50ea648be9a68dde3179e9c218b8911c7e09c834', 17, 1, 'upayment', '[]', 0, '2022-07-17 02:37:51', '2022-07-17 02:37:51', '2023-07-17 08:07:51'),
('64782378eecb3cb31768314be2449ab799d1fc7ab60dd0410e9c805133ae45ffffb2f5608912b8f0', 3, 1, 'upayment', '[]', 0, '2022-07-17 00:58:19', '2022-07-17 00:58:19', '2023-07-17 06:28:19'),
('73cc5cf351faf7ef02fc7cb0d05b94298efb5a5057f54a4dc076afdd1d15d6d296358d1c6ed6ba04', 1, 1, 'upayment', '[]', 0, '2022-07-15 05:19:41', '2022-07-15 05:19:41', '2023-07-15 10:49:41'),
('78444b12e904eb7c97c2d4048045bbd6de18e509f99cbbd51eaaa23c616241f879cf996cd66b1c97', 18, 1, 'upayment', '[]', 0, '2022-07-17 02:38:05', '2022-07-17 02:38:05', '2023-07-17 08:08:05'),
('8d0b21462bd3ac838f56e2e9db4424c3ef728d544bb243e9d1b4a158b99cf81db0fb4d9d17d957d0', 31, 1, 'upayment', '[]', 0, '2022-07-17 02:45:45', '2022-07-17 02:45:45', '2023-07-17 08:15:45'),
('91fba0eea4ec9ade3871ba2d9c8b11c65f2e5ce86ce5479fd9b24f46027ad8c7ee252fda74ad20e1', 33, 1, 'upayment', '[]', 0, '2022-07-17 02:45:45', '2022-07-17 02:45:45', '2023-07-17 08:15:45'),
('924117256f77ddb517ae58caf8e5e55c671da7f919e4894b3e598e7da940f5865c91784c0179ccf0', 1, 1, 'upayment', '[]', 0, '2022-07-17 00:58:42', '2022-07-17 00:58:42', '2023-07-17 06:28:42'),
('9324fbafc352937d01b359c4e42b77fd6a131248cccb8e23ed6017d7483f652ce0e817796afff748', 21, 1, 'upayment', '[]', 0, '2022-07-17 02:38:15', '2022-07-17 02:38:15', '2023-07-17 08:08:15'),
('97eb0dc5f2a4b0f15830533c834cb9fd0f4844918f584d6b64554828cef7abf6c9857dc8053869e8', 26, 1, 'upayment', '[]', 0, '2022-07-17 02:40:19', '2022-07-17 02:40:19', '2023-07-17 08:10:19'),
('9cf041207d82e2214dd63e84ce5db007f347ced5ca57da6d30a5b8fe4fb9409618dcca6090421b85', 32, 1, 'upayment', '[]', 0, '2022-07-17 02:45:45', '2022-07-17 02:45:45', '2023-07-17 08:15:45'),
('aee228385065e03261f60bc22c8efe8b5bafab8a9149f17d09a1e2f5c477beadbd37e4661c7e6c14', 27, 1, 'upayment', '[]', 0, '2022-07-17 02:40:19', '2022-07-17 02:40:19', '2023-07-17 08:10:19'),
('b81501fc773b86ce2741d52f29de654c2593ebb1e92391306b0e4950d1277da27ea52462f2005e44', 32, 1, 'upayment', '[]', 0, '2022-07-17 00:55:29', '2022-07-17 00:55:29', '2023-07-17 06:25:29'),
('c0dcff12c37d2fc25701f811ada8f7b95a7423a22aa84169d2b43728df23c9d6834d2a367b3b3477', 36, 1, 'upayment', '[]', 0, '2022-07-17 00:55:58', '2022-07-17 00:55:58', '2023-07-17 06:25:58'),
('c337b37676118c7f972f61af33df54ae469cdfae486a0402e6d4a92f54817a9eb1d6548280027f72', 19, 1, 'upayment', '[]', 0, '2022-07-17 02:38:15', '2022-07-17 02:38:15', '2023-07-17 08:08:15'),
('c38513c599e14387840973a1af07dea96e259a21dd7faaf1ad74ea991d3ef143baffb904a829b6bc', 1, 1, 'upayment', '[]', 0, '2022-07-15 08:21:36', '2022-07-15 08:21:36', '2023-07-15 13:51:36'),
('cf60f11a81c6cf33d623a9c7da4c3d11e17e02ecd69da6a85698c6d764dc6e613f7861db71d78476', 5, 1, 'upayment', '[]', 0, '2022-07-15 05:11:47', '2022-07-15 05:11:47', '2023-07-15 10:41:47'),
('cfc8ad4e0ab47bfeda78ac0366292fa999fb770e91dc1853f3143d241a811c1eb13c15c6fdd83de8', 1, 1, 'upayment', '[]', 0, '2022-07-15 05:17:02', '2022-07-15 05:17:02', '2023-07-15 10:47:02'),
('d346da20583193e858e5fce810aa8e6fd4cad330e782fdf8f5d3ec99700f9e1bc4c690449a1a15bf', 4, 1, 'upayment', '[]', 0, '2022-07-17 00:58:19', '2022-07-17 00:58:19', '2023-07-17 06:28:19'),
('d980e523ba30a5eb5bc9616ec5569688602207d9ab23653f03a16327adcbf1eb6f51f596de34ef8d', 1, 1, 'upayment', '[]', 0, '2022-07-15 05:18:17', '2022-07-15 05:18:17', '2023-07-15 10:48:17'),
('db6d085848cd692dd619477714dde8f6f8a8ce45d8b589b2ebf120a25c7f81e40eb7f10c9a7f6f12', 24, 1, 'upayment', '[]', 0, '2022-07-17 02:39:09', '2022-07-17 02:39:09', '2023-07-17 08:09:09'),
('ed0e1213d5dd5914b10861fe81fb0abe5bad5d5b8160fce3b06a5f7d5baef77de2eac3f5b6e0a25c', 2, 1, 'upayment', '[]', 0, '2022-07-17 00:58:42', '2022-07-17 00:58:42', '2023-07-17 06:28:42'),
('f54be2259144f1b685efcede64df4cbff9d1350bca36d1656cec84034b513dfe02339a90a3ec4506', 38, 1, 'upayment', '[]', 0, '2022-07-17 00:56:35', '2022-07-17 00:56:35', '2023-07-17 06:26:35'),
('fcf6e215aa2bd7497d12a8f3912130afa3f2ea9ea3b084094b000436703325307b02f19a71a9a4e6', 28, 1, 'upayment', '[]', 0, '2022-07-17 00:54:59', '2022-07-17 00:54:59', '2023-07-17 06:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'dRdcP66NJ37coXHixfBDNiJD4x6gUBQbhBwLdMeM', NULL, 'http://localhost', 1, 0, 0, '2022-07-15 00:32:45', '2022-07-15 00:32:45'),
(2, NULL, 'Laravel Password Grant Client', 'u5YN4ShrgPYl3LQaIT1XdbafXzBwTzpWatsu2zdP', 'users', 'http://localhost', 0, 1, 0, '2022-07-15 00:32:45', '2022-07-15 00:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-07-15 00:32:45', '2022-07-15 00:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'upayment', '5500d0761b9a0a5a5d28d444ac4fb5aee93db770ff867706b23ccb398508f865', '[\"*\"]', NULL, '2022-07-15 05:05:00', '2022-07-15 05:05:00'),
(2, 'App\\Models\\User', 4, 'upayment', 'dbb619f83269a81be4eae0e7fbbf655e184507ee4f72fa62bd303abb8e58f4ea', '[\"*\"]', NULL, '2022-07-15 05:06:13', '2022-07-15 05:06:13'),
(3, 'App\\Models\\User', 5, 'upayment', 'd3db811d3fb3e4c11175d507a423329ab6b31a21814bd66fa3819cb42f72c7ba', '[\"*\"]', NULL, '2022-07-15 05:08:34', '2022-07-15 05:08:34'),
(4, 'App\\Models\\User', 5, 'upayment', 'ee2dceea0bfb302f61510ad1ed8349946ea9dd20d83136b57d7c187cfd5e08af', '[\"*\"]', NULL, '2022-07-15 05:09:17', '2022-07-15 05:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_avatar` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_foreign` (`user_id`),
  ADD KEY `cart_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD KEY `products_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
