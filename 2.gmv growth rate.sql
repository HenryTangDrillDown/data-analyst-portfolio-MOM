SELECT *--�s�����ܨϥ�column order_id,create_date
FROM Test.dbo.order_tab$

SELECT *--�s�����ܨϥ�column order_id,gmv_usd
FROM Test.dbo.order_item_tab$

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

SELECT DATEPART(month,A.create_date) AS MON,
COUNT(DISTINCT A.order_id) AS COUNT_order,--�ϥ� DISTINCT �קK JOIN column order_id����
SUM(B.gmv_usd) AS SUM_gmv_usd,
SUM(B.gmv_usd)/COUNT(DISTINCT A.order_id) AS AVG_gmv_usd
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.order_item_tab$ B ON A.order_id = B.order_id
GROUP BY DATEPART(month,A.create_date)
--4�몺�q��q�Bgmv��3�몺�q��q�Bgmv�����A���C���q�檺gmv�I�h
