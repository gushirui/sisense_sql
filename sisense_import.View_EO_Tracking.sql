select date(created) as DayKey, original_adid as ad_id, device, id_contact, source, bot ,email, signup_date, signup_flag,
(CASE
WHEN ISP IS NOT NULL THEN ISP
ELSE 'Other'
END  ) ISP,if(ip is not null, ip, 'NA') ip,brand.id_brand, created,hour(created) as hour,email_quality
from (nic_common.contacts c left join nic_content.email_domain_to_isp d on c.domain=d.domain )
left join nic_reporting.ips_by_brand brand  on c.created between  brand.start_date and brand. end_date and c.id_brand=brand.id_brand
WHERE
status NOT IN ('DEDUPE','DEDUPE_MMBR','FBL_OR_COMPLAINT')
