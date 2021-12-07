-- Count Models
select Model0, COUNT(*) from v_GS_COMPUTER_SYSTEM
where Manufacturer0 like '%lenovo%'
group by Model0

-- Count Models (COMPUTER_SYSTEM_PRODUCT_DATA)
select Version00, COUNT(*) from COMPUTER_SYSTEM_PRODUCT_DATA
where Name00 not like '%HP%'
group by Version00