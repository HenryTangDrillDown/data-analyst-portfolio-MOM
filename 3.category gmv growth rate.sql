SELECT *--�s�����ܨϥ�column order_id,create_date
FROM Test.dbo.order_tab$

SELECT *--�s�����ܨϥ�column order_id,gmv_usd,item_id
FROM Test.dbo.order_item_tab$

SELECT *--�s�����ܨϥ�column item_id,category_id
FROM Test.dbo.item_info_tab$

SELECT *--�s�����ܨϥ�column category_id,name
FROM Test.dbo.item_categories_tab$
--------------------------------------------------------
--
SELECT COUNT(order_id)
FROM Test.dbo.order_tab$

SELECT COUNT(DISTINCT order_id)
FROM Test.dbo.order_tab$
--order_tab$ column order_id �L����

--
SELECT COUNT(order_id)
FROM Test.dbo.order_item_tab$

SELECT COUNT(DISTINCT order_id)
FROM Test.dbo.order_item_tab$
--order_item_tab$ column order_id ������

--
SELECT COUNT(item_id)
FROM Test.dbo.item_info_tab$

SELECT COUNT(DISTINCT item_id)
FROM Test.dbo.item_info_tab$
--item_info_tab$ column item_id ������

--
SELECT COUNT(category_id)
FROM Test.dbo.item_categories_tab$

SELECT COUNT(DISTINCT category_id)
FROM Test.dbo.item_categories_tab$
--item_categories_tab$ column category_id �L����

SELECT D.name,
COUNT(DISTINCT A.order_id) AS COUNT_order,
SUM(B.gmv_usd) AS SUM_gmv_usd,
SUM(B.gmv_usd)/COUNT(DISTINCT A.order_id) AS AVG_gmv_usd
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.order_item_tab$ B ON A.order_id = B.order_id--�]���n�p��gmv�Aorder_item_tab$ �L�� DISTINCT �קK����
JOIN (SELECT DISTINCT *--�ϥ� DISTINCT �קK JOIN column item_id����
FROM Test.dbo.item_info_tab$) C ON B.item_id = C.item_id
JOIN Test.dbo.item_categories_tab$ D ON C.category_id = D.category_id
WHERE DATEPART(month,A.create_date) = 3
GROUP BY D.name
ORDER BY D.name
--3��category gmv growth rate

SELECT D.name,
COUNT(DISTINCT A.order_id) AS COUNT_order,
SUM(B.gmv_usd) AS SUM_gmv_usd,
SUM(B.gmv_usd)/COUNT(DISTINCT A.order_id) AS AVG_gmv_usd
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.order_item_tab$ B ON A.order_id = B.order_id--�]���n�p��gmv�Aorder_item_tab$ �L�� DISTINCT �קK����
JOIN (SELECT DISTINCT *--�ϥ� DISTINCT �קK JOIN column item_id����
FROM Test.dbo.item_info_tab$) C ON B.item_id = C.item_id
JOIN Test.dbo.item_categories_tab$ D ON C.category_id = D.category_id
WHERE DATEPART(month,A.create_date) = 4
GROUP BY D.name
ORDER BY D.name
--4��category gmv growth rate