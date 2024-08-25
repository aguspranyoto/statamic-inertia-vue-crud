-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 25, 2024 at 03:37 PM
-- Server version: 11.4.2-MariaDB
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `statamic-inertia-vue-crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets_meta`
--

CREATE TABLE `assets_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `container` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `basename` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `extension` char(10) NOT NULL,
  `path` varchar(255) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_containers`
--

CREATE TABLE `asset_containers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `disk` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blueprints`
--

CREATE TABLE `blueprints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `handle` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blueprints`
--

INSERT INTO `blueprints` (`id`, `namespace`, `handle`, `data`, `created_at`, `updated_at`) VALUES
(1, NULL, 'default', '{\"fields\":[{\"field\":{\"type\":\"markdown\",\"display\":\"Content\",\"localizable\":true},\"handle\":\"content\"}]}', '2024-08-25 07:28:33', NULL);

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
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `handle`, `title`, `settings`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', '{\"routes\":[],\"slugs\":true,\"title_formats\":[],\"mount\":null,\"dated\":false,\"sites\":null,\"template\":null,\"layout\":null,\"inject\":[],\"search_index\":null,\"revisions\":false,\"default_status\":true,\"structure\":null,\"sort_dir\":null,\"sort_field\":null,\"taxonomies\":[],\"propagate\":false,\"past_date_behavior\":\"public\",\"future_date_behavior\":\"private\",\"preview_targets\":[{\"label\":\"Entry\",\"format\":\"{permalink}\",\"refresh\":true}],\"origin_behavior\":\"select\"}', '2024-08-25 07:30:08', '2024-08-25 07:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` char(36) NOT NULL,
  `site` varchar(255) NOT NULL,
  `origin_id` char(36) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `collection` varchar(255) NOT NULL,
  `blueprint` varchar(30) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `site`, `origin_id`, `published`, `slug`, `uri`, `date`, `order`, `collection`, `blueprint`, `data`, `created_at`, `updated_at`) VALUES
