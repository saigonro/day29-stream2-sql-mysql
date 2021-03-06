/*
  GOLD CHALLENGES
  -----------------
  4. Create a query that shows our 10 biggest invoices by Total value, in descending order.
     If two invoices have the same Total, the more recent should appear first.
     The query should also show the Name of the Customer
     An Easy way to show the name would be to include the FirstName and LastName columns from
     the Customer table. However, if you use the concatenation operator you can combine those
     fields into one column in the results.
     Expected: 10 rows
      Helena Holý	            2013-11-13 00:00:00	  25.86
      Richard Cunningham	    2012-08-05 00:00:00	  23.86
      Hugh O'Reilly	          2011-04-28 00:00:00	  21.86
      Ladislav Kovács	        2010-02-18 00:00:00	  21.86
      Victor Stevens	        2011-05-29 00:00:00	  18.86
      Astrid Gruber	          2010-01-18 00:00:00	  18.86
      Luis Rojas	            2010-01-13 00:00:00	  17.91
      Isabelle Mercier	      2012-10-06 00:00:00	  16.86
      František Wichterlová	  2012-09-05 00:00:00	  16.86
      Bjørn Hansen	          2011-06-29 00:00:00	  15.86
*/

SELECT concat(FirstName, ' ', LastName), InvoiceDate as Date, Total
FROM Invoice
    JOIN Customer on Invoice.CustomerId = Customer.CustomerId
ORDER BY Total desc, InvoiceDate desc
LIMIT 10;