select distinct
v_R_System.Netbios_Name0 AS 'Name',
gsis.ProductName0 AS 'Software Name',
gsis.ProductVersion0 AS 'Versão',
gsis.Publisher0 AS 'Fabricante',
InstallDate0 AS 'Data de Instalação',
--gsis.InstallDate0) AS 'Ultima Utilização',
MAX(v_GS_CCM_RECENTLY_USED_APPS.LastUsedTime0) AS 'Ultima Utilização Teste',
UPPER(softwarecode0) AS ProductCode
from v_GS_INSTALLED_SOFTWARE gsis
inner join v_R_System on v_R_System.ResourceID = gsis.ResourceID
inner join v_GS_CCM_RECENTLY_USED_APPS on v_GS_CCM_RECENTLY_USED_APPS.ResourceID = gsis.ResourceID
where gsis.ProductName0 like '%Microsoft%Visio%' and gsis.ProductName0 not like '%Viewer%' and gsis.ProductName0 not like '%Microsoft Visio -%' and gsis.ProductName0 not like '%Microsoft Visio MUI%' or gsis.ProductName0 like '%Microsoft%Project%' and gsis.ProductName0 not like '%Project MUI%' and gsis.ProductName0 not like '%SQL Server%' and gsis.ProductName0 not like '%Visual%Studio%'
group by Netbios_Name0, gsis.ProductName0, gsis.ProductVersion0, gsis.Publisher0, InstallDate0, softwarecode0