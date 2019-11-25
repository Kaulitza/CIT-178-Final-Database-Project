/* Final Project Procedures 

USE [Final Project];
GO
CREATE PROC spFiles
	@invoice varchar(30) = NULL
AS
	SELECT * FROM Files
	ORDER BY FileName
GO
EXEC spFiles;

USE [Final Project];
GO
CREATE PROC spGetContractor
	@ContractorID int
AS
BEGIN
	SELECT * FROM Contractors
	WHERE ContractorID = @ContractorID
END
GO
EXEC spGetContractor 11672;

USE [Final Project]
GO
CREATE PROC spContractorContact
	@ContractorID int,
	@ContractorName nvarchar(30) OUTPUT,
	@CompanyName nvarchar(30) OUTPUT,
	@ContractorCountry nvarchar(20) OUTPUT
AS
SELECT @ContractorName = ContractorName, @CompanyName = ContractoCompany, @ContractorCountry = ContractorCountry
FROM Contractors
WHERE @ContractorID = @ContractorID
GO


DECLARE @ContractorName nvarchar(30);
DECLARE @CompanyName nvarchar(30);
DECLARE @ContractorCountry nvarchar(20);
EXEC spContractorContact 11725, @ContractorName OUTPUT, @CompanyName OUTPUT, @ContractorCountry OUTPUT;
SELECT @CompanyName AS 'Company Name', @ContractorName AS 'Contractor Name', @ContractorCountry AS 'Country';


USE [Final Project];
GO
CREATE PROC spFileCount
AS
DECLARE @FileCount int;
SELECT @FileCount = COUNT(*)
FROM Files
RETURN @FileCount
GO

DECLARE @FileCount int;
EXEC @FileCount = spFileCount
PRINT 'There are ' + CONVERT(varchar, @FileCount) + ' files being worked on';
GO*/

/* Final Project User Defined Functions 
 

USE [Final Project];
GO
CREATE FUNCTION fnGetFileName
    (@FileName nvarchar(50) = '%')
    RETURNS nvarchar(50)
BEGIN
    RETURN (SELECT FileName FROM Files WHERE FileName Like @FileName);
END;

GO
SELECT FileName, FileRequirements, CustomerID, ContractorID FROM Files
WHERE FileName = dbo.fnGetFileName('PB%');

USE [Final Project];
GO
CREATE FUNCTION fnFiles
	(@FileName nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Files WHERE FileName LIKE @FileName);
GO

SELECT * FROM dbo.fnFiles('%B%');*/

/* Final Project Triggers 

 USE [Final Project];
 GO
 SELECT * INTO CustomerArchive
 FROM Customers
 WHERE 1=0;

 ALTER TABLE CustomerArchive
 ADD Activity varchar(50);
 GO

  CREATE TRIGGER CustomerArchive_INSERT ON Customers
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Name nvarchar(30)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @Country nvarchar(30)

    SELECT @CustomerID =INSERTED.CustomerID, @Name = INSERTED.CustomerName, 
	@Address = INSERTED.CustomerAddress, @Zip = INSERTED.CustomerZip, @Country = INSERTED.CustomerCountry
	FROM INSERTED

    INSERT INTO CustomerArchive VALUES(@CustomerID,@Name,@Address, @Zip, @Country, 'Inserted' )
END
GO

 CREATE TRIGGER CustomerArchive_Update ON Customers
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Name nvarchar(30)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @Country nvarchar(30)

    SELECT @CustomerID =INSERTED.CustomerID, @Name = INSERTED.CustomerName, 
	@Address = INSERTED.CustomerAddress, @Zip = INSERTED.CustomerZip, @Country = INSERTED.CustomerCountry
	FROM INSERTED

    INSERT INTO CustomerArchive VALUES(@CustomerID,@Name,@Address, @Zip, @Country, 'Updated' )
END
GO*/

USE [Final Project];
GO
CREATE TRIGGER Customers_DELETE ON Customers
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
    SELECT @CustomerID =DELETED.CustomerId
    FROM DELETED
END