USE [Final Project];
SELECT MIN(InvoiceTotal) AS LowestInvoice, MAX(InvoiceTotal) AS HighestInvoice
FROM Invoice;

SELECT COUNT(InvoicePaid) AS UnpaidInvoices
FROM Invoice
WHERE InvoicePaid = 'no';

SELECT AVG(InvoiceTotal) AS AvgInvoiceTotal
FROM Invoice;

SELECT SUM(InvoiceTotal) AS TotalOutstandingInvoices
FROM Invoice
WHERE InvoicePaid = 'no';
