DELIMITER $$

USE `dcf_ft`$$

DROP PROCEDURE IF EXISTS `sp_sumCoreCount`$$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_sumCoreCount`(institutionid VARCHAR(50))
BEGIN
SELECT institution_id, COUNT(1) core_count FROM    dcf_ft_contract. t_contract
       WHERE parent_contract_id IS NULL AND institution_id =institutionid AND delete_flag = 0 GROUP BY institution_id ; 
END$$

DELIMITER ;