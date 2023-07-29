USE loboticket;
DESC acts

delimiter ;
SELECT TicketsSold FROM Gigs;
SELECT * FROM gigs
JOIN venues ON venues.id = gigs.venueid
WHERE venues.name LIKE '%arena%';

INSERT INTO venues (name, capacity) values ('My Garden', 30);
SELECT * FROM venues;

UPDATE venues SET capacity=35 WHERE id=6;

DELETE FROM venues WHERE id=6;









