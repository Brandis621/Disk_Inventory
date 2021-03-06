/********************************************************************************************
* Name				Date				Description
* Aaron Smith		2/28/19				Initial development of disk_inventory
* Aaron Smith		3/8/19				Insert table data into Tables
* Aaron Smith		3/14/19				Creation of scripts to show data
* Aaron smith		3/20/19				Created Stored Procedures for modifying table data
*********************************************************************************************/
use master
go

IF DB_ID('DiskInventoryAS') IS NOT NULL
	DROP DATABASE DiskInventoryAS
GO

create database diskInventoryAS
go

use diskInventoryAS
go

CREATE TABLE genre
	(
	genre_id int NOT NULL identity Primary key,
	description nvarchar(100) not null
	)
GO

CREATE TABLE diskStatus
	(
	status_id int NOT NULL identity Primary key,
	description nvarchar(100) not null
	)
GO

CREATE TABLE diskType
	(
	disk_type_id int NOT NULL identity Primary key,
	description nvarchar(100) not null
	)
GO

CREATE TABLE artistType
	(
	artist_type_id int NOT NULL identity Primary key,
	description nvarchar(100) not null
	)
GO

CREATE TABLE borrower
	(
	borrower_id int NOT NULL identity Primary key,
	fname nvarchar(100) not null,
	lname nvarchar(100) not null,
	phoneNumber nvarchar(50) not null,
	)
GO

CREATE TABLE artist
	(
	artist_id int NOT NULL identity Primary key,
	fname nvarchar(100) not null,
	lname nvarchar(100) null,
	artist_type int not null foreign key references artistType(artist_type_id)
	)
GO

CREATE TABLE disk
	(
	disk_id int NOT NULL identity Primary key,
	disk_name nvarchar(100) not null,
	release_date datetime not null,
	status_id int not null foreign key references diskStatus(status_id),
	genre_id int not null foreign key references genre(genre_id),
	disk_type_id int not null foreign key references diskType(disk_type_id)
	)
GO

CREATE TABLE diskHasBorrower
	(
	disk_id int NOT NULL references disk(disk_id),
	borrower_id int NOT NULL references borrower(borrower_id),
	borrowed_date datetime not null,
	returned_date datetime null,
	primary key(disk_id, borrower_id, borrowed_date) 
	)
GO

CREATE TABLE diskHasArtist
	(
	disk_id int NOT NULL references disk(disk_id),
	artist_id int NOT NULL references artist(artist_id),
	primary key(disk_id, artist_id)
	)
GO


use master
go
if Suser_id('diskUserAS') is not null
	drop login diskUserAS
go
create login diskUserAS with password = 'Pa$$w0rd',
		default_database = diskInventoryAS;
go
use diskInventoryAS
go
if User_id('diskUserAS') is not null
	drop user diskUserAS
go
create user diskUserAS
go
alter role db_datareader add member diskUserAS
go
----------------------------------------------------------------------------------------------------------------
--Project 3
-- Insert Data to the DiskStatus Table
USE [diskInventoryAS]
GO

INSERT INTO [dbo].[diskStatus]
     VALUES
           ('In stock'),
		   ('on loan'),
		   ('damaged'),
		   ('unavailable')
GO

--Insert Data to DiskType Table
USE [diskInventoryAS]
GO

INSERT INTO [dbo].[diskType]
     VALUES
           ('CD'),
		   ('Cassette'),
		   ('Record')

GO

--insert data for artistType Table
USE [diskInventoryAS]
GO

INSERT INTO [dbo].[artistType]
     VALUES
           ('band'),
		   ('solo artist')
GO

--insert data for borrower table
USE [diskInventoryAS]
GO

INSERT INTO [dbo].[borrower]
     VALUES
           ('Aaron', 'Smith', '208-562-7078'),
		   ('Cameron', 'Smith', '208-123-4567'),
		   ('Steven', 'Smith', '208-297-4695'),
		   ('Joshua', 'Lockwood', '208-630-8350'),
		   ('Jacob', 'Lockwood', '208-984-3844'),
		   ('Victoria', 'Lewis', '208-681-3571'),
		   ('Lisa', 'Martinez', '208-195-7961'),
		   ('Lisa', 'Hammond', '208-963-9630'),
		   ('Sam', 'Sammons', '208-741-7410'),
		   ('Peter', 'Piper', '208-852-8520'),
		   ('Mary', 'Poppins', '208-147-0147'),
		   ('Michael', 'Jackson', '208-258-2582'),
		   ('Tim', 'Kennison', '208-369-3693'),
		   ('Aaron', 'Clegg', '208-789-7897'),
		   ('Erin', 'Gatfield', '208-456-4564'),
		   ('Linette', 'Gregg', '208-123-1321'),
		   ('Phil', 'Henderson', '208-555-7078'),
		   ('Jesus', 'Christ', '208-555-5627'),
		   ('Jimmy', 'John', '208-621-6271'),
		   ('Will', 'Smith', '208-751-9569')
