

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `slogan` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `category` VARCHAR(50) NULL DEFAULT NULL,
  `default_price` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `Features`;

CREATE TABLE `Features` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `features` VARCHAR(50) NULL DEFAULT NULL,
  `value` VARCHAR(50) NULL DEFAULT NULL,
  `id_Products` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `Styles`;

CREATE TABLE `Styles` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `original_price` INTEGER NULL DEFAULT NULL,
  `sale_price` INTEGER NULL DEFAULT NULL,
  `default?` bit NULL DEFAULT NULL,
  `id_Products` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `thumbnail_url` VARCHAR(1000) NULL DEFAULT NULL,
  `url` VARCHAR(1000) NULL DEFAULT NULL,
  `id_Products` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `SKUs`;

CREATE TABLE `SKUs` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `quantity` INTEGER NULL DEFAULT NULL,
  `size` VARCHAR(25) NULL DEFAULT NULL,
  `id_Products` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `Related`;

CREATE TABLE `Related` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `related` INTEGER NULL DEFAULT NULL,
  `id_Products` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `Features` ADD FOREIGN KEY (id_Products) REFERENCES `Products` (`id`);
ALTER TABLE `Styles` ADD FOREIGN KEY (id_Products) REFERENCES `Products` (`id`);
ALTER TABLE `photos` ADD FOREIGN KEY (id_Products) REFERENCES `Products` (`id`);
ALTER TABLE `SKUs` ADD FOREIGN KEY (id_Products) REFERENCES `Products` (`id`);
ALTER TABLE `Related` ADD FOREIGN KEY (id_Products) REFERENCES `Products` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `SKUs` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Related` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Products` (`id`,`name`,`slogan`,`description`,`category`,`default_price`) VALUES
-- ('','','','','','');
-- INSERT INTO `Features` (`id`,`features`,`value`,`id_Products`) VALUES
-- ('','','','');
-- INSERT INTO `Styles` (`id`,`name`,`original_price`,`sale_price`,`default?`,`id_Products`) VALUES
-- ('','','','','','');
-- INSERT INTO `photos` (`id`,`thumbnail_url`,`url`,`id_Products`) VALUES
-- ('','','','');
-- INSERT INTO `SKUs` (`id`,`quantity`,`size`,`id_Products`) VALUES
-- ('','','','');
-- INSERT INTO `Related` (`id`,`related`,`id_Products`) VALUES
-- ('','','');

