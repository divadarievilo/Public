-- If you want to see the device that appear maximum times in the top ,use the following query:
select name0 [Device Name],count(*) Total from v_r_system
group by name0
having (count(name0))>1
order by 2 desc

-- If you want to see the list of all devices with its resource ID ,use the following query:
select sys.name0,sys.ResourceID from v_r_system as sys
full join  ass
full join v_r_system as sys2 on sys2.Name0 = sys1.Name0
where sys1.Name0 = sys2.Name0 and sys1.ResourceId != sys2.ResourceId
group by sys.Name0,sys.ResourceID
order by 1
