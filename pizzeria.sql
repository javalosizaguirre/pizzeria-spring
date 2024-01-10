/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.30 : Database - pizzeria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pizzeria`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id_customer` varchar(15) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(60) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `UK_dwk6cx0afu8bs9o4t536v1j5v` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customer` */

insert  into `customer`(`id_customer`,`address`,`email`,`name`,`phone_number`) values 
('110410415','Ap #720-1833 Curabitur Av.','mercedesbalorclub@hotmail.com','Mercedes Balor','(688) 944-6619'),
('182120056','Ap #268-1749 Id St.','heymanboss@hotmail.com','Matthew Heyman','(185) 738-9267'),
('192758012','705-6031 Aliquam Street','wangwatson@icloud.com','Drew Watson','(362) 881-5943'),
('262132898','241-9121 Fames St.','stonecold@icloud.com','Karl Austin','(559) 596-3381'),
('303265780','Ap #206-5413 Vivamus St.','figthowens@platzi.com','Shelton Owens','(821) 880-6661'),
('363677933','Ap #937-4424 Vestibulum. Street','bianca0402@platzi.com','Bianca Neal','(792) 406-8858'),
('394022487','P.O. Box 341, 7572 Odio Rd.','beckytwobelts@icloud.com','Becky Alford','(559) 398-7689'),
('474771564','925-3988 Purus. St.','johareigns@outlook.com','Johanna Reigns','(801) 370-4041'),
('531254932','461-4278 Dignissim Av.','wyattplay@google.co','Clarke Wyatt','(443) 263-8555'),
('617684636','Ap #732-8087 Dui. Road','aleximorgan@hotmail.com','Alexa Morgan','(830) 212-2247'),
('644337170','Ap #308-4700 Mollis Av.','elgenerico@outlook.com','Sami Rollins','(508) 518-2967'),
('762085429','177-1125 Consequat Ave','codyforchamp@google.com','Cody Rollins','(740) 271-3631'),
('782668115','Ap #696-6846 Ullamcorper Avenue','amityrogers@outlook.com','Charlotte Riddle','(744) 344-7768'),
('863264988','P.O. Box 136, 4534 Lacinia St.','draketheory@hotmail.com','Drake Theory','(826) 607-2278'),
('885583622','9063 Aliquam, Road','brockalford595@platzi.com','Brock Alford','(732) 218-4844');

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id_item` int NOT NULL,
  `id_order` int NOT NULL,
  `id_pizza` int NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `quantity` decimal(2,1) NOT NULL,
  PRIMARY KEY (`id_item`,`id_order`),
  KEY `FKakuoq412rnkuv4k0xsqeam5k0` (`id_order`),
  KEY `FKgy49avjjdhl48p67qplglv6sr` (`id_pizza`),
  CONSTRAINT `FKakuoq412rnkuv4k0xsqeam5k0` FOREIGN KEY (`id_order`) REFERENCES `pizza_order` (`id_order`),
  CONSTRAINT `FKgy49avjjdhl48p67qplglv6sr` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_item` */

insert  into `order_item`(`id_item`,`id_order`,`id_pizza`,`price`,`quantity`) values 
(1,1,1,23.00,1.0),
(1,2,2,18.50,1.0),
(1,3,3,22.00,1.0),
(1,4,8,42.00,2.0),
(1,5,10,11.00,0.5),
(1,6,11,23.00,1.0),
(2,1,4,19.95,1.0),
(2,2,6,24.00,1.0),
(2,5,12,9.50,0.5),
(3,2,7,19.50,1.0);

/*Table structure for table `pizza` */

DROP TABLE IF EXISTS `pizza`;

CREATE TABLE `pizza` (
  `id_pizza` int NOT NULL AUTO_INCREMENT,
  `available` tinyint NOT NULL,
  `description` varchar(150) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `vegan` tinyint DEFAULT NULL,
  `vegetarian` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_pizza`),
  UNIQUE KEY `UK_6n1plxa8aecur40e4q2vpcrps` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pizza` */

insert  into `pizza`(`id_pizza`,`available`,`description`,`name`,`price`,`vegan`,`vegetarian`) values 
(1,1,'Pepperoni, Homemade Tomato Sauce & Mozzarella.','Pepperoni',23.00,0,0),
(2,1,'Fior de Latte, Homemade Tomato Sauce, Extra Virgin Olive Oil & Basil.','Margherita',18.50,0,1),
(3,1,'Fior de Latte, Homemade Tomato Sauce, Extra Virgin Olive Oil & Basil.','Vegan Margherita',22.00,1,1),
(4,1,'Hass Avocado, House Red Sauce, Sundried Tomatoes, Basil & Lemon Zest.','Avocado Festival',19.95,0,1),
(5,0,'Homemade Tomato Sauce, Mozzarella, Pineapple & Ham.','Hawaiian',20.50,0,0),
(6,1,'Portobello Mushrooms, Mozzarella, Parmesan & Goat Cheeses with Alfredo Sauce.','Goat Chesse',24.00,0,0),
(7,1,'Artichokes, Roasted Peppers, Rapini, Sundried Tomatoes, Onion, Shaved Green Bell Peppers & Sunny Seasoning.','Mother Earth',19.99,0,1),
(8,1,'Mild Italian Sausage, Pepperoni, Bacon, Homemade Tomato Sauce & Mozzarella.','Meat Lovers',21.00,0,0),
(9,0,'Marinated Chicken with Cilantro, Red Onions, Gouda, Parmesan & Mozzarella Cheeses.','Marinated BBQ Chicken',20.95,0,0),
(10,1,'Wild mushrooms, Baby Kale, Shiitake Bacon & Lemon Vinaigrette. Soy free.','Truffle Cashew Cream',22.00,1,1),
(11,1,'Beef Chorizo, Sundried Tomatoes, Salsa Verde, Pepper, Jalapeno & pistachios','Rico Mor',23.00,0,0),
(12,1,'Fresh Spinach, Marinated Artichoke Hearts, Garlic, Fior de Latte, Mozzarella & Parmesan.','Spinach Artichoke',18.95,0,1),
(17,1,'Tomate, Mozzarella, Ricotta & Baby Spinach','Popeye',20.99,0,1);

/*Table structure for table `pizza_order` */

DROP TABLE IF EXISTS `pizza_order`;

CREATE TABLE `pizza_order` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `additional_notes` varchar(200) DEFAULT NULL,
  `date` datetime NOT NULL,
  `id_customer` varchar(15) NOT NULL,
  `method` char(1) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `FKnlayechpuwervvwn2ius58ney` (`id_customer`),
  CONSTRAINT `FKnlayechpuwervvwn2ius58ney` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pizza_order` */

insert  into `pizza_order`(`id_order`,`additional_notes`,`date`,`id_customer`,`method`,`total`) values 
(1,'Don\'t be late pls.','2024-01-02 17:59:04','192758012','D',42.95),
(2,NULL,'2024-01-03 17:59:04','474771564','S',62.00),
(3,NULL,'2024-01-04 17:59:04','182120056','C',22.00),
(4,NULL,'2024-01-05 17:59:04','617684636','S',42.00),
(5,'Please bring the jalapeños separately.','2024-01-06 17:59:04','192758012','D',20.50),
(6,NULL,'2024-01-07 17:59:04','782668115','D',23.00);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
