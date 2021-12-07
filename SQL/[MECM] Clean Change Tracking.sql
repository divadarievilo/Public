--Check how many CT_Days_Old
USE <ConfigMgr database name>
EXEC spDiagChangeTracking @CleanupChangeTracking = 1

-- Cleanup
USE <ConfigMgr database name>
EXEC spDiagChangeTracking @CleanupChangeTracking = 1