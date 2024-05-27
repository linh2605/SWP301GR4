-- Drop the database if it exists
DROP DATABASE IF EXISTS SportShopOnline;

-- Create the database
CREATE DATABASE SportShopOnline;

-- Use the database
USE SportShopOnline;

-- CREATE TABLES

-- Brand Table
CREATE TABLE Brand (
    BrandID INT AUTO_INCREMENT PRIMARY KEY,
    BrandName VARCHAR(50) UNIQUE NOT NULL,
    BrandDesc TEXT
);

-- Supplier Table
CREATE TABLE Supplier (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(50) NOT NULL,
    SupplierEmail VARCHAR(50),
    SupplierPhone VARCHAR(30)
);

-- Category Table
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE NOT NULL,
    CategoryDesc TEXT
);

-- Subcategory Table
CREATE TABLE Subcategory (
    SubCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    SubCategoryName VARCHAR(50) UNIQUE NOT NULL,
    SubCategoryDesc TEXT,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Product Table
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) UNIQUE NOT NULL,
    ProductPrice DECIMAL(10, 2) CHECK (ProductPrice >= 0),
    Stock INT CHECK (Stock >= 0),
    ProductRating INT CHECK (ProductRating BETWEEN 0 AND 5),
    ProductDesc TEXT NOT NULL,
    BrandID INT,
    SupplierID INT,
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- ProductCategory Table
CREATE TABLE ProductCategory (
    ProductID INT NOT NULL,
    CategoryID INT NOT NULL,
    SubCategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SubCategoryID) REFERENCES Subcategory(SubCategoryID)
);

-- Contact Table
CREATE TABLE Contact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150),
    Email VARCHAR(150),
    Message TEXT
);

