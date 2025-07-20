SELECT *
FROM Test.dbo.order_tab$

SELECT DISTINCT DATEPART(month,create_date)
FROM Test.dbo.order_tab$
--確認order_tab$月份為3-4月