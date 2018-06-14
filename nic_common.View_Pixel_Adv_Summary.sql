select (case when id_advertiser=3000 then 'MyScore' when id_advertiser=1003 then 'FS360' end) as Partner, trid_1 as LUVR, 
(case 
  when substring_index(substring_index(id_placement, '_', 2),'_',-1)='D' then 'desktop'
  when substring_index(substring_index(id_placement, '_', 2),'_',-1)='M' then 'mobile'
  else ''
  end)
 as Device, 
substring_index(substring_index(id_placement, '_', 3), '_',-1) as Placement, substring_index(substring_index(id_placement, '_', 5), '_',-1) as ADID, date(created) as daykey,
sum(case when id_pixel_location='lp' then 1 else 0 end ) as Clicks, sum(case when id_pixel_location='cp' then 1 else 0 end) as Conversions,
sum(case when id_pixel_location='lp' then 1 else 0 end )/100+sum(case when id_pixel_location='cp' then 1 else 0 end) as Code,
ceil(sum(case when id_pixel_location='cp' then 1 else 0 end)/100) as Code_1

from nic_reporting.pixel

where (id_advertiser='3000' or id_advertiser='1003')  and trid_1 like '%-%'

group by trid_1, device, placement, ADID,daykey, Partner
