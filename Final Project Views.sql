 /* Final Project Views 

USE [Final Project];
GO
CREATE VIEW OutstandingCustomerInvoices_limited
AS
SELECT CustomerName, InvoiceTotal InvoicePaid
FROM Customers,Invoice
JOIN [Order on Invoice] ON [Order on Invoice].InvoiceID = Invoice.InvoiceID
WHERE InvoicePaid = 'no'
WITH CHECK OPTION;
GO

USE [Final Project];
GO
CREATE VIEW OutstandingCustomerInvoices_ToUpdate
AS
SELECT CustomerName, InvoiceTotal InvoicePaid
FROM Customers,Invoice
JOIN [Order on Invoice] ON [Order on Invoice].InvoiceID = Invoice.InvoiceID
WHERE InvoicePaid = 'no'
GO

USE [Final Project];
GO
CREATE VIEW ProjectsPerContractor
AS
SELECT ContractorName, ContractoCompany, FileName, OrderDate, FileDeadline
FROM Contractors, Files, Orders
WHERE FileDeadline<GETDATE()
GO

USE [Final Project];
GO
CREATE VIEW ProjectsPerCustomer
AS
SELECT CustomerName, FileName, OrderDate, FileDeadline
FROM Customers, Files, Orders
WHERE FileDeadline<GETDATE()
GO*/




