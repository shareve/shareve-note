DELIMITER $$

USE `dcf_ft`$$

DROP PROCEDURE IF EXISTS `sp_findAllInstitutions`$$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_findAllInstitutions`(customertype VARCHAR(50))
BEGIN
SELECT * FROM `dcf_ft_customer`.`customer` WHERE customer_type = customertype;
END$$

DELIMITER ;