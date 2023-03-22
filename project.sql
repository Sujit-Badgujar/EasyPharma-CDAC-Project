create user prathmesh@'%' identified by 'welcome123';
create database quickpharma1;
use quickpharma1;
show tables;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema medical_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema medical_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `medical_store` DEFAULT CHARACTER SET utf8 ;
USE `medical_store` ;

-- -----------------------------------------------------
-- Table `medical_store`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_store`.`users` ;
use quickpharma;
desc users;
CREATE TABLE `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `mobile_no` VARCHAR(15) NOT NULL,
  `role` VARCHAR(20) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `isactive` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `mobile_no_UNIQUE` (`mobile_no` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

select * from users;
-- alter table users upadate role set admin;
-- -----------------------------------------------------
-- Table `medical_store`.`product_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_store`.`product_types` ;

CREATE TABLE `product_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(100) NOT NULL,
  `type_thumbnail` VARCHAR(200) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `medical_store`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_store`.`products` ;

CREATE TABLE `products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL,
  `price` DOUBLE NOT NULL,
  `stocks` INT NOT NULL,
  `created_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `product_thumbnail` VARCHAR(200) NULL,
  `product_type_id` INT NOT NULL,
  `manfact_date` TIMESTAMP NULL,
  `expiry_date` TIMESTAMP NULL,

  PRIMARY KEY (`product_id`),
  CONSTRAINT `fk_product_product_type1`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `product_types` (`id`)
   );


-- -----------------------------------------------------
-- Table `medical_store`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_store`.`address` ;

CREATE TABLE `address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `city` VARCHAR(50) NOT NULL,
  `pincode` INT NOT NULL,
  `state` VARCHAR(50) NULL,
  `house_no` INT NULL,
  `user_id` INT NOT NULL,
  `created_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
   );


-- -----------------------------------------------------
-- Table `medical_store`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_store`.`orders` ;

CREATE TABLE `orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_amount` DOUBLE NULL,
  `order_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
`address_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`),
FOREIGN KEY (`address_id`)
    REFERENCES `address` (`address_id`)
);

create table orders (order_id INT PRIMARY KEY AUTO_INCREMENT ,  order_amount DOUBLE ,order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,user_id INT,address_id INT);
alter table orders ADD FOREIGN KEY (address_id) REFERENCES address (address_id);


alter table orders add column address_id int ;
ALTER TABLE orders 
ADD FOREIGN KEY (address_id) REFERENCES address (address_id);

-- -------------
-- -------------
DROP TABLE  `order_items` ;
/*CREATE TABLE `order_items`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
`product_id` INT NOT NULL,
`quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
FOREIGN KEY (`order_id`)
    REFERENCES `orders` (`order_id`),
FOREIGN KEY (`product_id`)
    REFERENCES `products` (`product_id`)
);*/

CREATE TABLE order_items(
  order_items_id int NOT NULL AUTO_INCREMENT,
  order_id int DEFAULT NULL,
  price double DEFAULT NULL,
  product_id int DEFAULT NULL,
  quantity int DEFAULT NULL,
  PRIMARY KEY (order_items_id),
  FOREIGN KEY (`order_id`)
    REFERENCES `orders` (`order_id`),
FOREIGN KEY (`product_id`)
    REFERENCES `products` (`product_id`)
);

CREATE TABLE order_items(id INT PRIMARY KEY AUTO_INCREMENT,order_id INT,product_id INT,quantity INT);
select * from order_items;

ALTER TABLE order_items
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE order_items
ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

-- -----------------------------------------------------
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table `medical_store`.`cart_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_store`.`cart_item` ;

CREATE TABLE `cart_item` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`cart_id`),
  FOREIGN KEY(product_id) REFERENCES products(product_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id));
  
  select * from cart;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into users(first_name,last_name,email,password,mobile_no,role) values('yogesh','lipane','yogesh@gmail.com','yogesh','9561839257','user');

insert into users(first_name,last_name,email,password,mobile_no,role)  values('prathmesh','sangar','prathmesh@gmail.com','prathmesh','8007063006','admin');

create table contactus(id int PRIMARY KEY AUTO_INCREMENT, name varchar(50), email varchar(50), subject varchar(50), message TEXT);

DROP TABLE IF EXISTS `medical_store`.`order_items` ;
/*CREATE TABLE IF NOT EXISTS `medical_store`.`order_items`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
`product_id` INT NOT NULL,
`quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
FOREIGN KEY (`order_id`)
    REFERENCES `medical_store`.`orders` (`order_id`),
FOREIGN KEY (`product_id`)
    REFERENCES `medical_store`.`products` (`product_id`)
);*/


/*CREATE TABLE order_items(id INT PRIMARY KEY AUTO_INCREMENT,order_id INT,product_id INT,quantity INT);*/

CREATE TABLE `order_items` (
  `order_items_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_items_id`)
);

CREATE TABLE cart(
  cart_id int NOT NULL AUTO_INCREMENT,
  quantity int DEFAULT NULL,
  product_id int DEFAULT NULL,
user_id int DEFAULT NULL,
  created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cart_id),
  KEY user_id (user_id),
  KEY product_id (product_id),
  CONSTRAINT cart_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT cart_ibfk_2 FOREIGN KEY (product_id) REFERENCES products (product_id)
);


use medical_store;
select * from products;
desc products;

select * from products;

select * from users;


update users set role='user' where user_id=1;

create database quickpharma;




