
select  c.customer_id, time_to_sec(timediff(min(l.created),order_Date))/3600 as hourdiff, count(l2.created) count_fail, count(l.created) as session_count,
(case 
when time_to_sec(timediff(min(l.created),order_Date))<=24*3600 then 1
when time_to_sec(timediff(min(l.created),order_Date))<=48*3600 then 2
when count(l.created)>0 then 3
when count(l.created)=0 and count(l2.created)>0  then 4
else 0
end) as timely_login


from( nic_billing.`order` o join main.tbl_customer c on id_customer=customer_id and test_account=0)
left join main.tbl_member_event_login l on c.customer_id=l.customer_id and l.event_type='login'
left join main.tbl_member_event_login l2 on c.customer_id=l2.customer_id and l2.event_type='fail'

group by c.customer_id
