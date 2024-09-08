#1
SELECT Name FROM country WHERE Continent = 'South America';
#2
SELECT Population FROM country WHERE Name = 'Germany';
#3
SELECT city.Name 
FROM city 
JOIN country ON city.CountryCode = country.Code 
WHERE country.Name = 'Japan';
#4
SELECT Name, Population 
FROM country 
WHERE Continent = 'Africa' 
ORDER BY Population DESC 
LIMIT 3;
#5
SELECT Name, LifeExpectancy 
FROM country 
WHERE Population BETWEEN 1000000 AND 5000000;
#6
SELECT country.Name 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';
#7
SELECT Album.Title
FROM Album
JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = 'AC/DC';
#8
SELECT Customer.FirstName, Customer.LastName, Customer.Email
FROM Customer
WHERE Customer.Country = 'Brazil';
#9
SELECT Playlist.Name
FROM Playlist;
#10
SELECT COUNT(Track.TrackId) AS TotalTracks
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock';
#11
SELECT Employee.FirstName, Employee.LastName
FROM Employee
JOIN Employee AS Manager ON Employee.ReportsTo = Manager.EmployeeId
WHERE Manager.FirstName = 'Nancy' AND Manager.LastName = 'Edwards';
#12
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY TotalSales DESC;
#Part2
CREATE TABLE IF NOT EXISTS Category (
    CategoryId INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Menu (
    MenuId INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Price DECIMAL(5, 2),
    CategoryId INT,
    FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);

CREATE TABLE IF NOT EXISTS CustomerOrder (
    OrderId INT PRIMARY KEY,
    MenuId INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (MenuId) REFERENCES Menu(MenuId)
);
INSERT INTO Category (CategoryId, CategoryName)
VALUES 
(1, 'Appetizer'),
(2, 'Main Course'),
(3, 'Beverage');

INSERT INTO Menu (MenuId, ItemName, Price, CategoryId)
VALUES 
(1, 'Spring Rolls', 5.00, 1),
(2, 'Kung Pao Chicken', 12.50, 2),
(3, 'Sweet and Sour Pork', 10.00, 2),
(4, 'Wonton Soup', 6.00, 1),
(5, 'Green Tea', 3.00, 3);

INSERT INTO CustomerOrder (OrderId, MenuId, Quantity, OrderDate)
VALUES
(1, 1, 2, '2024-09-01'),
(2, 2, 1, '2024-09-01'),
(3, 5, 1, '2024-09-01'),
(4, 3, 3, '2024-09-02'),
(5, 4, 2, '2024-09-02');

#1 Query to list all menu items and their prices
SELECT ItemName, Price
FROM Menu;
#2 Query to retrieve all orders made on '2024-09-02'
SELECT CustomerOrder.OrderId, Menu.ItemName, CustomerOrder.Quantity, CustomerOrder.OrderDate
FROM CustomerOrder
JOIN Menu ON CustomerOrder.MenuId = Menu.MenuId
WHERE CustomerOrder.OrderDate = '2024-09-02';
#3 Query to list all menu items under the 'Main Course' category
SELECT Menu.ItemName
FROM Menu
JOIN Category ON Menu.CategoryId = Category.CategoryId
WHERE Category.CategoryName = 'Main Course';