GO

--Insert Data to the Genre Table
USE [diskInventoryAS]
GO

INSERT INTO [dbo].[genre]
     VALUES
           ('Rock'),
		   ('Metal'),
		   ('Pop'),
		   ('Country'),
		   ('Rap'),
		   ('R&B'),
		   ('Classic'),
		   ('Punk'),
		   ('Reggae')
GO

--Insert Data to the Artist Table
USE [diskInventoryAS]
GO

--1 is band 2 is artist
INSERT INTO [dbo].[artist]
     VALUES
           ('Rise Aginst', null, 1),
		   ('Five Finger Death Punch', null, 1),
		   ('Black Veil Brides', null, 1),
		   ('Fit for Rivals', null, 1),
		   ('Renee', 'Phoenix', 2),
		   ('Chester', 'Bennington', 2),
		   ('Bob', 'Marley', 2),
		   ('The Band Perry', null, 1),
		   ('Dragonforce', null, 1),
		   ('Jeff', 'Williams', 2),
		   ('BearTooth', null, 1),
		   ('Cher', null, 2),
		   ('Casey Lee', 'Williams', 2),
		   ('Breaking Benjamin', null, 1),
		   ('Panic! at the Disco', null, 1),
		   ('Set It Off', null, 1),
		   ('Linkin Park', null, 1),
		   ('Mark', 'Morton', 2),
		   ('Shinedown', null, 1),
		   ('Katy', 'Perry', 2)
GO

--Insert Data to Disk Table
USE [diskInventoryAS]
GO
-- Status: 1.In stock 2.on loan 3.damaged 4.unavailable
-- Genre: 1.Rock 2.Metal 3.Pop 4.Country 5.Rap 6.R&B 7.Classic 8.Punk 9.Reggae
-- Disk Type: 1.CD 2.Cassette 3.Record

INSERT INTO [dbo].[disk]
     VALUES
           ('The Violence', '2001 October 8', 1, 1, 1),
		   ('Agrresive', '2003 September 22', 2, 2, 3),
		   ('Wretched and Divine', '2003 December 31', 2, 1, 1),
		   ('Set the World on Fire', '2005 April 16', 1, 1, 1),
		   ('Phobia', '2006 May 6', 2, 8, 3),
		   ('Inhuman Rampage', '2007 December 2', 1, 2, 1),
		   ('Steady Damage', '2008 May 14', 4, 1, 3),
		   ('Jeykyll and Hyde', '2008 August 19', 1, 2, 1),
		   ('RWBY Vol.2 Soundtrack', '2012 January 11', 2, 3, 1),
		   ('Red Vs Blue Season 9 Soundtrack', '2012 September 9', 1, 1, 1),
		   ('Anesthetic', '2012 October 21', 4, 2, 1),
		   ('Pretty. Odd.', '2013 November 9', 1, 1, 1),
		   ('Siren Song of the Counter Culture', '2016 February 28', 1, 8, 3),
		   ('Duality', '2017 October 25', 2, 1, 1),
		   ('Witness', '2018 March 7', 4, 3, 1),
		   ('Prism', '2018 June 10', 1, 3, 3),
		   ('Believe', '2018 November 1', 1, 3, 1),
		   ('Catch a Fire', '1978 August 16', 3, 9, 2),
		   ('Talkin'' Blues', '1981 April 20', 2, 9, 2),
		   ('Sound of Madness', '2016 May 7', 1, 1, 1)
GO

--Insert data to DiskHasArtist
USE [diskInventoryAS]
GO

INSERT INTO [dbo].[diskHasArtist]
     VALUES
           (9,10),
		   (9,13),
		   (1,1),
		   (13,1),
		   (2,11),
		   (3,3),
		   (4,3),
		   (5,14),
		   (6,9),
		   (7,4),
		   (8,2),
		   (10,10),
		   (11,6),
		   (11,18),
		   (12,15),
		   (14,16),
		   (15,20),
		   (16,20),
		   (17,12),
		   (18,7),
		   (19,7),
		   (20,19)
