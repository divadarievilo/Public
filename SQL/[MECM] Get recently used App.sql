select sys.Netbios_Name0 as HostName, arp.DisplayName0 as ApplicationName, arp.Version0 as Version, arp.Publisher0 as Publisher, arp.InstallDate0 as InstallDate, rua.LastUsedTime00 as LastUsedTime
from v_R_System sys 
left join v_Add_Remove_Programs arp on sys.ResourceID = arp.ResourceID  
left join v_FullCollectionMembership C on sys.ResourceID = c.ResourceID 
left join RecentlyUsedApps_DATA rua on sys.ResourceID = rua.MachineID
where c.CollectionID like 'XXXXXXXXXX' and DisplayName0 like '%XXXXXXXXXX%'
--and rua.LastUsedTime00 = (Select MAX(rua.LastUsedTime00) from RecentlyUsedApps_DATA)

order by sys.Netbios_Name0 ASC,  rua.LastUsedTime00 ;