-- Images Table
CREATE TABLE Images (
    ImageID INT AUTO_INCREMENT PRIMARY KEY,
    Image TEXT,
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Role Table
CREATE TABLE Role (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL UNIQUE,
    RoleDesc TEXT
);

-- User Table
CREATE TABLE `User` (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    RoleID INT NOT NULL,
    Avatar TEXT,
    FullName VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other') CHECK (Gender IN ('Male', 'Female', 'Other')),
    Phone VARCHAR(20),  -- Increased length
    Email VARCHAR(50) UNIQUE,
    Address VARCHAR(50),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

-- Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Content TEXT,
    Image TEXT,
    FeedbackDate DATE NOT NULL,
    Status INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- UsersWishList Table
CREATE TABLE UsersWishList (
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    PRIMARY KEY (UserID, ProductID),
    FOREIGN KEY (UserID) REFERENCES `User`(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- UserCart Table
CREATE TABLE UserCart (
    UserCartID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES `User`(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- OrderStatus Table
CREATE TABLE OrderStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(100)
);

-- PaymentMethod Table
CREATE TABLE PaymentMethod (
    PaymentMethodID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(100)
);

-- Order Table
CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    FullName TEXT,
    OrderDate DATE,
    DeliverDate DATE,
    Phone VARCHAR(11),  
    Email TEXT,
    `Address` TEXT,
    PaymentMethodID INT,
    TotalPrice DECIMAL(10, 2),
    StatusID INT NOT NULL,
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID),
    FOREIGN KEY (StatusID) REFERENCES OrderStatus(StatusID),
    FOREIGN KEY (UserID) REFERENCES `User`(UserID)
);

-- OrderDetail Table
CREATE TABLE OrderDetail (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT CHECK (Quantity > 0),
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Discount Table
CREATE TABLE Discount (
    DiscountID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    Amount DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    Status BOOLEAN,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Refund Table
CREATE TABLE Refund (
    OrderDetailID INT PRIMARY KEY,
    RefundDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Reason TEXT,
    Image TEXT,
    RefundStatus INT, -- 1 is approved, 0 is default, -1 is declined
    DeclineReason TEXT,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetail(OrderDetailID)
);

-- Blog Table
CREATE TABLE Blog (
    BlogID INT AUTO_INCREMENT PRIMARY KEY,
    BlogTitle VARCHAR(200),
    Content TEXT,
    CreateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateBy INT,
    Img TEXT,
    FOREIGN KEY (CreateBy) REFERENCES `User`(UserID)
);

-- Insert sample data into Brand Table
INSERT INTO Brand (BrandName, BrandDesc)
VALUES ('Nike', 'Leading sports brand known for its athletic footwear, apparel, and equipment.'),
       ('Adidas', 'Global brand known for sportswear and accessories.'),
       ('Puma', 'International brand famous for sports and lifestyle products.');

-- Insert sample data into Supplier Table
INSERT INTO Supplier (SupplierName, SupplierEmail, SupplierPhone)
VALUES ('Global Sports Supplies', 'contact@globalsports.com', '123-456-7890'),
       ('SportGear Inc.', 'info@sportgear.com', '987-654-3210');

-- Insert sample data into Category Table
INSERT INTO Category (CategoryName, CategoryDesc)
VALUES ('Footwear', 'Various types of athletic and casual footwear.'),
       ('Apparel', 'Sports clothing and accessories.');

-- Insert sample data into Subcategory Table
INSERT INTO Subcategory (SubCategoryName, SubCategoryDesc, CategoryID)
VALUES ('Running Shoes', 'Shoes designed for running.', 1),
       ('Basketball Shoes', 'Shoes designed for playing basketball.', 1),
       ('Jackets', 'Sports jackets for various activities.', 2);

-- Insert sample data into Product Table
INSERT INTO Product (ProductName, ProductPrice, Stock, ProductRating, ProductDesc, BrandID, SupplierID)
VALUES ('Nike Air Zoom Pegasus', 120.00, 50, 5, 'Versatile and comfortable running shoes.', 1, 1),
       ('Adidas Ultraboost', 180.00, 30, 4, 'High-performance running shoes with responsive cushioning.', 2, 2),
       ('Lining shirt', 180.00, 30, 4, 'High-performance running shoes with responsive cushioning.', 1, 2),
       ('Lining ningli', 180.00, 30, 4, 'High-performance running shoes with responsive cushioning.', 2, 2);

-- Insert sample data into ProductCategory Table
INSERT INTO ProductCategory (ProductID, CategoryID, SubCategoryID)
VALUES (1, 1, 1),
       (2, 1, 1),
       (3, 2, 3),
       (4, 2, 3);

-- Insert sample data into Contact Table
INSERT INTO Contact (Name, Email, Message)
VALUES ('John Doe', 'john.doe@example.com', 'I would like to know more about your running shoes.'),
       ('Jane Smith', 'jane.smith@example.com', 'Do you have any discounts on basketball shoes?');

-- Insert sample data into Images Table
INSERT INTO Images (Image, ProductID)
VALUES ('https://d.scdn.gr/images/sku_main_images/010754/10754027/20170404133057_adidas_ultraboost_ba8844.jpeg', 1),
       ('https://th.bing.com/th/id/OIP.qIe6PQWXWum7NQrgoPEOPQHaFj?rs=1&pid=ImgDetMain', 2),
       ('https://ae01.alicdn.com/kf/HTB1bHUKw5CYBuNkHFCcq6AHtVXa2/Li-Ning-Men-Badminton-T-shirts-AT-DRY-Breathable-Comfort-LiNing-Sports-Competition-Tees-Tops-T.jpg', 3),
       ('https://th.bing.com/th/id/OIP.BzId_96BWNPjaZYXKwu9KQHaHa?w=800&h=800&rs=1&pid=ImgDetMain', 4);

-- Insert sample data into Role Table
INSERT INTO Role (RoleName, RoleDesc)
VALUES ('Admin', 'Administrator with full access.'),
       ('Customer', 'Regular customer with limited access.');

-- Insert sample data into User Table
INSERT INTO `User` (Username, Password, RoleID, Avatar, FullName, Gender, Phone, Email, Address)
VALUES ('admin', 'adminpass', 1, 'avatar1.jpg', 'Admin User', 'Male', '111-222-3333', 'admin@example.com', '123 Admin St.'),
       ('johndoe', 'johnpass', 2, 'avatar2.jpg', 'John Doe', 'Male', '444-555-6666', 'john.doe@example.com', '456 John St.');

-- Insert sample data into Feedback Table
INSERT INTO Feedback (UserID, ProductID, Rating, Content, Image, FeedbackDate, Status)
VALUES (2, 1, 5, 'Great running shoes!', 'feedback1.jpg', CURDATE(), 1),
       (2, 2, 4, 'Very comfortable.', 'feedback2.jpg', CURDATE(), 1);

-- Insert sample data into UsersWishList Table
INSERT INTO UsersWishList (UserID, ProductID)
VALUES (2, 1),
       (2, 2);

-- Insert sample data into UserCart Table
INSERT INTO UserCart (UserID, ProductID, Quantity, TotalPrice)
VALUES (2, 1, 2, 240.00),
       (2, 2, 1, 180.00);

-- Insert sample data into OrderStatus Table
INSERT INTO OrderStatus (Name, Description)
VALUES ('Pending', 'Order is pending.'),
       ('Shipped', 'Order has been shipped.');

-- Insert sample data into PaymentMethod Table
INSERT INTO PaymentMethod (Name, Description)
VALUES ('Credit Card', 'Payment via credit card.'),
       ('PayPal', 'Payment via PayPal.');

-- Insert sample data into Order Table
INSERT INTO `Order` (UserID, FullName, OrderDate, DeliverDate, Phone, Email, `Address`, PaymentMethodID, TotalPrice, StatusID)
VALUES (2, 'John Doe', CURDATE(), CURDATE() + INTERVAL 7 DAY, '4445556666', 'john.doe@example.com', '456 John St.', 1, 420.00, 1);

-- Insert sample data into OrderDetail Table
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Price)
VALUES (1, 1, 2, 240.00),
       (1, 2, 1, 180.00);

-- Insert sample data into Discount Table
INSERT INTO Discount (ProductID, Amount, StartDate, EndDate, Status)
VALUES (1, 20.00, CURDATE(), CURDATE() + INTERVAL 30 DAY, 1),
       (2, 15.00, CURDATE(), CURDATE() + INTERVAL 30 DAY, 1);

-- Insert sample data into Refund Table
INSERT INTO Refund (OrderDetailID, Reason, RefundStatus)
VALUES (1, 'Size too small', 0),
       (2, 'Changed mind', 0);

-- Insert sample data into blog Table
INSERT INTO Blog (BlogTitle, Content, CreateBy, Img)
VALUES ('Top 10 Running Shoes', 'A review of the top 10 running shoes for 2024.', 1, '1'),
       ('How to Choose the Right Sportswear', 'Tips and tricks for selecting the best sportswear.', 2, '2');

-- Queries to verify data
SELECT p.*, c.CategoryName, i.Image 
FROM Product p
JOIN ProductCategory pc ON p.ProductID = pc.ProductID
JOIN Category c ON c.CategoryID = pc.CategoryID
JOIN Images i ON i.ProductID = p.ProductID
WHERE c.CategoryID = 2;

SELECT b.*, u.FullName 
FROM Blog b 
JOIN `User` u ON b.CreateBy = u.UserID;

-- Update content in blog table
UPDATE Blog 
SET Content = 'The Novablast 4 stands out in the all-rounder game, bringing a whole new level of comfort while sustaining stability, responsiveness, and reliable durability. Novablast 4 repeatedly excels in our lab tests and actual runs, rightfully claiming its throne as the ultimate running shoe.\n\nIndulging in this shoe is an absolute delight. The ultra-stacked midsole is our main star as it oozes divine levels of comfort for double-digit miles. Our durometer confirmed our sensations, as it measured 28.7% softer than average. Despite its plush nature, the cushion brings out a vibrant and responsive ride for faster days.\n\nOur runs feel stable regardless of our pace. Novablast 4 offers an extra width of 9.6/4.7 mm in the forefoot and heel to ensure we land securely no matter our foot strike. We can run mindlessly as the midsole flows with our movements. Our flex test confirms it’s 13.5% more adaptive than average.\n\nNovablast 4 proves its durability as the midsole had minor creasing and the outsole barely had scratches after long miles of running against hard pavements. We didn’t feel any difference in terms of performance, showing it’s a reliable and long-lasting running partner.\n\nWhile Novablast 4 can go fast, we feel it lacks the explosive power of a racer. For PB-chasers, exploring other options might be the way to go.' 
WHERE BlogID = 1;
