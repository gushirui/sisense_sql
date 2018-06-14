select lead_date, date(lead_date) as daykey_lead, lead_submission_counter,lead_type,submission_status, lead.id_lead, lead.lead_capture_location as location,id_ad, lp.name as Lead_Partner_Name, 
id_customer, lead_status, lead.capture_location, lead.ad_location,zip,first_name,last_name,email,phone, 
form_type,lead_submission.id_lead_partner_campaign, lpc.name as campaign_name,device_type,uuid 

from (lead left join lead_submission on  lead.id_lead=lead_submission.id_lead) left join lead_partner lp on  lead_submission.id_lead_partner=lp.id_lead_partner left join lead_partner_campaigns lpc on lead_submission.id_lead_partner_campaign=lpc.id_lead_partner_campaigns
