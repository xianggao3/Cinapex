#Record an order. -- Working --

INSERT INTO MovieOrder(Id, DateTime, ReturnDate)
VALUES(1, '2017-11-09 10:00', 20091114);


#Add information for a customer -- Working --

INSERT INTO Location(ZipCode, City, State)
VALUES(11790, 'Stony Brook', 'NY');

INSERT INTO Person(SSN,LastName,FirstName,Address,ZipCode,Telephone)
VALUES('111-11-1111', 'Yang', 'Shang', '123 Success Street', 11845, '516-632-8959');

INSERT INTO Customer(Id, Email, Rating, CreditCardNumber)
VALUES('111-11-1111', 'syang@cs.sunysb.edu', 1, '1234-5678-1234-5678');

#Edit information for a customer -- Working --
UPDATE Customer
SET    Rating = 3
WHERE  Id = '111-11-1111';

#Delete information about a customer -- Working --
DELETE FROM Customer
WHERE Id = '111-11-1111';


#Produce customer mailing lists -- Working -- 

SELECT C.email
FROM Customer C;



#Produce a list of movie suggestions for a given customer (using the recommender system which uses information about the customer's past orders and that of nearest neighbors)
