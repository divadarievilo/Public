SELECT distinct
vrs.Name0 [Computer Name],vrs.User_Name0 [User Name],
Case
When EnforcementState = 1000 Then 'Success'
When EnforcementState = 1001 Then 'Already Compliant'
When EnforcementState = 1002 Then 'Simulate Success'
When EnforcementState = 2000 Then 'In progress'
When EnforcementState = 2001 Then 'Waiting for content'
When EnforcementState = 2002 Then 'Installing'
When EnforcementState = 2003 Then 'Restart to continue'
When EnforcementState = 2004 Then 'Waiting for maintenance window'
When EnforcementState = 2005 Then 'Waiting for schedule'
When EnforcementState = 2006 Then 'Downloading dependent content'
When EnforcementState = 2007 Then 'Installing dependent content'
When EnforcementState = 2008 Then 'Restart to complete'
When EnforcementState = 2009 Then 'Content downloaded'
When EnforcementState = 2010 Then 'Waiting for update'
When EnforcementState = 2011 Then 'Waiting for user session reconnect'
When EnforcementState = 2012 Then 'Waiting for user logoff'
When EnforcementState = 2013 Then 'Waiting for user logon'
When EnforcementState = 2014 Then 'Waiting To Install'
When EnforcementState = 2015 Then 'Waiting Retry'
When EnforcementState = 2016 Then 'Waiting For Presentation Mode'
When EnforcementState = 2017 Then 'Waiting For Orchestration'
When EnforcementState = 2018 Then 'Waiting For Network'
When EnforcementState = 2019 Then 'Pending App-V Virtual Environment Update'
When EnforcementState = 2020 Then 'Updating App-V Virtual Environment'
When EnforcementState = 3000 Then 'Requirements not met'
When EnforcementState = 3001 Then 'Host Platform Not Applicable'
When EnforcementState = 4000 Then 'Unknown'
When EnforcementState = 5000 Then 'Deployment failed'
When EnforcementState = 5001 Then 'Evaluation failed'
When EnforcementState = 5002 Then 'Deployment failed'
When EnforcementState = 5003 Then 'Failed to locate content'
When EnforcementState = 5004 Then 'Dependency installation failed'
When EnforcementState = 5005 Then 'Failed to download dependent content'
When EnforcementState = 5006 Then 'Conflicts with another application deployment'
When EnforcementState = 5007 Then 'Waiting Retry'
When EnforcementState = 5008 Then 'Failed to uninstall superseded deployment type'
When EnforcementState = 5009 Then 'Failed to download superseded deployment type'
When EnforcementState = 5010 Then 'Failed to updating App-V Virtual Environment'
When EnforcementState is null Then 'Unknown'
Else Cast(EnforcementState as varchar(30))
End 'Status',
IIf(vrs.Name0 like 'XXXXXX','XXXXXX',IIf(vrs.Name0 like 'XXXXXX','XXXXXX','XXXXXX')) AS Location
FROM dbo.v_R_System AS vrs
INNER JOIN (dbo.vAppDeploymentResultsPerClient
INNER JOIN v_CIAssignment
ON dbo.vAppDeploymentResultsPerClient.AssignmentID = v_CIAssignment.AssignmentID)
ON vrs.ResourceID = dbo.vAppDeploymentResultsPerClient.ResourceID
INNER JOIN dbo.fn_ListApplicationCIs(1033) lac
ON lac.ci_id=dbo.vAppDeploymentResultsPerClient.CI_ID
INNER JOIN dbo.v_GS_WORKSTATION_STATUS AS vgws
ON vgws.ResourceID=vrs.resourceid
INNER JOIN v_FullCollectionMembership coll
ON coll.ResourceID = vrs.ResourceID
INNER JOIN dbo.v_GS_OPERATING_SYSTEM AS vgos
ON vgos.ResourceID = vrs.ResourceID
WHERE lac.DisplayName in (@AppName) and CollectionName in (@CollName)
order by [Computer Name]