DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `add_category` (IN `title` VARCHAR(255) CHARSET utf8)  NO SQL
INSERT INTO `categories` (`id`, `title`) VALUES (NULL, title)$$

CREATE DEFINER=`root`@`%` PROCEDURE `add_comment` (IN `text` TEXT CHARSET utf8, IN `articleId` INT(11), IN `authorId` INT(11))  NO SQL
INSERT INTO `comments` (`id`, `text`, `articleId`, `authorId`) VALUES (NULL, text, articleId, authorId)$$

CREATE DEFINER=`root`@`%` PROCEDURE `add_new_article` (IN `title` VARCHAR(255) CHARSET utf8, IN `categoryId` INT(11), IN `authorId` INT(11), IN `subtitle` VARCHAR(255) CHARSET utf8, IN `image` VARCHAR(255) CHARSET utf8, IN `text` TEXT CHARSET utf8, IN `description` TEXT CHARSET utf8, IN `publickId` INT(11))  NO SQL
INSERT INTO `articles` (`id`, `title`, `subtitle`, `image`, `text`, `pubDate`, `views`, `description`, `categoryId`, `publickId`, `authorId`) VALUES (NULL, title, subtitle, image, text, CURRENT_TIMESTAMP, '0', description, categoryId, publickId, authorId)$$

CREATE DEFINER=`root`@`%` PROCEDURE `add_new_public` (IN `title` VARCHAR(255) CHARSET utf8, IN `authorId` INT(255))  NO SQL
INSERT INTO `public` (`id`, `name`, `authorId`) VALUES (NULL, title, authorId)$$

CREATE DEFINER=`root`@`%` PROCEDURE `add_new_user` (IN `name` VARCHAR(255) CHARSET utf8, IN `email` VARCHAR(255) CHARSET utf8, IN `password` VARCHAR(255) CHARSET utf8, IN `surname` VARCHAR(255) CHARSET utf8, IN `nickname` VARCHAR(255) CHARSET utf8, IN `avatar` VARCHAR(255) CHARSET utf8)  NO SQL
INSERT INTO `users` (`id`, `name`, `surname`, `nickname`, `email`, `password`, `avatar`) VALUES (NULL, name, surname, nickname, email, password, avatar)$$

CREATE DEFINER=`root`@`%` PROCEDURE `delete_article` (IN `id` INT(11))  NO SQL
DELETE FROM `articles` WHERE `articles`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `delete_comment` (IN `id` INT(11))  NO SQL
DELETE FROM `comments` WHERE `comments`.`id` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `get_user_data` ()  NO SQL
SELECT * FROM `users`$$

CREATE DEFINER=`root`@`%` PROCEDURE `most_popular_articles` ()  NO SQL
SELECT * FROM `articles` ORDER BY `articles`.`views` DESC LIMIT 5$$

CREATE DEFINER=`root`@`%` PROCEDURE `search_by_category` (IN `categoryId` INT(11))  NO SQL
SELECT * FROM `articles` WHERE `articles`.`categoryId` = categoryId$$

CREATE DEFINER=`root`@`%` PROCEDURE `subscribe_user_to_public` (IN `userId` INT(11), IN `publickId` INT(11))  NO SQL
INSERT INTO `users_public` (`userId`, `publickId`) VALUES (userId, publickId)$$

CREATE DEFINER=`root`@`%` PROCEDURE `unsubscribe_user_from_public` (IN `publickId` INT(11), IN `userId` INT(11))  NO SQL
DELETE FROM `users_public` WHERE `users_public`.`userId` = userId AND `users_public`.`publickId` = publickId$$

CREATE DEFINER=`root`@`%` PROCEDURE `get_all_id_of_followers` (IN `publickId` INT(11))  NO SQL
SELECT `userId` FROM `users_public` WHERE `users_public`.`publickId` = publickId$$

DELIMITER ;

-- --------------------------------------------------------