GO

--insert data diskhasborrower table
USE [diskInventoryAS]
GO

INSERT INTO [dbo].[diskHasBorrower]
     VALUES
           (1, 1, '2017 January 9', '2017 January 20'),
		   (1, 1, '2017 February 9', '2017 February 20'),
		   (2, 1, '2017 March 16', null),
		   (3, 2, '2017 June 11', null),
		   (4, 17, '2017 July 25', '2017 January 20'),
		   (5, 16, '2017 August 15', null),
		   (6, 15, '2017 December 22', '2017 January 20'),
		   (7, 14, '2017 December 31', '2017 January 20'),
		   (8, 13, '2018 January 14', '2017 January 20'),
		   (9, 12, '2018 January 19', null),
		   (10, 11, '2018 March 1', '2017 January 20'),
		   (11, 10, '2018 June 6', '2017 January 20'),
		   (12, 9, '2018 July 17', '2017 January 20'),
		   (13, 8, '2018 September 6', '2017 January 20'),
		   (14, 7, '2018 September 9', '2017 January 20'),
		   (14, 6, '2018 November 27', null),
		   (16, 5, '2019 February 10', '2017 January 20'),
		   (17, 5, '2019 February 16', '2017 January 20'),
		   (18, 4, '2019 February 20', '2019 March 7'),
		   (19, 3, '2019 February 21', null)

GO

---Updating data in disk table
USE [diskInventoryAS]
GO

UPDATE [dbo].[disk]
   SET [status_id] = 1
 WHERE disk_id = 18
GO

--Deleting a borrower
USE [diskInventoryAS]
GO

DELETE FROM [dbo].[borrower]
      WHERE borrower_id = 20
GO

----------------------------------------------------------------------------------------------------------------
--Project 4

--Show disks associated with solo artits
USE diskInventoryAS
GO

--3.
Select disk_name, convert(varchar(10), Release_date, 101) as 'Release Date', 
	   A.Fname as 'Artist First Name', A.Lname as 'Artist Last Name'
from Disk D
join diskHasArtist DhA
on D.disk_ID = DhA.Disk_ID
join Artist A
on DhA.Artist_ID = A.Artist_ID
where A.Artist_Type = 2
order by lname, fname
go

--4.
create view ViewIndividualArtist as
	Select * from Artist
	where Artist_Type = 2
go
Select Fname as 'First Name', Lname as 'Last Name'
from ViewIndividualArtist
order by Lname, Fname
go

--5.
Select disk_name, convert(varchar(10), Release_date, 101) as 'Release Date', Fname as 'Band Name'
from Disk D
join diskHasArtist DhA
on D.Disk_ID = DhA.Disk_ID
join Artist A
on DhA.Artist_ID = A.artist_id
where not exists
	(select Artist_ID
	 from ViewIndividualArtist
	 where ViewIndividualArtist.artist_id = A.artist_id)
order by Fname
go

--6.
select fname as 'First Name', lname as 'Last Name', Disk_Name, 
	   convert(varchar(10), Borrowed_date, 101) as 'Borrow Date', convert(varchar(10), Returned_date, 101) as 'Return Date'
from borrower B
join diskHasBorrower DhB
on B.borrower_id = Dhb.borrower_id
join Disk D
on Dhb.disk_id = D.disk_id
order by lname, fname, disk_name, borrowed_date, returned_date
go

--7.
Select D.Disk_id, disk_name, count(DhB.disk_id) as 'Times Borrowed'
from Disk D
join diskHasBorrower DhB
on D.Disk_id = DhB.Disk_ID
group by D.Disk_ID, disk_name
order by Disk_ID
go

--8.
select  Disk_Name, convert(varchar(10), Borrowed_date, 101) as 'Borrow Date', 
	    convert(varchar(10), Returned_date, 101) as 'Return Date',
		fname + ' ' + lname as 'Borrower Name'
from borrower B
join diskHasBorrower DhB
on B.borrower_id = Dhb.borrower_id
join Disk D
on Dhb.disk_id = D.disk_id
where returned_date is null
order by disk_name
go

---------------------------------------------------------------------------------------------
--Project 5
USE DiskInventoryAS;
GO

--Procedure to Insert Artists--------------------------
Drop proc if exists sp_ArtistInsert
go

CREATE PROC sp_ArtistInsert
	@ArtistFName varchar(100),
	@ArtistLName varchar(100),
	@TypeofArtist int

AS

