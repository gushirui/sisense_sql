select oder.id_order,customer_id, item.id_order_item, offer.id_offer, invoice.id_invoice,  

member.id_membership, processor_txn_id,

refund_csr_id,id_discount_csr, created_csr_id, id_cancellation_csr,
oder.id_brand, oder.id_ad, oder.id_affiliate, 
date(invoice_date) as invoice_date, date(member.discount_datetime) as discount_datetime, 
order_Date, date(order_Date) as DayKey, cb.chargeback_date, member.date_cancelled as 

member_cancel_date,payment_date, 

order_status, oder.signup_type, membership_status, invoice_status, p.vertical_type,  refund_type, 

cancellation_type, payment_type, invoice_type,  device_type,
offer.description,cancellation_reason, oder.referring_url, login_name, c.first_name,c.last_name,

refund_amount, payment_amount, offer_amount, cb.amount as CB_amount, item.quantity, 
If(id_ad LIKE ('REPTSR1'),'phone','email') as rep_commission_type,
if(datediff(date_add(now(),interval -1 hour), Date_add(order_date, Interval trial_duration day))

>0,1,0) as Static_1st_Bill,
if(payment_date<DATE_ADD(invoice_Date, INTERVAL 1 HOUR),1,0) as  flag_invoice_Datequal,
if(datediff(date_started,date_cancelled)=0,1,0) as flag_same_day_cancel,
if(date_cancelled<Date_add(order_date, Interval trial_duration day),1,0) as flag_trial_cancel,

(CASE refund_type
            WHEN '1' THEN 'Inbound Refund'
            WHEN '2' THEN 'Email Refund'
			WHEN '3' THEN 'Outbound Refund'
            WHEN '4' THEN 'Admin Refund'
            WHEN '5' THEN 'Refund App'
			WHEN '6' THEN 'Data Quality Refund'
 			WHEN '7' THEN 'Avoid Dispute Refund'
			WHEN '8' THEN 'BBB Complaint Refund'
                WHEN '9' THEN 'RS Pro'
	WHEN '10' THEN 'Chat Refund'
            ELSE ' '
End) as refund_type_desc, invoice.retry_count 

from nic_billing.`order` oder  join main.tbl_customer c  on customer_id=oder.id_customer and 

test_account=0
left join main.tbl_partner p on oder.id_partner=p.partner_id
left join nic_billing.order_item item on  item.id_order= oder.id_order 
left join nic_offer.offer offer on offer.id_offer=item.id_offer 
left join nic_billing.membership member on member.id_membership=item.id_membership
left join nic_billing.invoice invoice  on item.id_order_item=invoice.id_order_item 
left join main.tbl_chargeback_raw cb on invoice.id_invoice=cb.invoice_id and cb.invoice_id is not null
