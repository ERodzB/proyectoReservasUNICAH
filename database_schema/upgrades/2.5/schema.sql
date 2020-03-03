ALTER TABLE `custom_attributes` ADD COLUMN `entity_id` mediumint(8) unsigned;


DROP TABLE IF EXISTS `resource_group_assignment`;

DROP TABLE IF EXISTS `resource_groups`;
CREATE TABLE `resource_groups` (
 `resource_group_id` mediumint(8) unsigned NOT NULL auto_increment,
 `resource_group_name` VARCHAR(75),
 `parent_id` mediumint(8) unsigned,
  PRIMARY KEY (`resource_group_id`),
  INDEX `resource_groups_parent_id` (`parent_id`),
  FOREIGN KEY (`parent_id`)
	REFERENCES `resource_groups`(`resource_group_id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;


ALTER TABLE `resources` ADD FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types`(`resource_type_id`) ON DELETE SET NULL;

DROP TABLE IF EXISTS `resource_group_assignment`;
CREATE TABLE `resource_group_assignment` (
 `resource_group_id` mediumint(8) unsigned NOT NULL,
 `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`resource_group_id`, `resource_id`),
  INDEX `resource_group_assignment_resource_id` (`resource_id`),
  INDEX `resource_group_assignment_resource_group_id` (`resource_group_id`),
  FOREIGN KEY (`resource_group_id`)
		REFERENCES resource_groups(`resource_group_id`)
		ON DELETE CASCADE,
	FOREIGN KEY (`resource_id`)
		REFERENCES `resources`(`resource_id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

DROP TABLE IF EXISTS `blackout_series_resources`;
CREATE TABLE `blackout_series_resources` (
 `blackout_series_id` int unsigned NOT NULL,
 `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`blackout_series_id`, `resource_id`),
	FOREIGN KEY (`blackout_series_id`)
		REFERENCES `blackout_series`(`blackout_series_id`)
		ON DELETE CASCADE,
	FOREIGN KEY (`resource_id`)
		REFERENCES `resources`(`resource_id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;



DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
 `user_preferences_id` int unsigned NOT NULL auto_increment,
 `user_id` mediumint(8) unsigned NOT NULL,
 `name` varchar(100) NOT NULL,
 `value` varchar(100),
 PRIMARY KEY (`user_preferences_id`),
 INDEX (`user_id`),
 FOREIGN KEY (`user_id`)
    REFERENCES `users`(`user_id`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

ALTER TABLE `accessories` MODIFY COLUMN `accessory_quantity` smallint(5) unsigned;
ALTER TABLE `reservation_accessories` MODIFY COLUMN `quantity` smallint(5) unsigned;




insert into dbversion values('2.5', now());