BEGIN TRY --Begin Error Handling
INSERT INTO artist
           (fname
           ,lname
           ,artist_type)
     VALUES
           (@ArtistFName, @ArtistLName, @TypeofArtist)
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Update Artists--------------------------------
Drop proc if exists sp_ArtistUpdate
go

CREATE PROC sp_ArtistUpdate
	@ArtistFName varchar(100),
	@ArtistLName varchar(100),
	@ArtistID int

AS

BEGIN TRY --Begin Error Handling
UPDATE artist
   SET fname = @ArtistFName,
       lname = @ArtistLName
 WHERE Artist_ID = @ArtistID

END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Delete Artists--------------------------------
Drop proc if exists sp_ArtistDelete
go

CREATE PROC sp_ArtistDelete
	@ArtistID int
AS

BEGIN TRY --Begin Error Handling
DELETE FROM artist
      WHERE Artist_ID = @ArtistID
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Insert Borrower--------------------------
Drop proc if exists sp_BorrowerInsert
go

CREATE PROC sp_BorrowerInsert
	@BorrowerFName varchar(100),
	@BorrowerLName varchar(100),
	@Phone VarChar(50)

AS

BEGIN TRY --Begin Error Handling
INSERT INTO borrower
           (fname, lname, phoneNumber)
     VALUES
           (@BorrowerFName, @BorrowerLName, @Phone)
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Update Borrower--------------------------------
Drop proc if exists sp_BorrowerUpdate
go

CREATE PROC sp_BorrowerUpdate
	@BorrowerFName varchar(100),
	@BorrowerLName varchar(100),
	@BorrowerID int

AS

BEGIN TRY --Begin Error Handling
UPDATE borrower
   SET fname = @BorrowerFName,
       lname = @BorrowerLName
 WHERE Borrower_ID = @BorrowerID
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Delete Borrower--------------------------------
Drop proc if exists sp_BorrowerDelete
go

CREATE PROC sp_BorrowerDelete
	@BorrowerID int
AS

BEGIN TRY --Begin Error Handling
DELETE FROM borrower
      WHERE Borrower_ID = @BorrowerID
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Insert Disk--------------------------
Drop proc if exists sp_DiskInsert
go

CREATE PROC sp_DiskInsert
	@DiskName varchar(100),
	@Release_Date DateTime,
	@Status_ID int,
	@Genre_ID int,
	@Disk_Type_ID int

AS

BEGIN TRY --Begin Error Handling
INSERT INTO Disk
           (Disk_Name, Release_Date, Status_ID, Genre_ID, Disk_Type_ID)
     VALUES
           (@DiskName, @Release_Date, @Status_ID, @Genre_ID, @Disk_Type_ID)
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Update Disk--------------------------------
Drop proc if exists sp_DiskUpdate
go

CREATE PROC sp_DiskUpdate
	@DiskID int,
	@DiskName varchar(100),
	@Release_Date DateTime,
	@Status_ID int,
	@Genre_ID int,
	@Disk_Type_ID int

AS

BEGIN TRY --Begin Error Handling
UPDATE Disk
   SET 
    Disk_Name = @DiskName,
	Release_Date = @Release_Date,
	Status_Id = @Status_ID,
	Genre_ID = @Genre_ID,
	Disk_Type_ID = @Disk_Type_ID
 WHERE Disk_ID = @DiskID
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO

--Procedure to Delete Disk--------------------------------
Drop proc if exists sp_DiskDelete
go

CREATE PROC sp_DiskDelete
	@DiskID int
AS

BEGIN TRY --Begin Error Handling
DELETE FROM Disk
      WHERE Disk_ID = @DiskID
END TRY
begin catch
	print 'An Error Occurred: ' + Error_Message()
end catch --End Error Handling
GO


--To call Artist sp:
Exec sp_ArtistInsert 'John', 'Doe', 2;
Exec sp_ArtistUpdate 'John', 'Lennon', 21;
Exec sp_ArtistDelete 21;

--To call Borrower sp:
Exec sp_BorrowerInsert 'John', 'Doe', '208-751-9569';
Exec sp_BorrowerUpdate 'John', 'Lennon', 21;
Exec sp_BorrowerDelete 21;

--To call Disk sp:
Exec sp_DiskInsert 'Threat to Survival', 'January 1, 2015', 1, 2, 1;
Exec sp_DiskUpdate 21, 'Threat to Survival', 'January 1, 2018', 2, 3, 2;
Exec sp_DiskDelete 21;


