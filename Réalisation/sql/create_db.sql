-- --------------------------------------------------------
-- Host :                       127.0.0.1
-- Server Version:
-- Server OS:
-- HeidiSQL Version:
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export database's structure for dishcc
CREATE DATABASE IF NOT EXISTS `dishcc`
/*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `dishcc`;
SET default_storage_engine=InnoDB;
ALTER DATABASE dishcc CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- Export table's structure of dishcc. category
CREATE TABLE IF NOT EXISTS `category` (
  `id` tinyint unsigned AUTO_INCREMENT NOT NULL,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Export table's structure of dishcc. dish
CREATE TABLE IF NOT EXISTS `dish` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `ni` varchar(32) NOT NULL,
  `name` varchar(256) NOT NULL,
  `category` tinyint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `nperson` tinyint unsigned NOT NULL,
  `tpreparation` time NOT NULL,
  `tcooking` time NOT NULL,
  `difficulty` tinyint NOT NULL,
  `recipe` varchar(4000) NOT NULL,
  `author` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`ni`)
);

-- Export table's structure of dishcc. dish_ingredient
CREATE TABLE IF NOT EXISTS `dish_ingredient` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `grams` float unsigned NOT NULL,
  `dish` varchar(32) NOT NULL,
  `ingredient` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
);

-- Export table's structure of dishcc. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `name` varchar(256) NOT NULL,
  `caloriesPer100g` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
);

-- Export table's structure of dishcc. result
CREATE TABLE IF NOT EXISTS `result` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `ni` varchar(32) NOT NULL,
  `calories` float unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int unsigned NOT NULL,
  `result` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`ni`)
);

-- Export table's structure of dishcc. result_ingredient
CREATE TABLE IF NOT EXISTS `result_ingredient` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `grams` float unsigned NOT NULL,
  `ingredient` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
);

-- Export table's structure of dishcc. type
CREATE TABLE IF NOT EXISTS `type` (
  `id` tinyint unsigned AUTO_INCREMENT NOT NULL,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
);

-- Export table's structure of dishcc. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(8000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`email`)
);

ALTER TABLE `dish`
ADD FOREIGN KEY (`category`) REFERENCES `category`(`id`);
ALTER TABLE `dish`
ADD FOREIGN KEY (`type`) REFERENCES `type`(`id`);
ALTER TABLE `dish`
ADD FOREIGN KEY (`author`) REFERENCES `user`(`id`);

ALTER TABLE `dish_ingredient`
ADD FOREIGN KEY (`dish`) REFERENCES `dish`(`ni`);
ALTER TABLE `dish_ingredient`
ADD FOREIGN KEY (`ingredient`) REFERENCES `ingredient`(`id`);

ALTER TABLE `result`
ADD FOREIGN KEY (`user`) REFERENCES `user`(`id`);

ALTER TABLE `result_ingredient`
ADD FOREIGN KEY (`ingredient`) REFERENCES `ingredient`(`id`);

INSERT INTO ingredient (`name`, `caloriesPer100g`)
VALUES
('Alfalfa, sprouted', 23),
('Almond', 609.2),
('Amaranth leaves', 30.5),
('Amaranth seed, Black', 356.1),
('Anise seeds', 153.3),
('Apple', 52),
('Apricot', 48),
('Apricot, dried', 31.5),
('Arecanut dried', 350.6),
('Artichoke', 53),
('Asafoetida', 331.5),
('Ash gourd', 17.4),
('Asparagus', 20),
('Avocado', 144.3),
('Bajra', 347.9),
('Bamboo shoot, tender', 16.2),
('Banana', 110.6),
('Barley', 315.7),
('Basil seeds', 22),
('Beef steak, fried', 235),
('Beef, chops', 139.8),
('Beet greens', 34.6),
('Beetroot', 35.6),
('Bengal gram, dal', 329.1),
('Bengal gram, whole', 287),
('Bitter gourd', 20.7),
('Black cumin (Kalonji)', 345),
('Black gram whole', 291.3),
('Blackberries', 43),
('Blackcurrants', 54.2),
('Blueberries', 57),
('Bottle gourd', 10.9),
('Brinjal', 25.3),
('Broad beans', 29.3),
('Broccoli', 34),
('Brussels sprouts', 44.2),
('Bulgar wheat', 341.7),
('Butter', 717),
('Butternut squash', 45),
('Cabbage Chinese', 17.9),
('Cabbage, green', 21.5),
('Cabbage, red', 31),
('Capsicum', 16.2),
('Cardamom, green', 255),
('Carrots', 41),
('Cashew nut', 582.6),
('Cat fish', 108.9),
('Catla', 94.1),
('Cauliflower', 22.9),
('Cauliflower leaves', 35.4),
('Celery', 14),
('Celery stalk', 16.4),
('Chard', 19),
('Cheddar cheese', 408),
('Cheese', 264.5),
('Cherimoya', 75),
('Cherries red', 59.7),
('Chia seeds', 486),
('Chicken breast, cooked', 175),
('Chicken, breast, skinless', 168.2),
('Chicken, leg, skinless', 383.6),
('Chicken, liver', 123.8),
('Chicken, thigh, skinless', 199.8),
('Cho-Cho-Marrow', 18.8),
('Clam', 58),
('Cloves', 186.6),
('Cluster beans', 40.1),
('Coconut', 354),
('Coconut dry', 624),
('Coconut fresh', 408.9),
('Coconut water', 15.2),
('Colocasia leaves, green', 43.4),
('Coriander seeds', 268.8),
('Corn', 86),
('Cow pea, brown', 320.2),
('Cow pea, white', 320.2),
('Crab', 81.9),
('Cranberries', 46),
('Cucumbers', 15),
('Cumin seeds', 304.4),
('Curry leaves', 63.5),
('Custard apple', 98.9),
('Dates, dry', 320.2),
('Dates, medjool', 277),
('Drumstick leaves', 67.3),
('Duck, cooked', 336),
('Egg white, raw', 44.6),
('Egg, whole, raw', 134.7),
('Egg, yolk, raw', 296.8),
('Eggplant', 25),
('Fenugreek leaves', 34.4),
('Fenugreek seeds', 234.9),
('Fig', 81.5),
('Flax seeds', 534),
('French beans', 24.3),
('Garlic', 123.8),
('Ghee', 920),
('Gingelly seeds', 507.6),
('Ginger, fresh', 54.9),
('Goat', 188),
('Goose, roasted', 304),
('Grapefruit', 42),
('Grapes', 60.7),
('Green beans', 31),
('Green chillies', 45.6),
('Green gram dal', 325.7),
('Green gram, whole', 293.7),
('Green pepper', 20),
('Ground beef, cooked', 260),
('Ground nut', 520),
('Guava', 32.2),
('Horse gram, whole', 329.5),
('Jack fruit', 72.1),
('Jaggery cane', 353.7),
('Jowar', 334.1),
('Kale', 35),
('Khoa', 315.9),
('Kidney beans, canned', 135),
('Kiwi fruit', 58),
('Knol-Khol', 16),
('Kovai', 19.1),
('Ladies finger', 27.4),
('Lamb, cooked', 265),
('Lemon', 29),
('Lentil dal', 322.4),
('Lentils, canned', 165),
('Lettuce', 21.7),
('Lima beans, canned', 122),
('Linseeds', 443.8),
('Litchi', 53.7),
('Lobster', 89.6),
('Mackerel', 101),
('Mango', 41.8),
('Matha', 92.9),
('Melon, honeydew', 36),
('Milk, semi-skimmed', 50),
('Milk, whole', 60),
('Milk, whole, buffalo', 107.3),
('Milk, whole, cow', 72.8),
('Mint leaves', 37),
('Mushrooms', 22),
('Musk melon', 23.1),
('Mustard leaves', 30.3),
('Navy beans, canned', 113),
('Nectarine', 39),
('Nutmeg', 463.6),
('Oil', 900),
('Okra, fried', 217),
('Olives, black', 116),
('Onions', 40),
('Orange', 37.2),
('Oyster', 60.2),
('Paneer', 257.8),
('Papaya', 23.9),
('Parsley', 72.8),
('Parwar', 24.1),
('Peach', 40.1),
('Pear', 37.5),
('Peas, dry', 303.2),
('Peas, green', 81),
('Peas,fresh', 81.2),
('Pepper, black', 217.4),
('Pickles', 12),
('Pine seed', 594.1),
('Pineapple', 43),
('Pistachio nuts', 539.4),
('Plantain stem', 39.4),
('Plum', 56.8),
('Pomegranate', 54.7),
('Pomfret', 123),
('Poppy seeds', 422.5),
('Pork belly, cooked', 518),
('Pork, chops', 178.7),
('Pork, shoulder', 237.3),
('Potato brown', 69.7),
('Pumpkin', 23.1),
('Quinoa', 328.3),
('Rabbit, cooked', 172),
('Radish leaves', 26.05),
('Radish,white', 32.2),
('Ragi', 320.7),
('Raisins, black', 305.6),
('Rajma, red', 299.2),
('Raspberries', 52),
('Red chillies', 236.6),
('Red gram, dal', 330.7),
('Red gram, whole', 273.9),
('Refined flour', 351.8),
('Rhubarb', 21),
('Rice (Brown)', 353.7),
('Rice flakes', 353.7),
('Rice Parboiled', 351.5),
('Rice Raw milled', 356.3),
('Rice, white, cooked', 96),
('Ridge gourd', 13.1),
('Roast chicken', 223),
('Salmon', 172.3),
('Sapota', 73.3),
('Sardine', 152.2),
('Shark', 95.1),
('Sheep, chops', 118.5),
('Sheep, shoulder', 200.7),
('Silver fish', 132.6),
('Snake gourd', 12.4),
('Soy milk', 54),
('Soya bean, brown', 381.4),
('Spinach', 24.3),
('Spinach, cooked', 27),
('Squid', 80),
('Strawberries', 32),
('Sugarcane, juice', 57.8),
('Sunflower seeds', 586.2),
('Sweet lime', 27.2),
('Sweet potato,brown', 108.9),
('Tapioca', 79.8),
('Tater tots', 236),
('Tiger prawns', 65.2),
('Tofu', 76),
('Tomato', 18),
('Tuna', 112.3),
('Turkey, light meat, roasted', 169),
('Turmeric powder', 280.5),
('Turnip greens', 132),
('Veal, roasted', 229),
('Venison, roasted', 190),
('Walnut', 671),
('Watermelon', 20.3),
('Wheat flour', 320.2),
('Wheat semolina', 333.6),
('Wheat vermicelli', 332.6),
('Wheat whole', 321.9),
('Wood apple', 78.1),
('Yam', 84.3),
('Yogurt, plain, low-fat', 63),
('Zucchini', 21),
('Zucchini, green', 20);

INSERT INTO category (`name`)
VALUES
('Basic'),
('Healthy'),
('Junk food'),
('Pastry/Bakery'),
('Salad'),
('Vegan'),
('Vegetarian'),
('Other...');

INSERT INTO type (`name`)
VALUES
('Aperitif'),
('Starter'),
('Main course'),
('Dessert'),
('Other');

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
