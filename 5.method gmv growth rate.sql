SELECT *--瀏覽後選擇使用column payment_method_id
FROM Test.dbo.order_tab$

SELECT *--瀏覽後選擇使用column method_id,name
FROM Test.dbo.payment_methods_tab$

--
SELECT payment_method_id
FROM Test.dbo.order_tab$
GROUP BY payment_method_id
ORDER BY payment_method_id

SELECT method_id,name
FROM Test.dbo.payment_methods_tab$
GROUP BY method_id,name
ORDER BY method_id
--確認column payment_method_id 和 method_id 代號一致

--
SELECT COUNT(order_id)
FROM Test.dbo.order_tab$

SELECT COUNT(DISTINCT order_id)
FROM Test.dbo.order_tab$
--order_tab$ column order_id 無重複，確認1個訂單對應1種付款方式

SELECT C.name,
COUNT(DISTINCT A.order_id) AS COUNT_order_id,
SUM(B.gmv_usd) AS SUM_gmv_usd,
SUM(B.gmv_usd)/COUNT(DISTINCT A.order_id) AS AVG_gmv_usd
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.order_item_tab$ B ON A.order_id = B.order_id
JOIN Test.dbo.payment_methods_tab$ C ON A.payment_method_id = C.method_id
WHERE DATEPART(month,A.create_date) = 3
GROUP BY C.name
ORDER BY C.name
--3月method gmv growth rate

SELECT C.name,
COUNT(DISTINCT A.order_id) AS COUNT_order_id,
SUM(B.gmv_usd) AS SUM_gmv_usd,
SUM(B.gmv_usd)/COUNT(DISTINCT A.order_id) AS AVG_gmv_usd
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.order_item_tab$ B ON A.order_id = B.order_id
JOIN Test.dbo.payment_methods_tab$ C ON A.payment_method_id = C.method_id
WHERE DATEPART(month,A.create_date) = 4
GROUP BY C.name
ORDER BY C.name
--4月method gmv growth rate