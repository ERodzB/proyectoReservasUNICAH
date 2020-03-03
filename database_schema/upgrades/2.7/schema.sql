# noinspection SqlNoDataSourceInspectionForFile

ALTER TABLE `users` CHANGE `credit_count` `credit_count` DECIMAL(7,2) NULL DEFAULT '0';
UPDATE users SET credit_count = 0 WHERE credit_count IS NULL;

ALTER TABLE `resources`
  CHANGE COLUMN `sort_order` `sort_order` SMALLINT UNSIGNED;

DROP TABLE IF EXISTS `payment_configuration`;
CREATE TABLE `payment_configuration` (
  `payment_configuration_id` TINYINT UNSIGNED       NOT NULL AUTO_INCREMENT,
  `credit_cost`              DECIMAL(7, 2) UNSIGNED NOT NULL,
  `credit_currency`          VARCHAR(10)            NOT NULL,
  PRIMARY KEY (`payment_configuration_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8;

DROP TABLE IF EXISTS `payment_gateway_settings`;
CREATE TABLE `payment_gateway_settings` (
  `gateway_type`  VARCHAR(255)  NOT NULL,
  `setting_name`  VARCHAR(255)  NOT NULL,
  `setting_value` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`gateway_type`, `setting_name`)
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8;

DROP TABLE IF EXISTS `credit_log`;
CREATE TABLE `credit_log` (
  `credit_log_id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`  MEDIUMINT(8) UNSIGNED NOT NULL,
  `original_credit_count`  DECIMAL(7, 2),
  `credit_count`  DECIMAL(7, 2),
  `credit_note` VARCHAR(1000),
  `date_created` DATETIME NOT NULL,
  PRIMARY KEY (`credit_log_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8;



DROP TABLE IF EXISTS `refund_transaction_log`;
CREATE TABLE `refund_transaction_log` (
  `refund_transaction_log_id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_transaction_log_id`  INT(10) UNSIGNED NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `transaction_id` VARCHAR(50),
  `total_refund_amount`  DECIMAL(7, 2) NOT NULL,
  `payment_refund_amount`  DECIMAL(7, 2),
  `fee_refund_amount`  DECIMAL(7, 2),
  `transaction_href` VARCHAR(500),
  `date_created` DATETIME NOT NULL,
  `gateway_date_created` VARCHAR(25) NOT NULL,
  `refund_response` TEXT,
  PRIMARY KEY (`refund_transaction_log_id`),
  FOREIGN KEY (`payment_transaction_log_id`)
  REFERENCES `payment_transaction_log` (`payment_transaction_log_id`)
  ON DELETE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8;



DROP TABLE IF EXISTS `terms_of_service`;
CREATE TABLE `terms_of_service` (
  `terms_of_service_id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `terms_text` TEXT,
  `terms_url` VARCHAR(255),
  `terms_file` VARCHAR(50),
  `applicability` VARCHAR(50),
  `date_created` DATETIME NOT NULL,
  PRIMARY KEY (`terms_of_service_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8;

DROP TABLE IF EXISTS `resource_images`;
CREATE TABLE `resource_images` (
  `resource_image_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `resource_id` SMALLINT UNSIGNED NOT NULL,
  `image_name` VARCHAR(50),
  PRIMARY KEY (`resource_image_id`),
  FOREIGN KEY (`resource_id`)
 	REFERENCES `resources` (`resource_id`)
 	ON UPDATE CASCADE ON DELETE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8;


DROP TABLE IF EXISTS `custom_time_blocks`;
CREATE TABLE `custom_time_blocks` (
  `custom_time_block_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `layout_id` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`custom_time_block_id`),
  FOREIGN KEY (`layout_id`)
 	REFERENCES `layouts` (`layout_id`)
 	ON UPDATE CASCADE ON DELETE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8;
  
insert into dbversion values('2.7', now());
insert into payment_configuration (credit_cost, credit_currency) values(0, 'USD');