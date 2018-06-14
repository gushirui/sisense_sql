select c.*, id_csr_user, unburdend as unburdend_lookup,role as role_lookup, min(t.time) as start_time ,max(t.time) as end_time, 
(time_to_Sec(max(t.time))-time_to_sec(min(t.time)))/60 as time_spread_min,

(LEFT(paid_time,2))*3600+substring_index(substring_index(paid_time,':',-2),':',1)*60+right(paid_time,2) as paid_time_sec,
1.1002* unburdend as unberdend_with_tax,
(LEFT(paid_time,2))+substring_index(substring_index(paid_time,':',-2),':',1)/60+right(paid_time,2)/3600 as hrs_incl_overtime,
GREATEST((LEFT(paid_time,2))+substring_index(substring_index(paid_time,':',-2),':',1)/60+right(paid_time,2)/3600-8,0)*unburdend*1.5+least((LEFT(paid_time,2))+substring_index(substring_index(paid_time,':',-2),':',1)/60+right(paid_time,2)/3600,8) *unburdend 
as cost


from nic_reporting.five9_agent_daily_state_summary c left join nic_reporting.five9_user u on c.agent=u.last_name  
join nic_reporting.five9_agent_state_time t on c.agent=t.agent and t.date=c.date and state in ('login','logout') and t.time<>'00:00:00'
group by c.agent, c.date
