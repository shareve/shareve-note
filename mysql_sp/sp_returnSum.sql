DELIMITER $$

USE `dcf_ft`$$

DROP PROCEDURE IF EXISTS `sp_returnSum`$$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_returnSum`(institutionid VARCHAR(50))
BEGIN
SELECT institution_id, DATE ,SUM( confirm_amount)  return_amount   FROM (
SELECT con.institution_id,  DATE(ra.create_time) AS  DATE ,  ra.confirm_amount 
FROM t_return_application ra
JOIN t_loan_document ld ON ra.loan_document_id = ld.loan_document_id
JOIN  dcf_ft_contract. t_contract con ON ld.applicant_contract_id = con.contract_pkey 
WHERE con.institution_id = institutionid AND con.delete_flag = 0 ) result 
GROUP BY  institution_id , DATE  ; 
END$$

DELIMITER ;