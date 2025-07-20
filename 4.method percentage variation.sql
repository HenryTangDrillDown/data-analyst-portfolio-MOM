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

SELECT B.name,COUNT(A.payment_method_id) AS COUNT_payment_method_id
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.payment_methods_tab$ B ON A.payment_method_id = B.method_id
WHERE DATEPART(month,A.create_date) = 3
GROUP BY B.name
ORDER BY B.name
--3��method percentag variation

SELECT B.name,COUNT(A.payment_method_id) AS COUNT_payment_method_id
FROM Test.dbo.order_tab$ A
JOIN Test.dbo.payment_methods_tab$ B ON A.payment_method_id = B.method_id
WHERE DATEPART(month,A.create_date) = 4
GROUP BY B.name
ORDER BY B.name
--4��method percentag variation