DELIMITER $$

USE `dcf_ft`$$

DROP PROCEDURE IF EXISTS `sp_sumBeLendingCoreCount`$$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_sumBeLendingCoreCount`(institutionid VARCHAR(50))
BEGIN
SELECT app.institution_id, COUNT(1) current_be_lending_core_count FROM ( 
                  SELECT DISTINCT con.sign_customer_id, api.institution_id FROM t_asset_package api  
                  JOIN t_asset_package_loan_application_association al ON api.asset_package_id = al.asset_package_id  
                 JOIN t_loan_application la ON al.loan_application_id = la.loan_application_id  
                  JOIN  dcf_ft_contract.t_contract con ON la.contract_id = con.contract_pkey  
                 WHERE api.asset_package_state = 0 AND api.delete_flag = 0 ) 
				 app WHERE app.institution_id = institutionid GROUP BY app.institution_id;
END$$

DELIMITER ;