('16266b33-c2ba-4e00-a799-79ebda00c085', 'default', NULL, 1, 'aaa-aaaa-ddd', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"aaa aaaa ddd\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:16:14', '2024-08-25 08:34:11'),
('1b58129c-74fa-441e-8283-70411311e065', 'default', NULL, 1, 'aa-vbbbb', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"aa vbbbb\",\"content\":\"oh yeah\",\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:26:32', '2024-08-25 08:34:19'),
('1c90e3cc-9c70-450b-a8fb-42834b460f11', 'default', NULL, 1, 'aaa-bbb', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"aaa bbb\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:08:56', '2024-08-25 08:08:56'),
('3f944ec3-52d8-4175-a410-45ae6d28985f', 'default', NULL, 1, '11-sdad', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"11 sdad\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:11:01', '2024-08-25 08:11:00'),
('4ac64efe-3761-41ba-89b7-27efade4bbf2', 'default', NULL, 1, 'hhhh-wwww', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"hhhh wwww\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:07:13', '2024-08-25 08:07:13'),
('71730394-9e7c-4a4d-98af-f9268bed99f9', 'default', NULL, 1, 'aa-ss', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"aa ss\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:20:43', '2024-08-25 08:20:43'),
('724c400a-0978-40b0-a6d3-0337470517bf', 'default', NULL, 1, 'asdas-sss', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"asdas  sss\",\"content\":\"d\",\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:13:14', '2024-08-25 08:13:14'),
('7dc31131-44ca-4cd9-bf8a-6533c3732db7', 'default', NULL, 1, 'agus-pranyoto', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"agus pranyoto\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 07:30:28', '2024-08-25 07:30:28'),
('c3ea6e0f-2345-44bf-981f-037b6b003afe', 'default', NULL, 1, 'agud-gaming', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"agud gaming\",\"content\":null}', '2024-08-25 08:01:17', '2024-08-25 08:01:17'),
('ed63be0c-8999-4bcc-9a5d-db976c1a1995', 'default', NULL, 1, 'aasd-sss', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"aasd sss\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:04:21', '2024-08-25 08:04:21'),
('f342b20f-5c40-474a-88cd-405a7097b892', 'default', NULL, 1, 'aa-vvb-bb', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"aa vvb bb\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:26:20', '2024-08-25 08:26:20'),
('f4a0461a-7697-4f82-82c4-c6294fa64aa9', 'default', NULL, 1, '11-333', NULL, NULL, NULL, 'users', 'user', '{\"title\":\"11 333\",\"content\":null,\"updated_by\":\"9cd9e20f-c262-4645-9620-4d1b298796cf\"}', '2024-08-25 08:27:29', '2024-08-25 08:27:29');

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
-- Table structure for table `fieldsets`
--

CREATE TABLE `fieldsets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_submissions`
--

CREATE TABLE `form_submissions` (
  `id` double NOT NULL,
  `form` varchar(30) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_sets`
--

CREATE TABLE `global_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_set_variables`
--

CREATE TABLE `global_set_variables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `group_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2024_03_07_100000_create_asset_containers_table', 1),
(5, '2024_03_07_100000_create_asset_table', 1),
(6, '2024_03_07_100000_create_blueprints_table', 1),
(7, '2024_03_07_100000_create_collections_table', 1),
(8, '2024_03_07_100000_create_entries_table_with_string_ids', 1),
(9, '2024_03_07_100000_create_fieldsets_table', 1),
(10, '2024_03_07_100000_create_form_submissions_table', 1),
(11, '2024_03_07_100000_create_forms_table', 1),
(12, '2024_03_07_100000_create_global_variables_table', 1),
(13, '2024_03_07_100000_create_globals_table', 1),
(14, '2024_03_07_100000_create_navigation_trees_table', 1),
(15, '2024_03_07_100000_create_navigations_table', 1),
(16, '2024_03_07_100000_create_taxonomies_table', 1),
(17, '2024_03_07_100000_create_terms_table', 1),
(18, '2024_03_07_100000_create_tokens_table', 1),
(19, '2024_05_15_100000_modify_form_submissions_id', 1),
(20, '2024_06_25_020821_statamic_auth_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

CREATE TABLE `navigations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_activation_tokens`
--

CREATE TABLE `password_activation_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `role_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `taxonomies`
--

CREATE TABLE `taxonomies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sites` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sites`)),
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_terms`
--

CREATE TABLE `taxonomy_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `taxonomy` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `handler` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `expire_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trees`
--

CREATE TABLE `trees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `tree` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tree`)),
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `super` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `super`, `avatar`, `preferences`, `last_login`) VALUES
('9cd9e20f-c262-4645-9620-4d1b298796cf', 'agus', 'agus@example.com', NULL, '$2y$12$pG9xYFouqnfWmQbJkONuGuLzmVR3TvEPeCoNkUci/3bSb/jNnMlmO', NULL, '2024-08-25 07:29:05', '2024-08-25 07:29:05', 1, NULL, NULL, '2024-08-25 07:29:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets_meta`
--
ALTER TABLE `assets_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_meta_container_folder_basename_unique` (`container`,`folder`,`basename`),
  ADD KEY `assets_meta_container_index` (`container`),
  ADD KEY `assets_meta_folder_index` (`folder`),
  ADD KEY `assets_meta_basename_index` (`basename`),
  ADD KEY `assets_meta_filename_index` (`filename`),
  ADD KEY `assets_meta_extension_index` (`extension`),
  ADD KEY `assets_meta_path_index` (`path`);

--
-- Indexes for table `asset_containers`
--
ALTER TABLE `asset_containers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_containers_handle_unique` (`handle`);

--
-- Indexes for table `blueprints`
--
ALTER TABLE `blueprints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blueprints_handle_namespace_unique` (`handle`,`namespace`),
  ADD KEY `blueprints_namespace_index` (`namespace`);

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
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collections_handle_unique` (`handle`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_site_index` (`site`),
  ADD KEY `entries_origin_id_index` (`origin_id`),
  ADD KEY `entries_uri_index` (`uri`),
  ADD KEY `entries_order_index` (`order`),
  ADD KEY `entries_collection_index` (`collection`),
  ADD KEY `entries_blueprint_index` (`blueprint`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fieldsets`
--
ALTER TABLE `fieldsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldsets_handle_unique` (`handle`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forms_handle_unique` (`handle`);

--
-- Indexes for table `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form_submissions_id_unique` (`id`),
  ADD UNIQUE KEY `form_submissions_form_created_at_unique` (`form`,`created_at`),
  ADD KEY `form_submissions_form_index` (`form`);

--
-- Indexes for table `global_sets`
--
ALTER TABLE `global_sets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `global_sets_handle_unique` (`handle`);

--
-- Indexes for table `global_set_variables`
--
ALTER TABLE `global_set_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_set_variables_handle_index` (`handle`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navigations_handle_unique` (`handle`);

--
-- Indexes for table `password_activation_tokens`
--
ALTER TABLE `password_activation_tokens`
  ADD KEY `password_activation_tokens_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `taxonomies`
--
ALTER TABLE `taxonomies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxonomies_handle_unique` (`handle`);

--
-- Indexes for table `taxonomy_terms`
--
ALTER TABLE `taxonomy_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxonomy_terms_slug_taxonomy_site_unique` (`slug`,`taxonomy`,`site`),
  ADD KEY `taxonomy_terms_site_index` (`site`),
  ADD KEY `taxonomy_terms_uri_index` (`uri`),
  ADD KEY `taxonomy_terms_taxonomy_index` (`taxonomy`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`);

--
-- Indexes for table `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trees_handle_type_locale_unique` (`handle`,`type`,`locale`),
  ADD KEY `trees_type_index` (`type`),
  ADD KEY `trees_locale_index` (`locale`);

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
-- AUTO_INCREMENT for table `assets_meta`
--
ALTER TABLE `assets_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_containers`
--
ALTER TABLE `asset_containers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blueprints`
--
ALTER TABLE `blueprints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldsets`
--
ALTER TABLE `fieldsets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_sets`
--
ALTER TABLE `global_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_set_variables`
--
ALTER TABLE `global_set_variables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxonomies`
--
ALTER TABLE `taxonomies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxonomy_terms`
--
ALTER TABLE `taxonomy_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trees`
--
ALTER TABLE `trees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
