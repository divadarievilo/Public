SELECT * FROM SMS_R_System 
WHERE ResourceID IN ( SELECT ResourceID FROM SMS_G_System_CH_ClientSummary WHERE LastMPServerName IN ('XXXXXXXXXX','XXXXXXXXXX'))"