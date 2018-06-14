select id_invoice, item.id_order, item.id_order_item, item.id_offer, item.id_membership, 

invoice_date, invoice_type, invoice_status, payment_amount,retry_count, trial_duration, 

offer_amount,created_csr_id,

oder.order_status, oder.signup_type, order_Date, device_type, id_ad, customer_id, payment_date,chargeback_date,

verification_status, id_affiliate, lifetime_unique_visitor,id_x, membership_status, passed_thru, 

cancellation_type, cancellation_reason, oder.id_partner,oder.id_cascaded_from_ad,



if(datediff(date_add(now(),interval -1 hour), Date_add(order_date, Interval trial_duration day))>0,1,0) as Static_1st_Bill, 
date_started, date_cancelled, date_expiration,


if(payment_date<DATE_ADD(invoice_Date, INTERVAL 1 HOUR),1,0) as  flag_invoice_Datequal,
if(datediff(date_started,date_cancelled)=0,1,0) as flag_same_day_cancel,
if(date_cancelled<Date_add(order_date, Interval trial_duration day),1,0) as flag_trial_cancel,
if(Verification_last_attempted < DATE_ADD(DATE_ADD(date(order_date),interval 1 day),interval 3 

hour),1,0) as flag_verification_static, referring_url,discounted_price,offer.description,

(CASE 
WHEN datediff(member.date_cancelled, order_Date) =0 THEN '0'
WHEN datediff(member.date_cancelled, order_Date) >0 AND datediff(member.date_cancelled, order_Date) <=30 THEN '030'
WHEN datediff(member.date_cancelled, order_Date) >30 AND datediff(member.date_cancelled, order_Date) <=60 THEN '060'
WHEN datediff(member.date_cancelled, order_Date) >60 AND datediff(member.date_cancelled, order_Date) <=90 THEN '090'
WHEN datediff(member.date_cancelled, order_Date) >90 AND datediff(member.date_cancelled, order_Date) <=120 THEN '120'
WHEN datediff(member.date_cancelled, order_Date) >120 AND datediff(member.date_cancelled, order_Date) <=150 THEN '150'
WHEN datediff(member.date_cancelled, order_Date) >150 AND datediff(member.date_cancelled, order_Date) <=180 THEN '180'
ELSE 'Greater than 180'
END
) as inteval_cancel_order,

datediff(chargeback_date,payment_date) as pay_cb_daydiff,
datediff(chargeback_date,order_Date) as signup_cb_day,

(CASE 
WHEN datediff(chargeback_date,payment_date) =0 THEN '0'
WHEN datediff(chargeback_date,payment_date) >0 AND datediff(chargeback_date,payment_date) <=30 THEN '030'
WHEN datediff(chargeback_date,payment_date) >30 AND datediff(chargeback_date,payment_date) <=60 THEN '060'
WHEN datediff(chargeback_date,payment_date) >60 AND datediff(chargeback_date,payment_date) <=90 THEN '090'
WHEN datediff(chargeback_date,payment_date) >90 AND datediff(chargeback_date,payment_date) <=120 THEN '120'
WHEN datediff(chargeback_date,payment_date) >120 AND datediff(chargeback_date,payment_date) <=150 THEN '150'
WHEN datediff(chargeback_date,payment_date) >150 AND datediff(chargeback_date,payment_date) <=180 THEN '180'
WHEN datediff(chargeback_date,payment_date) >180 THEN 'Greater than 180'
else null
END) as pay_cb_interval, sequence,enrollment_status,oder.id_first_ad as id_first_ad, rp.expire_ordinal_indicator as max_retry_counts, (case when invoice.retry_count<rp.expire_ordinal_indicator then 0 else 1 end) as flag_retry_done


from ((((((nic_billing.invoice invoice right join nic_billing.order_item item on 

item.id_order_item=invoice.id_order_item)
	left join nic_offer.offer offer on offer.id_offer=item.id_offer)
	right join nic_billing.`order` oder on  item.id_order= oder.id_order )
	left join nic_billing.membership member on member.id_membership=item.id_membership )
	left join main.tbl_customer  on customer_id=oder.id_customer)
	left join main.tbl_customer_profile profile on customer_id=profile.id_customer) left join nic_billing.billing_policy bp on  offer.id_billing_policy=bp.id_billing_policy left join nic_billing.retry_policy rp on bp.id_retry_policy=rp.id_retry_policy

where  (invoice_date>='2014-01-01' or order_date>='2014-01-01') and test_account=0
