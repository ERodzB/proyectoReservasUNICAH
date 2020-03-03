DROP TABLE IF EXISTS `dbversion`;
CREATE TABLE `dbversion` (
 `version_number` DOUBLE unsigned NOT NULL DEFAULT 0,
 `version_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

insert into dbversion values('2.1', now());