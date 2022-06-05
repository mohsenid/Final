-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 04, 2022 at 07:46 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Catégorie 1'),
(2, 'Catégorie 2'),
(3, 'Catégorie 3');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `post_id`, `status`) VALUES
(1, 'Daniel', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. ', 1, 0),
(2, 'Mohammad', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. ', 1, 1),
(3, 'Timothé', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. ', 1, 0),
(4, 'Arron', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. ', 3, 1),
(5, 'Thomas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. ', 1, 0),
(6, 'Mathias', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. ', 1, 1),
(7, 'Youmna', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. ', 1, 1),
(8, 'Mammar', 'très bien', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `category_id`, `body`, `author`, `image`) VALUES
(1, 'Lorem ipsum 1', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. Pellentesque augue lectus, bibendum non tellus et, finibus porttitor purus. Aenean auctor eget ante eget tristique. Duis dapibus tempus elit id rhoncus. Nunc sed urna eget odio pellentesque dictum sed eu purus. Suspendisse purus felis, vehicula sit amet convallis sed, semper nec quam. Sed rutrum sem sit amet lacus egestas accumsan. Fusce bibendum, lacus ac dignissim feugiat, felis massa varius leo, eu bibendum mauris dolor nec nisi.\r\n\r\nMaecenas vehicula id orci eget convallis. Aenean eu velit eu turpis congue scelerisque ac nec mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla a pulvinar ante, nec accumsan metus. Donec vulputate facilisis ipsum, in porta lacus dapibus non. Praesent tempus sapien non dolor consectetur, ut imperdiet velit consequat. Fusce suscipit, nulla at ullamcorper mollis, massa orci tincidunt nisi, eu molestie lorem sem ac dolor. Aenean finibus libero quis ipsum mattis ullamcorper. Vivamus ex neque, ultricies at maximus in, imperdiet at velit. Pellentesque tortor purus, bibendum vitae ornare eget, feugiat imperdiet lacus. Cras pulvinar massa tortor, sed tristique leo faucibus a. Vestibulum varius dignissim congue. Maecenas a tortor eu quam elementum interdum eu sed orci. Duis eu ullamcorper justo.', 'Daniel Mohseni', '1.jpg'),
(2, 'Lorem ipsum 2', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. Pellentesque augue lectus, bibendum non tellus et, finibus porttitor purus. Aenean auctor eget ante eget tristique. Duis dapibus tempus elit id rhoncus. Nunc sed urna eget odio pellentesque dictum sed eu purus. Suspendisse purus felis, vehicula sit amet convallis sed, semper nec quam. Sed rutrum sem sit amet lacus egestas accumsan. Fusce bibendum, lacus ac dignissim feugiat, felis massa varius leo, eu bibendum mauris dolor nec nisi.\r\n\r\nMaecenas vehicula id orci eget convallis. Aenean eu velit eu turpis congue scelerisque ac nec mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla a pulvinar ante, nec accumsan metus. Donec vulputate facilisis ipsum, in porta lacus dapibus non. Praesent tempus sapien non dolor consectetur, ut imperdiet velit consequat. Fusce suscipit, nulla at ullamcorper mollis, massa orci tincidunt nisi, eu molestie lorem sem ac dolor. Aenean finibus libero quis ipsum mattis ullamcorper. Vivamus ex neque, ultricies at maximus in, imperdiet at velit. Pellentesque tortor purus, bibendum vitae ornare eget, feugiat imperdiet lacus. Cras pulvinar massa tortor, sed tristique leo faucibus a. Vestibulum varius dignissim congue. Maecenas a tortor eu quam elementum interdum eu sed orci. Duis eu ullamcorper justo.', 'Louis ', '2.jpg'),
(3, 'Lorem ipsum 3', 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. Pellentesque augue lectus, bibendum non tellus et, finibus porttitor purus. Aenean auctor eget ante eget tristique. Duis dapibus tempus elit id rhoncus. Nunc sed urna eget odio pellentesque dictum sed eu purus. Suspendisse purus felis, vehicula sit amet convallis sed, semper nec quam. Sed rutrum sem sit amet lacus egestas accumsan. Fusce bibendum, lacus ac dignissim feugiat, felis massa varius leo, eu bibendum mauris dolor nec nisi.\r\n\r\nMaecenas vehicula id orci eget convallis. Aenean eu velit eu turpis congue scelerisque ac nec mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla a pulvinar ante, nec accumsan metus. Donec vulputate facilisis ipsum, in porta lacus dapibus non. Praesent tempus sapien non dolor consectetur, ut imperdiet velit consequat. Fusce suscipit, nulla at ullamcorper mollis, massa orci tincidunt nisi, eu molestie lorem sem ac dolor. Aenean finibus libero quis ipsum mattis ullamcorper. Vivamus ex neque, ultricies at maximus in, imperdiet at velit. Pellentesque tortor purus, bibendum vitae ornare eget, feugiat imperdiet lacus. Cras pulvinar massa tortor, sed tristique leo faucibus a. Vestibulum varius dignissim congue. Maecenas a tortor eu quam elementum interdum eu sed orci. Duis eu ullamcorper justo.', 'Zach Galifianakis ', '3.jpg'),
(4, 'Lorem ipsum 4', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. Pellentesque augue lectus, bibendum non tellus et, finibus porttitor purus. Aenean auctor eget ante eget tristique. Duis dapibus tempus elit id rhoncus. Nunc sed urna eget odio pellentesque dictum sed eu purus. Suspendisse purus felis, vehicula sit amet convallis sed, semper nec quam. Sed rutrum sem sit amet lacus egestas accumsan. Fusce bibendum, lacus ac dignissim feugiat, felis massa varius leo, eu bibendum mauris dolor nec nisi.\r\n\r\nMaecenas vehicula id orci eget convallis. Aenean eu velit eu turpis congue scelerisque ac nec mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla a pulvinar ante, nec accumsan metus. Donec vulputate facilisis ipsum, in porta lacus dapibus non. Praesent tempus sapien non dolor consectetur, ut imperdiet velit consequat. Fusce suscipit, nulla at ullamcorper mollis, massa orci tincidunt nisi, eu molestie lorem sem ac dolor. Aenean finibus libero quis ipsum mattis ullamcorper. Vivamus ex neque, ultricies at maximus in, imperdiet at velit. Pellentesque tortor purus, bibendum vitae ornare eget, feugiat imperdiet lacus. Cras pulvinar massa tortor, sed tristique leo faucibus a. Vestibulum varius dignissim congue. Maecenas a tortor eu quam elementum interdum eu sed orci. Duis eu ullamcorper justo.', 'Henry Francheski', '4.jpg'),
(5, 'Lorem ipsum 5', 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. Pellentesque augue lectus, bibendum non tellus et, finibus porttitor purus. Aenean auctor eget ante eget tristique. Duis dapibus tempus elit id rhoncus. Nunc sed urna eget odio pellentesque dictum sed eu purus. Suspendisse purus felis, vehicula sit amet convallis sed, semper nec quam. Sed rutrum sem sit amet lacus egestas accumsan. Fusce bibendum, lacus ac dignissim feugiat, felis massa varius leo, eu bibendum mauris dolor nec nisi.\r\n\r\nMaecenas vehicula id orci eget convallis. Aenean eu velit eu turpis congue scelerisque ac nec mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla a pulvinar ante, nec accumsan metus. Donec vulputate facilisis ipsum, in porta lacus dapibus non. Praesent tempus sapien non dolor consectetur, ut imperdiet velit consequat. Fusce suscipit, nulla at ullamcorper mollis, massa orci tincidunt nisi, eu molestie lorem sem ac dolor. Aenean finibus libero quis ipsum mattis ullamcorper. Vivamus ex neque, ultricies at maximus in, imperdiet at velit. Pellentesque tortor purus, bibendum vitae ornare eget, feugiat imperdiet lacus. Cras pulvinar massa tortor, sed tristique leo faucibus a. Vestibulum varius dignissim congue. Maecenas a tortor eu quam elementum interdum eu sed orci. Duis eu ullamcorper justo.', 'David Larson', '5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts_slider`
--

CREATE TABLE `posts_slider` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_slider`
--

INSERT INTO `posts_slider` (`id`, `post_id`, `active`) VALUES
(1, 1, 1),
(2, 2, 0),
(3, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `name`, `email`) VALUES
(1, 'sadegh', 'sadegh@gmail.com'),
(2, 'ali', 'ali@gmail.com'),
(3, 'Mohammad MOHSENI', 'mami.maxim@gmail.come');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(3, 'mami.maxim@gmail.com', '$2y$10$UkC3/Jlsy66KssInUOpB5ug4W403s38P5CEVBXcrD/3Bchw35AVda'),
(5, 'exemple@email.com', '$2y$10$NHPsthKieOOxcBVTyn6SeOxIEE3cuwI9p0shqtjVrxsKZs4guc8MG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `posts_slider`
--
ALTER TABLE `posts_slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts_slider`
--
ALTER TABLE `posts_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_post` FOREIGN KEY (`id`) REFERENCES `posts` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts_slider`
--
ALTER TABLE `posts_slider`
  ADD CONSTRAINT `posts_slider_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
