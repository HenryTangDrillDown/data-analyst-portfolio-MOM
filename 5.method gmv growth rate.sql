SELECT *--�s�����ܨϥ�column payment_method_id
FROM Test.dbo.order_tab$

SELECT *--�s�����ܨϥ�column method_id,name
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
--�T�{column payment_method_id �M method_id �N���@�P

--
SELECT COUNT(order_id)
FROM Test.dbo.order_tab$

SELECT COUNT(DISTINCT order_id)
FROM Test.dbo.order_tab$
--order_tab$ column order_id �L���ơA�T�{1�ӭq�����1�إI�ڤ覡

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
--3��method gmv growth rate

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
--4��method gmv growth rate