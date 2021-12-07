$path = "C:\Windows\Temp"

$content_to_add = "
TEXT TO ADD
TEXT TO ADD1
TEXT TO ADD2
TEXT TO ADD3
TEXT TO ADD4
"

Add-Content -Value $content_to_add -Path $path -Confirm:$false -Force