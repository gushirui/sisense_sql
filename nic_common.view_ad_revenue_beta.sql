
select `View_Credit_Alpha`.`date` AS `date`,
`View_Credit_Alpha`.`Partner` AS `partner`,
`View_Credit_Alpha`.`Offer` AS `offer`,
`View_Credit_Alpha`.`Revenue` AS `revenue`
 from `nic_common`.`View_Credit_Alpha`

 union all
 select `nic_reporting`.`portal_credit_info_infoma_summary`.`Date` AS `date`,'Informa' AS `partner`,
'Mortgage' AS `offer`,
`nic_reporting`.`portal_credit_info_infoma_summary`.`Price` AS `revenue` 
from `nic_reporting`.`portal_credit_info_infoma_summary` 

