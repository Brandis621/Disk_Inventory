-------------------------------------------------
--	user			Date			Desctiption
--  Aaron Smith		3/8/19			Initial creation
------------------------------------------------------

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
		   ('Katy', 'Perry', 1)
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


--Query to get loans not returned yet

select * from diskHasBorrower
where returned_date is null
go