# Example: Mcafee
get-wmiobject win32_product | where {$_.name -like "*mcafee*"}