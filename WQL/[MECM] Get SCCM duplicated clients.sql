-- Create WQL Collection with following syntax:
select sys.ResourceID,sys.ResourceType,sys.Name,sys.SMSUniqueIdentifier,
sys.ResourceDomainORWorkgroup,sys.Client from SMS_R_System as sys
full join SMS_R_System as sys1 on sys1.ResourceId = sys.ResourceId
full join SMS_R_System as sys2 on sys2.Name = sys1.Name
where sys1.Name = sys2.Name and sys1.ResourceId != sys2.ResourceId