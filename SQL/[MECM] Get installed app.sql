select sys.Netbios_Name0, arp.DisplayName0, arp.Version0, arp.Publisher0, arp.InstallDate0
from v_R_System sys  left join v_Add_Remove_Programs arp on sys.ResourceID = arp.ResourceID  left join v_FullCollectionMembership C on sys.ResourceID = c.ResourceID 
where c.CollectionID like 'XXXXXX'