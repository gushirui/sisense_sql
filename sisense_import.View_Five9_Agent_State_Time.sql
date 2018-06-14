select c.*,id_csr_user, unburdend as unburdend_lookup,role as role_lookup,left(time,2) time_hour, date_format(time, '%H:%i:%s') as time_string, 
concat((agent_state_sec div 3600)+hour(time)+if(((agent_state_sec mod 3600) div 60)+minute(time) +(case when (agent_state_sec mod 60 +second(time))>59 then 1 else 0 end )>59,1,0),':',((agent_state_sec mod 3600) div 60)+minute(time) +(case when (agent_state_sec mod 60 +second(time))>59 then 1 else 0 end ),':',
(case when (agent_state_sec mod 60 +second(time))>59 then  (agent_state_sec mod 60) +second(time)-60 else (agent_state_sec mod 60) +second(time) end ))
as end_state_string


from

nic_reporting.five9_agent_state_time   c left join nic_reporting.five9_user u on c.agent=u.last_name
