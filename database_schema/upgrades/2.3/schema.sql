

DROP TABLE IF EXISTS `saved_reports`;
CREATE TABLE `saved_reports` (
 `saved_report_id` mediumint(8) unsigned NOT NULL auto_increment,
 `report_name` varchar(50),
 `user_id` mediumint(8) unsigned NOT NULL,
 `date_created` datetime NOT NULL,
 `report_details` varchar(500) NOT NULL,
  PRIMARY KEY (`saved_report_id`),
  FOREIGN KEY (`user_id`)
	REFERENCES `users`(`user_id`)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

insert into dbversion values('2.3', now());