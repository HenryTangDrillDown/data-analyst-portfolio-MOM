SELECT *--瀏覽後選擇使用column order_id,create_date
FROM Test.dbo.order_tab$

SELECT *--瀏覽後選擇使用column order_id,gmv_usd
FROM Test.dbo.order_item_tab$

--
SELECT COUNT(order_id)
FROM Test.dbo.order_tab$

SELECT COUNT(DISTINCT order_id)
FROM Test.dbo.order_tab$
--order_tab$ column order_id 無重複

--
SELECT COUNT(order_id)
FROM Test.dbo.order_item_tab$

SELECT COUNT(DISTINCT order_id)
FROM Test.dbo.order_item_tab$
--order_item_tab$ column order_id 有重複

SELECT DATEPART(month,A.create_date) AS MON,
COUNT(DISTINCT A.order_id) AS COUNT_order,--使用 DISTINCT 避免 JOIN column order_id膨脹
SUM(B.gmv_usd) AS SUM_gmv_usd,
SUM(B.gmv_usd)/COUNT(DISTINCT A.order_id) AS AVG_gmv_usd
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.order_item_tab$ B ON A.order_id = B.order_id
GROUP BY DATEPART(month,A.create_date)
--4月的訂單量、gmv比3月的訂單量、gmv成長，但每筆訂單的gmv衰退
