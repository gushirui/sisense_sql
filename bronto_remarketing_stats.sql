select br.id,br.bronto_subaccount, concat(br.bronto_subaccount,br.bronto_start_date) subaccount_and_date, num_sends,num_deliveries, num_bounces, uniq_opens, num_opens, uniq_clicks, num_clicks, num_unsubscribes_by_prefs, num_unsubscribes_by_complaint, email_Action_device_type, bronto_start_date, 
bronto_end_date, br.bronto_delivery_name,

(case 
when br.id=5188257 or br.bronto_subaccount='''' or br.bronto_subaccount='max=11453071360 for co'  or br.bronto_subaccount='Nations Info Corp'  or br.bronto_subaccount='rent2owninc2' or br.bronto_subaccount is null then 0
else brand.id_brand
end
) as id_brand,

(CASE email_action_device_type
when null then 'NA'
else email_action_device_type
END ) as device_type, 

(CASE 
WHEN br.isp IS NOT NULL THEN br.isp
ELSE 'Other'
END ) as ISP, 

if(brand.ip is null,'NA',ip) as ip,
(CASE 
WHEN br.bronto_delivery_name IN ('EM00A','EM00B','EM00C') THEN 'EM00'
WHEN br.bronto_delivery_name like 'EM%' THEN left(br.bronto_delivery_name,4)
WHEN br.bronto_delivery_name IN ('R2 EM00A','R2 EM00B') THEN 'R2 EM00'
WHEN br.bronto_delivery_name IN ('R2 EM01A','R2 EM01B') THEN 'R2 EM01'
WHEN br.bronto_delivery_name IN ('R2 EM02A','R2 EM02B') THEN 'R2 EM02'
WHEN br.bronto_delivery_name IN ('R2 EM03A','R2 EM03B') THEN 'R2 EM03'
WHEN br.bronto_delivery_name IN ('R2 EM04A','R2 EM04B') THEN 'R2 EM04'
WHEN br.bronto_delivery_name IN ('R2 EM05A','R2 EM05B') THEN 'R2 EM05'
WHEN br.bronto_delivery_name IN ('R2 EM06A','R2 EM06B') THEN 'R2 EM06'
WHEN br.bronto_delivery_name IN ('R2 EM07A','R2 EM07B') THEN 'R2 EM07'
WHEN br.bronto_delivery_name IN ('R2 EM08A','R2 EM08B') THEN 'R2 EM08'
WHEN br.bronto_delivery_name IN ('R2 EM09A','R2 EM09B') THEN 'R2 EM09'
WHEN br.bronto_delivery_name IN ('R2 EM10A','R2 EM10B') THEN 'R2 EM10'
WHEN br.bronto_delivery_name IN ('R2 EM11A','R2 EM11B') THEN 'R2 EM11'
WHEN br.bronto_delivery_name IN ('R2 EM12A','R2 EM12B') THEN 'R2 EM12'
WHEN br.bronto_delivery_name IN ('R2 EM13A','R2 EM13B') THEN 'R2 EM13'
WHEN br.bronto_delivery_name IN ('R2 EM14A','R2 EM14B') THEN 'R2 EM14'
WHEN br.bronto_delivery_name IN ('R2 EM15A','R2 EM15B') THEN 'R2 EM15'
WHEN br.bronto_delivery_name IN ('R2 EM16A','R2 EM16B') THEN 'R2 EM16'
WHEN br.bronto_delivery_name IN ('R2 EM17A','R2 EM17B') THEN 'R2 EM17'
WHEN br.bronto_delivery_name IN ('R2 EM18A','R2 EM18B') THEN 'R2 EM18'
WHEN br.bronto_delivery_name IN ('R2 EM19A','R2 EM19B') THEN 'R2 EM19'
WHEN br.bronto_delivery_name IN ('YSAM_EM00A','YSAM_EM00B') THEN 'YSAM_EM00'
WHEN br.bronto_delivery_name IN ('YSAM_EM01A','YSAM_EM01B') THEN 'YSAM_EM01'
WHEN br.bronto_delivery_name IN ('YSAM_EM02A','YSAM_EM02B') THEN 'YSAM_EM02'
WHEN br.bronto_delivery_name IN ('YSAM_EM03A','YSAM_EM03B') THEN 'YSAM_EM03'
WHEN br.bronto_delivery_name IN ('YSAM_EM04A','YSAM_EM04B') THEN 'YSAM_EM04'
WHEN br.bronto_delivery_name IN ('YSAM_EM05A','YSAM_EM05B') THEN 'YSAM_EM05'
WHEN br.bronto_delivery_name IN ('CSRC_EM00A','CSRC_EM00B','CSRC_EM00') THEN 'CSRC_EM0'
WHEN br.bronto_delivery_name IN ('CSRC_EM01A','CSRC_EM01B','CSRC_EM01') THEN 'CSRC_EM01'
WHEN br.bronto_delivery_name IN ('CSRC_EM02A','CSRC_EM02B','CSRC_EM02') THEN 'CSRC_EM02'
WHEN br.bronto_delivery_name IN ('CSRC_EM03A','CSRC_EM03B','CSRC_EM03') THEN 'CSRC_EM03'
WHEN br.bronto_delivery_name IN ('CSRC_EM04A','CSRC_EM04B','CSRC_EM04') THEN 'CSRC_EM04'
WHEN br.bronto_delivery_name IN ('CSRC_EM05A','CSRC_EM05B','CSRC_EM05') THEN 'CSRC_EM05'
WHEN br.bronto_delivery_name IN ('YSAM_W0A','YSAM_W0B','YSAM_W0') THEN 'YSAM_W0'
WHEN br.bronto_delivery_name IN ('YSAM_W1A','YSAM_W1B','YSAM_W1') THEN 'YSAM_W1'
WHEN br.bronto_delivery_name IN ('YSAM_W2A','YSAM_W2B','YSAM_W2') THEN 'YSAM_W2'
WHEN br.bronto_delivery_name IN ('YSAM_W3A','YSAM_W3B','YSAM_W3') THEN 'YSAM_W3'
WHEN br.bronto_delivery_name IN ('YSAM_W4A','YSAM_W4B','YSAM_W4') THEN 'YSAM_W4'
WHEN br.bronto_delivery_name IN ('YSAM_W5A','YSAM_W5B','YSAM_W5') THEN 'YSAM_W5'
WHEN br.bronto_delivery_name IN ('CSRC_W0A','CSRC_W0B','CSRC_W0') THEN 'CSRC_W0'
WHEN br.bronto_delivery_name IN ('CSRC_W1A','CSRC_W1B','CSRC_W1') THEN 'CSRC_W1'
WHEN br.bronto_delivery_name IN ('CSRC_W2A','CSRC_W2B','CSRC_W2') THEN 'CSRC_W2'
WHEN br.bronto_delivery_name IN ('CSRC_W3A','CSRC_W3B','CSRC_W3') THEN 'CSRC_W3'
WHEN br.bronto_delivery_name IN ('CSRC_W4A','CSRC_W4B','CSRC_W4') THEN 'CSRC_W4'
WHEN br.bronto_delivery_name IN ('CSRC_W5A','CSRC_W5B','CSRC_W5') THEN 'CSRC_W5'
WHEN br.bronto_delivery_name IN ('Monthly Email A','Monthly Email B') THEN 'Monthly_Email'
WHEN br.bronto_delivery_name IN ('Weekly Email A','Weekly Email B') THEN 'Weekly_Email'
WHEN br.bronto_delivery_name IN ('R2 Monthly Email A','R2 Monthly Email B') THEN 'R2 Monthly Email'
WHEN br.bronto_delivery_name IN ('R2 Weekly Email A','R2 Weekly Email B') THEN 'R2 Weekly Email'
WHEN br.bronto_delivery_name = '1A Modern Template' THEN '1_Modern_Template'
WHEN br.bronto_delivery_name = '1 Text Mostly' THEN '1_Text_Mostly'
WHEN br.bronto_delivery_name = '1 Newsletter' THEN '1_Newsletter'
WHEN br.bronto_delivery_name = '1 Newsletter A' THEN '1_Newsletter_A'
WHEN br.bronto_delivery_name = '1 Newsletter B' THEN '1_Newsletter_B'
WHEN br.bronto_delivery_name LIKE 'GRTO Cancellation Confirmation' THEN 'GRTO Cancellation Confirmation'
WHEN br.bronto_delivery_name = '1 WB60 30' THEN '1 WB60 30'
WHEN br.bronto_delivery_name = '1 WB80 30' THEN '1 WB80 30'
WHEN br.bronto_delivery_name = '1 WB90 30' THEN '1 WB90 30'
WHEN br.bronto_delivery_name = '1 WB60 90' THEN '1 WB60 90'
WHEN br.bronto_delivery_name = '1 WB80 90' THEN '1 WB80 90'
WHEN br.bronto_delivery_name = '1 WB90 90' THEN '1 WB90 90'
when br.bronto_delivery_name like 'RE%' then bronto_delivery_name
When br.bronto_delivery_name like '%EQX%' then bronto_delivery_name
When br.bronto_delivery_name like 'GM%' then bronto_delivery_name
When br.bronto_delivery_name like 'FDR%' or  br.bronto_delivery_name like  'Genesis%' or   br.bronto_delivery_name like  'Equifax%' then bronto_delivery_name
When br.bronto_delivery_name like 'Trio%' then 'Trio'
when (br.bronto_delivery_name like 'GEM%') then left(br.bronto_delivery_name,5)
when (br.bronto_delivery_name like 'HSLGM%') then left(br.bronto_delivery_name,7) 
ELSE 'NA'
END 
) as email_message,
(
case
WHEN br.bronto_delivery_name like '%A' THEN 'Control A'
WHEN br.bronto_delivery_name like '%B' or br.bronto_delivery_name like '%LexLaw' THEN 'Challenger B'
WHEN br.bronto_delivery_name like '%C' THEN 'Challenger C'
Else 'Other'
end
) as split_test_type,bronto_campaign_name


from db03_reporting.bronto_remarketing_stats br 
left join nic_reporting.ips_by_brand brand   on br.bronto_subaccount=brand.subaccount_name  and br.bronto_start_date between start_date and end_date
