-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 16, 2022 at 11:59 AM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firstlaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` bigint UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `endereco`, `cnpj`, `telefone`, `created_at`, `updated_at`) VALUES
(1, 'quibusdam', 'Recusandae dolorum neque sit. - Sul', '62.757.320/0001-48', '(24) 91676-7951', '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(2, 'iste', 'Mollitia aperiam magni. - Nordeste', '52.376.150/0001-06', '(79) 95937-9374', '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(4, 'consequuntur', 'Repellat natus. - Nordeste', '90.582.697/0001-49', '(35) 90825-7806', '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(5, 'molestias', 'Voluptatem voluptatibus libero mollitia. - Nordeste', '99.494.960/0001-12', '(53) 92446-7827', '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(6, 'Advanced Micro Devices, Inc. BR Office', 'Filial; Av. Paulista, nr 4567, Sao Paulo, Brasil. Sede: Palo Alto, nr. 3456, California, USA', '67.828.796/0004-45', '(21) 98755-8976', '2022-03-16 17:25:53', '2022-03-16 17:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_09_131833_create_fornecedores_table', 1),
(6, '2022_03_23_143118_create_produtos_table', 1);

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
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `id` bigint UNSIGNED NOT NULL,
  `fornecedor_id` bigint UNSIGNED NOT NULL,
  `nome` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtd_estoque` int NOT NULL,
  `preco` double(8,2) NOT NULL,
  `importado` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`id`, `fornecedor_id`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`, `created_at`, `updated_at`) VALUES
(1, 1, 'laborum', 'Aut perferendis omnis iure quis nemo qui. Facilis porro est commodi corporis neque veniam. Provident voluptatem voluptatem quia aut nemo nemo. Maxime officia beatae aut deleniti.', 86929, 4812.68, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(2, 1, 'porro', 'Nisi dolorum rerum nemo dolores et quae quam. Aliquam repellendus natus voluptatem molestias. Cum qui quia excepturi omnis aut vitae dignissimos. Labore aperiam repellendus velit non. Saepe saepe eligendi molestias sit facere dicta modi.', 91646, 1986.99, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(3, 1, 'ut', 'Expedita aut tempore sit quidem a iste aliquam. Et in consequuntur quia aperiam ea. Molestiae eos ut voluptatibus eligendi dolore id. Et enim voluptas similique delectus qui. Atque ea ea est eos ut.', 99870, 10042.96, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(4, 1, 'autem', 'Aut et quis ullam dolor magnam. Consequuntur laborum incidunt omnis enim voluptatum rerum tenetur. Enim cum dignissimos dignissimos non ipsa saepe. Et modi nostrum et ipsa dicta id. Eveniet deserunt placeat provident minima.', 8817, 142.19, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(5, 1, 'quis', 'Quisquam quasi nobis delectus corporis deserunt nostrum mollitia numquam. Doloribus dolore voluptatibus quisquam in et tempora consequatur. Minima aut molestiae non et molestias deserunt sit sint. Vero non ducimus magnam quo nam delectus qui. Quis maiores ut voluptatibus eligendi reiciendis. Veniam doloribus accusantium nisi at aliquam qui.', 7109, 3696.01, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(6, 1, 'tempore', 'Nobis laudantium magni vitae rem qui quae. Illo officia consequuntur omnis odio et est. Velit aut nihil deserunt consequuntur. Culpa non voluptatibus blanditiis facere voluptatibus. Et consectetur molestiae non sit nemo ut.', 9766, 8865.79, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(7, 1, 'ut', 'Est quo exercitationem sit dolorum consequatur dolorum. Est eum non itaque natus minus quia non. Explicabo atque perspiciatis vero voluptatibus deserunt voluptatem saepe. Quae blanditiis qui dolorem at et soluta. Dolorem aliquid deleniti labore qui voluptas.', 59118, 9634.26, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(8, 1, 'quia', 'Minima quia aut itaque vero molestiae quos vero. Et ratione cumque non cum. Neque qui voluptatibus dicta quibusdam tempore. Quo harum est odit voluptas repellat quos exercitationem. Quia placeat provident nam nostrum veniam. Recusandae officia cumque eius.', 96415, 2453.14, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(9, 1, 'rem', 'Tenetur blanditiis voluptatem esse inventore. Unde animi praesentium fuga asperiores. Magnam quae blanditiis illum maiores. Quidem fuga quia odit consequatur voluptatem. Dolorem ab impedit aut dolorum distinctio aut.', 83782, 9424.03, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(10, 1, 'quia', 'Sint qui tenetur repellendus ea. Ea repellat iusto consequatur sint. Quis quisquam aspernatur quaerat ut alias corrupti. Aut iusto sed et ratione qui quia ut.', 908, 857.24, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(11, 2, 'hic', 'Vel expedita rerum aliquid. Eveniet soluta ut voluptate architecto. Cum nihil officiis odio repellendus voluptatem. Totam ut sit corporis. Culpa ut ipsum qui quis.', 12467, 4844.32, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(12, 2, 'architecto', 'Omnis exercitationem corporis numquam. Magnam qui dolor ex animi ea in. Aut consequatur minima officiis dignissimos nulla deleniti. Quo natus et debitis. Eaque odit quas molestiae.', 23586, 3632.20, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(13, 2, 'adipisci', 'Et tenetur velit ut. Quis voluptatum enim neque illum. Recusandae reprehenderit laudantium ad in. Iure cupiditate sed unde maiores consequatur nihil. Pariatur explicabo quo repudiandae quam optio aut.', 80689, 14692.45, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(14, 2, 'accusamus', 'Sit molestias ducimus eos quas possimus sunt. Dolore et magnam nihil deserunt. Vel eum autem illo doloribus. Vitae explicabo illum autem ut. Est ipsum vel facilis sit et dolorum quia. Enim est qui sint inventore.', 17249, 14044.47, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(15, 2, 'animi', 'Ut architecto suscipit alias occaecati est officiis. Sapiente quo aut eos accusantium. Porro quia beatae animi. Et eos dolores animi assumenda corporis iure id. Placeat dolorem nam non quia optio.', 78341, 7592.40, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(16, 2, 'quaerat', 'Ea magnam est atque et consequatur ipsum. Rem sit iusto est ut recusandae eaque. Quisquam necessitatibus possimus dolor dolores id omnis. Blanditiis fuga aut in voluptatem nam nam voluptatem. Amet quidem voluptatem ipsum similique voluptatum natus voluptas.', 68546, 9490.68, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(17, 2, 'aspernatur', 'Fuga ratione est sapiente nemo. Ut et omnis perspiciatis labore id numquam eius. Sit est non enim tempore maiores excepturi ut. Quis deleniti nesciunt quia doloremque accusamus recusandae cumque.', 37192, 12176.64, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(18, 2, 'ipsum', 'Ullam odit ut ipsam explicabo occaecati laboriosam. Laudantium atque et quis quo quo. Eveniet voluptatem laboriosam cumque suscipit laborum delectus. Rerum autem aut repudiandae ipsam aut. Laudantium molestiae omnis ea vel rerum quasi. Quae omnis illo totam quia reprehenderit eligendi quasi.', 77615, 13714.68, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(19, 2, 'facere', 'Dignissimos officiis autem qui sequi odit. Nihil beatae nemo id aut. Ut quo dignissimos occaecati fugiat doloremque vel itaque. Impedit voluptate commodi error voluptatem nemo harum exercitationem.', 43993, 3635.84, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(20, 2, 'veritatis', 'Debitis pariatur et nisi. Non quibusdam exercitationem numquam quasi vero blanditiis suscipit non. Sit aperiam soluta cupiditate et. Non beatae quis aut nostrum illo autem consequatur.', 52571, 6158.94, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(31, 4, 'magnam', 'Omnis explicabo recusandae aut consequuntur quia et. Dignissimos aperiam corporis quasi omnis. Incidunt non totam est aspernatur voluptatibus. Eos autem consectetur aliquid debitis praesentium dolorem eaque amet.', 8562, 1363.52, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(32, 4, 'incidunt', 'Error ut ut fuga. Velit impedit dignissimos in ipsum in. Totam dolor saepe qui vel dolore reiciendis quo.', 26048, 4600.17, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(33, 4, 'voluptas', 'Recusandae consequuntur quia voluptatibus et nemo ab. Accusamus voluptates est et aperiam sapiente aut. Et doloribus hic nostrum dolore.', 1733, 8794.42, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(34, 4, 'autem', 'Ab error accusamus molestias sequi consequatur est voluptas. Officiis eveniet ab voluptatem molestiae corporis rerum est fugit. Fuga dolor magni non atque. Illum dolorem quia itaque quod vitae excepturi et nihil. Cupiditate fuga dolorum dignissimos aut voluptatem nisi. Cumque omnis officia sed omnis sit iure sit.', 71158, 765.30, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(35, 4, 'voluptas', 'Ipsa nam reprehenderit ut nam voluptates. Quasi est officia repudiandae. Repellat ut similique ut officiis.', 58465, 10447.36, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(36, 4, 'et', 'Qui omnis sit ut nemo voluptatem qui laudantium. Nam doloremque laudantium neque blanditiis labore perspiciatis. Dolorem hic et aut voluptas in. Dolorem ipsam harum ipsam iusto modi. Rerum fuga dolores accusamus quia sit.', 36084, 1642.56, 0, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(37, 4, 'voluptatibus', 'Sint sed commodi maiores qui officiis. Culpa sapiente excepturi et consequatur temporibus voluptas eaque. Saepe fuga quam architecto quo.', 91191, 4830.40, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(38, 4, 'vero', 'Quia incidunt deleniti non et autem. Voluptas quis placeat consequatur animi. Praesentium eligendi quo doloremque porro voluptas rerum aut. Sit aperiam necessitatibus non labore. Itaque quia odit eos ratione aut.', 72655, 853.57, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(39, 4, 'perferendis', 'Culpa aut voluptates rerum magnam dolorem labore architecto. Quis architecto non nisi consequuntur provident. Consectetur omnis velit necessitatibus id alias asperiores maiores. Ex reprehenderit at beatae. Id commodi et at quasi. Id qui hic nihil modi ut.', 37567, 11173.97, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(40, 4, 'sapiente', 'Ipsa in animi maiores et corporis. Libero aut mollitia rem molestias odio itaque fugit rerum. Ad est vero impedit error pariatur. Quae reprehenderit nesciunt voluptas mollitia recusandae vero nemo. Consequuntur accusamus autem aut nostrum libero et.', 86747, 10126.02, 1, '2022-03-09 16:50:09', '2022-03-09 16:50:09'),
(41, 5, 'cum', 'Porro eligendi et modi odit rem. Molestias quo expedita et quae odio non perspiciatis eos. Similique nulla quae numquam.', 81926, 6600.11, 1, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(42, 5, 'hic', 'Voluptates dicta totam in distinctio magnam et consequatur. Architecto quia quos quo animi blanditiis. Sit et qui praesentium id dolor temporibus. Eveniet illum eos sit. Qui soluta sit culpa est.', 64668, 2169.67, 0, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(43, 5, 'temporibus', 'Consectetur odit molestias nisi tempora et. Eum distinctio quisquam eligendi vitae omnis itaque. Qui quia accusantium tenetur repudiandae. Aut accusantium eos nemo tempore amet. Tenetur tempora neque saepe eum.', 71387, 604.25, 1, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(44, 5, 'quia', 'Velit quia porro mollitia saepe quia. Inventore libero aliquid recusandae explicabo sequi fuga quibusdam pariatur. Blanditiis eos ut doloribus sit. Corporis consequatur ut voluptatibus error ipsa et earum odit.', 79590, 5844.30, 0, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(46, 5, 'voluptas', 'Neque necessitatibus sed voluptatem qui voluptatem minima. Totam voluptatum hic porro consequuntur et. Voluptate minima ex vel earum nobis. Repudiandae officia voluptatibus quis perferendis aut doloremque quod repudiandae. Labore modi incidunt rem id. Ipsa illo est blanditiis reiciendis aut.', 44084, 9113.26, 1, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(47, 5, 'odit', 'Molestiae dolor sed dolorum doloremque. Saepe amet dolore est qui. Omnis fugit qui et eum. Aperiam doloribus sapiente soluta repudiandae.', 25297, 963.04, 1, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(48, 5, 'minus', 'Provident architecto itaque maiores id non et est. Consequatur est nihil temporibus voluptatibus esse porro. Ea ducimus laborum id velit dolorem odio voluptas tenetur.', 93830, 6528.23, 0, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(49, 5, 'labore', 'Corrupti magni ut ipsa culpa totam voluptatum. Qui quo aut iusto ut. Perferendis quam necessitatibus magni sit.', 35692, 4204.61, 0, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(50, 5, 'maxime', 'Fugit vero incidunt quia corporis non voluptas cumque. Sed aut et dolores voluptatem. Minima cum qui necessitatibus. Consequuntur voluptatem qui sed placeat.', 3081, 9480.49, 1, '2022-03-09 16:50:10', '2022-03-09 16:50:10'),
(51, 1, 'Novo Produto', 'Testando inserção de novo produto!!!', 500, 200.00, 1, '2022-03-09 20:02:12', '2022-03-09 20:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_fornecedor_id_foreign` (`fornecedor_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
