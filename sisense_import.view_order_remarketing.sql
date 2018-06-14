select id_order, signup_type, order_status, if(ip is null,'NA',ip) as IP, if(isp is null, 'Other', isp) as ISP, date(order_date) as daykey, id_ad, o.id_brand,login_name, o. id_affiliate,

(CASE device_type
WHEN 'desktop' THEN 'desktop'
WHEN 'mobile' THEN 'mobile'
WHEN 'tablet' THEN 'mobile'
ELSE 'NA' 
END ) as device_type,

(
CASE 
	When super_partner_id=130 then 'NA'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='0' AND di.brand_id  NOT IN (40,41) AND id_ad  NOT IN ('R2OU3050','R2OU3010','R2OU3060M','R2OU3060W') THEN 'EM00'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='0' AND di.brand_id =40 THEN 'YSAM_EM00'
WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='2' AND di.brand_id =40 THEN 'YSAM_EM02'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='0' AND di.brand_id =41 THEN 'CSRC_EM0'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='1' AND di.brand_id  NOT IN (40,41) THEN 'EM01'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='1' AND di.brand_id =40 THEN 'YSAM_EM01'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='1' AND di.brand_id =41 THEN 'CSRC_EM01'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='2' AND di.brand_id  NOT IN (40,41) THEN 'EM02'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='2' AND di.brand_id =40 THEN 'YSAM_EM02'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='2' AND di.brand_id =41 THEN 'CSRC_EM02'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='3' AND di.brand_id  NOT IN (40,41) THEN 'EM03'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='3' AND di.brand_id =40 THEN 'YSAM_EM03'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='3' AND di.brand_id =41 THEN 'CSRC_EM03'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='4' AND di.brand_id  NOT IN (40,41) THEN 'EM04'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='4' AND di.brand_id =40 THEN 'YSAM_EM04'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='4' AND di.brand_id =41 THEN 'CSRC_EM04'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='5' AND di.brand_id  NOT IN (40,41) THEN 'EM05' 
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='5' AND di.brand_id =40 THEN 'YSAM_EM05'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='5' AND di.brand_id =41 THEN 'CSRC_EM05'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='6' THEN 'EM06'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='7' THEN 'EM07'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='8' THEN 'EM08'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='9' THEN 'EM09'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='10' THEN 'EM10'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='11' THEN 'EM11'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='12' THEN 'EM12'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='13' THEN 'EM13'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='14' THEN 'EM14'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='15' THEN 'EM15'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='16' THEN 'EM16'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='17' THEN 'EM17'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='18' THEN 'EM18'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='19' THEN 'EM19'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='20' THEN 'EM20'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='21' THEN 'EM21'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='22' THEN 'EM22'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='23' THEN 'EM23'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='24' THEN 'EM24'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='25' THEN 'EM25'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='26' THEN 'EM26'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='27' THEN 'EM27'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='28' THEN 'EM28'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='29' THEN 'EM29'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='30' THEN 'EM30'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='31' THEN 'EM31'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='32' THEN 'EM32'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='33' THEN 'EM33'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='34' THEN 'EM34'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='35' THEN 'EM35'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='36' THEN 'EM36'
			WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='37' THEN 'EM37'
            WHEN super_partner_id  = 131 AND id_ad = 'R2OU3050' AND id_affiliate ='0' THEN 'R2 EM00'
            WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='1' THEN 'R2 EM01'
            WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='2' THEN 'R2 EM02'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='3' THEN 'R2 EM03'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='4' THEN 'R2 EM04'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='5' THEN 'R2 EM05'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='6' THEN 'R2 EM06'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='7' THEN 'R2 EM07'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='8' THEN 'R2 EM08'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='9' THEN 'R2 EM09'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='10' THEN 'R2 EM10'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='11' THEN 'R2 EM11'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='12' THEN 'R2 EM12'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='13' THEN 'R2 EM13'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='14' THEN 'R2 EM14'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='15' THEN 'R2 EM15'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='16' THEN 'R2 EM16'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='17' THEN 'R2 EM17'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='18' THEN 'R2 EM18'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3010' AND id_affiliate ='19' THEN 'R2 EM19'
			WHEN super_partner_id  = 131 AND id_ad = 'R2OU3060M' THEN 'R2 Monthly Email'
            WHEN super_partner_id  = 131 AND id_ad = 'R2OU3060W' THEN 'R2 Weekly Email'
  	WHEN id_ad = 'YSAMW0'  and id_affiliate like '%w%' THEN concat('YSAM_W', left( id_affiliate,1))
            WHEN id_ad = 'YSAMW0'  THEN 'YSAM_W0'
            WHEN id_ad = 'YSAMW1' THEN 'YSAM_W1'
            WHEN id_ad = 'YSAMW2' THEN 'YSAM_W2'
            WHEN id_ad = 'YSAMW3' THEN 'YSAM_W3'
            WHEN id_ad = 'YSAMW4' THEN 'YSAM_W4'
            WHEN id_ad = 'YSAMW5' THEN 'YSAM_W5'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='REMA' THEN 'Monthly_Email'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='REMB' THEN 'Monthly_Email'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='REWA' THEN 'Weekly_Email'
            WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate ='REWB' THEN 'Weekly_Email'
             WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate like 'RE%' THEN id_affiliate
	   WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate like 'GM%' THEN id_affiliate
           WHEN super_partner_id  IN (130, 131, 132) AND (id_affiliate like '%A' or id_affiliate like '%B') AND di.brand_id =40 THEN concat('YSAM_EM' , if(length(id_affiliate)=3, left(id_affiliate,2), concat('0', left(id_affiliate,1))))
WHEN super_partner_id  IN (130, 131, 132) AND (id_affiliate like '%A' or id_affiliate like '%B') AND di.brand_id =30 THEN concat('R2 EM' , if(length(id_affiliate)=3, left(id_affiliate,2), concat('0', left(id_affiliate,1))))
WHEN super_partner_id  IN (130, 131, 132) AND (id_affiliate like '%A' or id_affiliate like '%B' or  id_affiliate like '%C') THEN concat('EM' , if(length(id_affiliate)=3, left(id_affiliate,2), concat('0', left(id_affiliate,1))))
            ELSE 'NA'
END	
) as emai_message, hour(order_date) as hour,
(case
WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate like '%A' THEN 'Control A'
WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate like '%B' THEN 'Challenger B' 
WHEN super_partner_id  IN (130, 131, 132) AND id_affiliate like '%C' THEN 'Challenger C' 
Else 'Other'

end) as split_test_type

from  ((((nic_billing.order o join main.tbl_customer c on o.id_customer=c.customer_id and o.id_order>9600000 and c.test_account=0 )
left join nic_common.View_Dimension_Alpha di on o.id_ad=di.ad_id)
left join nic_common.contacts co on c.brand_id=co.id_brand and c.login_name=co.email)
left join nic_content.email_domain_to_isp d on co.domain=d.domain)
left join nic_reporting.ips_by_brand brand  on co.created between  brand.start_date and brand. end_date and co.id_brand=brand.id_brand
