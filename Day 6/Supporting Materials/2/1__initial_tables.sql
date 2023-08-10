DROP DATABASE IF EXISTS loboticket
GO

CREATE DATABASE loboticket
GO

USE loboticket
GO

create table dbo.Venues
(
    Id       int PRIMARY KEY IDENTITY NOT NULL,
    Name     varchar(100) NOT NULL,
    Capacity int           NOT NULL
)
GO


create table dbo.Acts
(
    Id          int PRIMARY KEY IDENTITY NOT NULL,
    Name        VARCHAR(100)            not null,
    RecordLabel VARCHAR(100)            null
)
GO

create table dbo.Gigs
(
    Id          int PRIMARY KEY IDENTITY NOT NULL,
    VenueId     Int           not null,
    ActId       Int           not null,
    TicketsSold Int           not null,
    Price       decimal(4, 2) not null,
    Date        Date          not null,

    FOREIGN KEY (VenueId) REFERENCES Venues (Id),
    FOREIGN KEY (ActId) REFERENCES Acts (Id)
);
GO

DROP PROCEDURE IF EXISTS loboticket.GetActs
GO

create procedure GetActs
AS
BEGIN
    select acts.name, acts.recordlabel
    from acts
	where acts.recordlabel IS NOT NULL
    order by acts.name;
    
END 
GO

DROP PROCEDURE IF EXISTS loboticket.GigReport 
GO

create procedure GigReport
	@startdate Date,
    @enddate Date
AS
begin
    select gigs.date, acts.name AS Act, acts.recordlabel, venues.name AS Venue, ticketssold, venues.capacity
    from gigs
             join acts on acts.id = gigs.actid
             join venues on venues.id = gigs.venueid
    where date >= @startdate
      and date <= @enddate
    order by gigs.date;
end 
GO

DROP PROCEDURE IF EXISTS loboticket.GetTotalSales 
GO

create procedure GetTotalSales 
		@sales decimal(8, 2) OUT
AS
begin
     SET @sales = (select sum(currentvalue) 'totalsales' from
        (select ticketssold, price, ticketssold*price 'currentvalue'
         from gigs) salestable); 
end 
GO

-- call like this:
-- set @newprice = 11;
--
-- call SetNewPrice(1, 0.1, @newprice);
--
-- select @newprice;
-- The idea is to see if we can set a new price, it takes the current price and applies a percentage rise
-- if the new price is less than the maximum then it is set and returned in the inout parameter
-- if the proposed new price is too large then the value is not changed and the current value is returned in the inout parameter
DROP PROCEDURE IF EXISTS loboticket.SetNewPrice 
GO

create procedure SetNewPrice
	@gigid int, 
	@percentage decimal(8,2), 
	@maxprice decimal(8,2) OUTPUT
AS
Begin
    declare @gigprice decimal(8,2) ;
    declare @proposedprice decimal(8,2);

	Set @gigprice = 0.0


    Set @gigprice = (select max(price) from gigs where id = @gigid);

    Set @proposedprice = @gigprice + (@gigprice * @percentage);

    if (@proposedprice < @maxprice)
	  Begin
        set @maxprice = @proposedprice;
        update gigs set price = @proposedprice where id = @gigid;
	 End
    else
	 Begin
        set @maxprice = @gigprice;
     End
End
GO

DROP PROCEDURE IF EXISTS InsertNewAct
GO

CREATE PROCEDURE InsertNewAct
    @inActId INT, 
    @inName TEXT,
	@inRecordLabel TEXT,
	@message TEXT OUT

AS

BEGIN
  
    BEGIN TRY
    -- insert a new row into the Acts table
    INSERT INTO acts(Id, Name,RecordLabel)
    VALUES(@inActId,@inName,@inRecordLabel);
    
    -- return the name of the Act
    SET @message = (SELECT Name FROM acts WHERE Id = @inActId);
	END TRY
	-- exit if the duplicate key occurs
	-- DECLARE EXIT HANDLER FOR 2627
	BEGIN CATCH
	IF (ERROR_NUMBER() = 2627)
 	 SET @message = (SELECT CONCAT('Duplicate key (',@inActId,',',@inName,'',@inRecordLabel,') occurred')) ;
	 ELSE
	 SELECT ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END 
GO

SET IDENTITY_INSERT Venues ON

INSERT INTO Venues (Id, Name, Capacity)
Values (1, 'The Arena', 100);
INSERT INTO Venues (Id, Name, Capacity)
Values (2, 'The Bowl', 150);
INSERT INTO Venues (Id, Name, Capacity)
Values (3, 'The Garage', 200);
INSERT INTO Venues (Id, Name, Capacity)
Values (4, 'The Yard', 20);
SET IDENTITY_INSERT Venues OFF

SET IDENTITY_INSERT Acts ON

INSERT INTO Acts (Id, Name, RecordLabel)
VALUES (1, 'Foo Feathers', 'Copitol');
INSERT INTO Acts (Id, Name, RecordLabel)
VALUES (2, 'The Bottles', 'Banana');
INSERT INTO Acts (Id, Name)
VALUES (3, 'BAAB');
INSERT INTO Acts (Id, Name)
VALUES (4, 'Alede');
INSERT INTO Acts (Id, Name)
VALUES (5, 'Dana Lead Rey');
INSERT INTO Acts (Id, Name)
VALUES (6, 'Led Balloon');
INSERT INTO Acts (Id, Name)
VALUES (7, 'Sheryl Rook');

SET IDENTITY_INSERT Acts OFF

INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (1, 1, 10.5, 90, '2022-11-04');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (2, 1, 10.5, 110, '2022-11-05');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (3, 1, 10.5, 170, '2022-11-06');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (4, 1, 10.5, 20, '2022-11-08');

INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (1, 2, 12.99, 91, '2022-11-05');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (2, 2, 12.99, 113, '2022-11-04');

INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (3, 3, 4.99, 153, '2022-11-07');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (4, 4, 4.99, 10, '2022-11-04');

INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (1, 5, 14.99, 153, '2022-11-06');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (2, 5, 14.99, 101, '2022-11-10');

INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (1, 6, 14.99, 153, '2022-11-07');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (2, 6, 14.99, 101, '2022-11-09');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (4, 6, 9.99, 20, '2022-11-05');

INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (2, 7, 15.99, 150, '2022-11-08');
INSERT INTO Gigs(VenueId, ActId, Price, TicketsSold, Date)
VALUES (3, 7, 15.5, 101, '2022-11-04');
