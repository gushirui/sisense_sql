
select c.date, c.time,  call_id, id_csr_user,  skill, campaign, call_type, agent, disposition, ani, cost, queue_wait_time, park_time, role as role_lookup,

abandoned, handle_time, manual_time, ivr_path, speed_of_answer, dnis, is_wdo, is_weo, is_open, week, 

If(call_type='Queue 

Callback',ani,dnis) as dnis_one, (CASE agent
            WHEN 'emmah-lex' THEN 'EmmaH'
            WHEN 'sergioa-c2c' THEN 'SergioA'
            WHEN 'rickyp-c2c' THEN 'RickyP'
            WHEN '[None]' THEN 'None'
            ELSE agent
End) as agent_match,

(CASE If(call_type='Queue Callback',ani,dnis)
            WHEN '8554521950' THEN 'HLCSRC2CREG'
            WHEN '8554537950' THEN 'HCSRC2CSRP'
            WHEN '8663960287' THEN 'RBOCSRC2CDESK'
			WHEN '8664032615' THEN 'GRTOCSRC2CSRP'
			WHEN '8669550842' THEN 'YRTOCSRC2CDESK'
			WHEN '8669556147' THEN 'YRTOCSRC2CDESK2'
			WHEN '8775699770' THEN 'GRTOCSRC2CDESK'
			WHEN '8886721307' THEN 'GRTOCSRC2CREG'
			WHEN '8553417569' THEN 'GRTOCSRC2CDESK2'
            WHEN '8553434774' THEN 'RTOCSRC2CVID'
			WHEN '8555799327' THEN 'GRTOCSRC2CDEXT'
			WHEN '8555799328' THEN 'GRTOCSRC2CDEXT2'
			WHEN '8555799324' THEN 'GRTOCSRC2CPRST'
			WHEN '8555799325' THEN 'HCSRC2CPRST'
            ELSE ' '
End) as tsr_adid,

(CASE 
WHEN ivr_path LIKE '%Order_Number_Repeat_Prompt%' OR ivr_path LIKE '%Confirm_Cancelled_Repeat_Prompt%' THEN 1
ELSE 0
END ) as flag_ivr_cancel,
(CASE 
WHEN ivr_path LIKE '%HoldPrompt1%' THEN 'Speak with Agent'
WHEN ivr_path  LIKE '%ResetVariableOverflow:Enable_Overflow_Check%' AND campaign='HUDforeclosed' THEN 'Check Account Status'
WHEN ivr_path  LIKE '%ResetVariableOverflow_Status%' AND campaign<>'HUDforeclosed' THEN 'Check Account Status'
WHEN ivr_path  LIKE '%ResetVariableOverflow_Cancel:Enable_Overflow_Check%' THEN 'Cancel'
WHEN ivr_path  LIKE '%Afterhours CancelOrSupport%' THEN 'After Hours'
ELSE 'N/A'
END 
) as flag_button,
(CASE agent
            WHEN '[None]' THEN 'No agent'
            ELSE ' '
End) as flag_no_agent,

If(Right(ivr_path,9)='SupportVM',1,0) as 'Flag Force Message',

(LEFT(bill_time_rounded,2))*60+substring_index(substring_index(bill_time_rounded,':',-2),':',1)+right(bill_time_rounded,2)/60 as bill_time_rounded_min,

(LEFT(talk_time,2))*60+substring_index(substring_index(talk_time,':',-2),':',1)+right(talk_time,2)/60 as talk_time_min,

(LEFT(call_time,2))*60+substring_index(substring_index(call_time,':',-2),':',1)+right(call_time,2)/60 as call_time_min,

(LEFT(after_call_work_time,2))*60+substring_index(substring_index(after_call_work_time,':',-2),':',1)+right(after_call_work_time,2)/60 as after_call_work_time_min,

(LEFT(hold_time,2))*60+substring_index(substring_index(hold_time,':',-2),':',1)+right(hold_time,2)/60 as hold_time_min,

(LEFT(ring_time,2))*60+substring_index(substring_index(ring_time,':',-2),':',1)+right(ring_time,2)/60 as ring_time_min,

(LEFT(ivr_time,2))*3600+substring_index(substring_index(ivr_time,':',-2),':',1)*60+right(ivr_time,2) as ivr_time_sec,

(LEFT(handle_time,2))*60+substring_index(substring_index(handle_time,':',-2),':',1)+right(handle_time,2)/60 as handle_time_min,

(case campaign
WHEN 'RS-REP' THEN 'REP' 
WHEN 'RealtyStore' THEN 'RS' 
WHEN 'RS-PRO' THEN 'RS' 
WHEN 'RealtyStore--Sales' THEN 'RS'
WHEN 'UltraForeclosure' THEN 'UF'
WHEN 'HUDforeclosed' THEN 'HF'
WHEN 'FF Sales' THEN 'FF' 
WHEN 'ForeclosureFortunes' THEN 'FF'
WHEN 'BuyDistressed' THEN 'BD'
WHEN 'RentToOwn' THEN 'RTO'
WHEN 'RTOO Sales' THEN 'RTO' 
WHEN 'RentBeforeOwning' THEN 'RBO' 
WHEN 'R2OI' THEN 'R2OI'
WHEN 'iRentToOwn' THEN 'iRTO'
WHEN 'HiddenListings' THEN 'HL'
WHEN 'iRealtyEdge' THEN 'IRE'
WHEN 'MyRealtyEdge' THEN 'MRE'
WHEN 'YourRent2Own' THEN 'YRTO'
WHEN 'GetRentToOwn' THEN 'GRTO'
WHEN 'GetForeclosedHome' THEN 'GFH'
WHEN 'WhereForeclosures' THEN 'WF'
WHEN 'HousingList.com' THEN 'HSL'
WHEN 'YSAM' THEN 'YSAM'
WHEN 'CreditScoreReportCard' THEN 'CSRC'
ELSE ' ' 
END
) as 'Flag Inbound Calls',
 
concat(ani,' ',campaign) as ani_plus_campaign,

left(time,2) as time_hour,

(case
WHEN ivr_path LIKE '%CancelVM' THEN 0
ELSE 1
end) as Flag_queue_time,

If(Right(call_id,1)='1',1,0) as flag_called_forQA,

(LEFT(call_time,2))*3600+ substring_index(substring_index(call_time,':',-2),':',1)*60+ right(call_time,2) as call_time_sec,
(LEFT(speed_of_answer,2))*3600+ substring_index(substring_index(speed_of_answer,':',-2),':',1)*60+ right(speed_of_answer,2) as speed_of_answer_sec,

(LEFT(queue_wait_time,2))*3600+ substring_index(substring_index(queue_wait_time,':',-2),':',1)*60+ right(queue_wait_time,2) as queue_wait_time_sec,
brand_key


from (nic_reporting.five9_call_log c left join nic_reporting.five9_user u on c.agent=u.last_name)
left join nic_reporting.five9_campaign on campaign=five9_campaign
