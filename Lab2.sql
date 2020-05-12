SELECT BillingCountry, count(*) as Invoices 
FROM Invoice
GROUP BY BillingCountry
ORDER BY Invoices desc;

SELECT customer.city,sum(invoice.Total)
from customer,invoice
where customer.CustomerId=Invoice.CustomerId
group by customer.city
order by sum(invoice.Total) desc
limit 1;

SELECT  c.CustomerId, c.FirstName, c.LastName, sum(i.Total) as TotalSpent
FROM Customer c, Invoice i
WHERE c.CustomerId=i.CustomerId
GROUP BY (i.CustomerId)
ORDER BY TotalSpent desc
limit 1;

  
SELECT DISTINCT
       C.Email     AS email,
       C.FirstName AS firstName,
       C.LastName  AS lastName,
       G.Name      AS name
  FROM Customer C JOIN Invoice I 
    ON C.CustomerId = I.CustomerId JOIN InvoiceLine IL 
    ON I.InvoiceId = IL.InvoiceId JOIN Track T 
    ON IL.TrackId = T.TrackId JOIN Genre G 
    ON T.GenreId = G.GenreId 
 WHERE G.Name = "Rock" 
ORDER BY C.Email;

WITH tab1 AS 
(
	SELECT c.CustomerId, c.FirstName, c.LastName, c.Country, SUM(i.Total) TotalSpent
	FROM Customer c
	JOIN Invoice i ON c.CustomerId = i.CustomerId
	GROUP BY c.CustomerId
)
SELECT tab1.*
FROM tab1
JOIN
(
	SELECT CustomerId, FirstName, LastName, Country, MAX(TotalSpent) AS TotalSpent
	FROM tab1
	GROUP BY Country
) tab2
ON tab1.Country = tab2.Country
WHERE tab1.TotalSpent = tab2.TotalSpent
ORDER BY Country;
