select `nic_reporting`.`portal_credit_info_myscore_summary`.`Date` AS `date`,'MyScore' AS `Partner`,'Credit' AS `Offer`,`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p2` AS `Device`,`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p3` AS `Location`,`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p4` AS `Creative`,`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p5` AS `Ad_ID`,`nic_reporting`.`portal_credit_info_myscore_summary`.`SubID_p6` AS `YSAM_ID`,`nic_reporting`.`portal_credit_info_myscore_summary`.`CPAtotal` AS `Revenue`,'CPA' AS `Revenue_Type`,`nic_reporting`.`portal_credit_info_myscore_summary`.`Clicks` AS `clicks`,`nic_reporting`.`portal_credit_info_myscore_summary`.`Conversions` AS `conversions` from `nic_reporting`.`portal_credit_info_myscore_summary` 

union all
select `nic_reporting`.`portal_credit_info_fs360_summary`.`Date` AS `date`,'FS360' AS `Partner`,'Credit' AS `Offer`,`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p2` AS `Device`,`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p3` AS `Location`,`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p4` AS `Creative`,`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p5` AS `Ad_ID`,`nic_reporting`.`portal_credit_info_fs360_summary`.`SubID_p6` AS `YSAM_ID`,`nic_reporting`.`portal_credit_info_fs360_summary`.`revenue` AS `Revenue`,'CPA' AS `Revenue_Type`,`nic_reporting`.`portal_credit_info_fs360_summary`.`Clicks` AS `clicks`,`nic_reporting`.`portal_credit_info_fs360_summary`.`Conversions` AS `conversions` from `nic_reporting`.`portal_credit_info_fs360_summary`

 union all
select `nic_reporting`.`portal_credit_info_fs360_summary_new`.`Date` AS `date`,'FS360' AS `Partner`,'Credit' AS `Offer`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p2` AS `Device`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p3` AS `Location`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p4` AS `Creative`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p5` AS `Ad_ID`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`SubID_p6` AS `YSAM_ID`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`revenue` AS `Revenue`,'CPA' AS `Revenue_Type`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`Clicks` AS `clicks`,`nic_reporting`.`portal_credit_info_fs360_summary_new`.`Conversions` AS `conversions` from `nic_reporting`.`portal_credit_info_fs360_summary_new` where (`nic_reporting`.`portal_credit_info_fs360_summary_new`.`Date` between '2016-01-01' and '2016-11-20') 

union all

 select cast(`nic_reporting`.`portal_credit_info_zeta_summary`.`Date` as date) AS `date`,'Zeta' AS `Partner`,'Lead' AS `Offer`,`nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p3` AS `Device`, (case when subid_p1='LP' then subid_p1 else subid_p2 end) AS `Location`,`nic_reporting`.`portal_credit_info_zeta_summary`.`SubID_p4` AS `Creative`, (case when subid_p1='LP' then subid_p2 else subid_p1 end)  AS `Ad_ID`,'' AS `Ysam_ID`,`nic_reporting`.`portal_credit_info_zeta_summary`.`revenue` AS `Revenue`,'CPC' AS `Revenue_Type`,`nic_reporting`.`portal_credit_info_zeta_summary`.`Clicks` AS `Clicks`,`nic_reporting`.`portal_credit_info_zeta_summary`.`Conversions` AS `conversions` from `nic_reporting`.`portal_credit_info_zeta_summary`