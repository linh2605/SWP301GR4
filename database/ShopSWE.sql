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
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    RoleID INT NOT NULL,
    Avatar TEXT,
    FullName VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other'),
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
    Address TEXT,
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
VALUES 
('Adidas Shirt 1', 180.00, 50, 4, 'Adidas Shirt', 2, 2),
('Adidas Shirt 2', 185.00, 50, 4, 'Adidas Shirt', 2, 2),
('Adidas Shirt 3', 190.00, 50, 4, 'Adidas Shirt', 2, 2),
('Adidas Shirt 4', 195.00, 50, 4, 'Adidas Shirt', 2, 2),
('Adidas Shirt 5', 200.00, 50, 4, 'Adidas Shirt', 2, 2),
('Nike Shirt 1', 180.00, 50, 4, 'Nike Shirt', 1, 1),
('Nike Shirt 2', 185.00, 50, 4, 'Nike Shirt', 1, 1),
('Nike Shirt 3', 190.00, 50, 4, 'Nike Shirt', 1, 1),
('Nike Shirt 4', 195.00, 50, 4, 'Nike Shirt', 1, 1),
('Nike Shirt 5', 200.00, 50, 4, 'Nike Shirt', 1, 1),
('Puma Shirt 1', 180.00, 50, 4, 'Puma Shirt', 3, 1),
('Puma Shirt 2', 185.00, 50, 4, 'Puma Shirt', 3, 1),
('Puma Shirt 3', 190.00, 50, 4, 'Puma Shirt', 3, 1),
('Puma Shirt 4', 195.00, 50, 4, 'Puma Shirt', 3, 1),
('Puma Shirt 5', 200.00, 50, 4, 'Puma Shirt', 3, 1),
('Adidas Shoes 1', 220.00, 50, 5, 'Adidas Shoes', 2, 2),
('Adidas Shoes 2', 225.00, 50, 5, 'Adidas Shoes', 2, 2),
('Adidas Shoes 3', 230.00, 50, 5, 'Adidas Shoes', 2, 2),
('Adidas Shoes 4', 235.00, 50, 5, 'Adidas Shoes', 2, 2),
('Adidas Shoes 5', 240.00, 50, 5, 'Adidas Shoes', 2, 2),
('Nike Shoes 1', 220.00, 50, 5, 'Nike Shoes', 1, 1),
('Nike Shoes 2', 225.00, 50, 5, 'Nike Shoes', 1, 1),
('Nike Shoes 3', 230.00, 50, 5, 'Nike Shoes', 1, 1),
('Nike Shoes 4', 235.00, 50, 5, 'Nike Shoes', 1, 1),
('Nike Shoes 5', 240.00, 50, 5, 'Nike Shoes', 1, 1),
('Puma Shoes 1', 220.00, 50, 5, 'Puma Shoes', 3, 1),
('Puma Shoes 2', 225.00, 50, 5, 'Puma Shoes', 3, 1),
('Puma Shoes 3', 230.00, 50, 5, 'Puma Shoes', 3, 1),
('Puma Shoes 4', 235.00, 50, 5, 'Puma Shoes', 3, 1),
('Puma Shoes 5', 240.00, 50, 5, 'Puma Shoes', 3, 1);

-- Insert sample data into Images Table with provided URLs
INSERT INTO Images (Image, ProductID)
VALUES 
('https://vinsport.vn/wp-content/uploads/2020/09/Bo-quan-ao-the-thao-thoi-trang-khong-logo-adidas-3-ba-la-nhieu-mau-xanh.jpg', 1),
('https://vinsport.vn/wp-content/uploads/2020/09/Bo-quan-ao-the-thao-thoi-trang-khong-logo-adidas-3-ba-la-nhieu-mau-trang-tui.jpg', 2),
('https://vn-test-11.slatic.net/p/1a1f9f9e41c4466efd5c7f525be5a531.jpg', 3),
('https://s4.shopbay.vn/files/285/ao-training-tuyen-duc-euro-2021-60f2633744fdd.jpg', 4),
('https://filebroker-cdn.lazada.vn/kf/S4a20d1b337bd477c941ef4d0941d2f06u.jpg', 5),
('https://vinsport.vn/my_uploads/2022/06/Bo-do-quan-ao-da-bong-hang-da-banh-clb-bara-barcelona-soc-xanh-vang-cam-logo-theu-me-thai-0.jpg', 6),
('https://vinsport.vn/wp-content/uploads/2023/09/Bo-quan-ao-bong-da-Chelsea-23-24-san-nha-mau-xanh-tim-than-full-logo-nike-nam-2023-2024.jpg', 7),
('https://www.sport9.vn/images/thumbs/002/0021514_bo-quan-ao-bong-da-doi-tuyen-quoc-gia-italia-mau-trang-xanh.jpeg?preset=large&watermark=default', 8),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX3IMmKcKmcTGp_D77ZMzIGFOS4wcRh2jgvA&s', 9),
('https://vn-live-01.slatic.net/p/6438dc96529edd2a5cf1f8695bb21a2a.jpg', 10),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgPhK6GcA9gsh8UU7St-0TZtoXPB5Jp5zxCQ&s', 11),
('https://bizweb.dktcdn.net/thumb/grande/100/180/757/products/4648116quan-ao-bong-da-khong-logo-puma-speed-trang-jpeg.jpg?v=1487739238467', 12),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1WsLVPdcginDSYszp9SOMPLODhRYlJN3xuvvVdL5gKgoKOYI2qrZClxvOxMDj4Jn5Ez4&usqp=CAU', 13),
('https://vinsport.vn/my_uploads/2022/07/Bo-quan-ao-bong-da-doi-tuyen-quoc-gia-y-italia-jersey-trang-vien-xanh-moi-puma.jpg', 14),
('https://down-vn.img.susercontent.com/file/f3c40a83a5aecf9c66a79e49bcec88b9', 15),
('https://www.sport9.vn/images/uploaded/blog%206/adidas-x-crazyfast%20(5).jpg', 16),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAQQGa7vw6cl38KplcicwiDbBsaShchzyfgw&s', 17),
('https://product.hstatic.net/1000402257/product/giay_da_bong_predator_freak_3_d2c203ca889d401ea32ada3bf5fdfcc7_grande.jpg', 18),
('https://pos.nvncdn.com/6a2bd9-54198/ps/20230817_hTUI4Zvic7.jpeg', 19),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUqx6s_irzOMvHUcHr6T8auKmkXk5bnYdL0Q&s', 20),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNNWzdyVcGB8wxoiMK6I52z8IztY-QWes5QQ&s', 21),
('https://product.hstatic.net/1000061481/product/anh_sp_add_web_3-02-02-02_d327c394fb334b45a65d6ef60c6a9042_1024x1024.jpg', 22),
('https://img.websosanh.vn/v2/users/root_product/images/giay-da-bong-nike-vapor-cv0978/j7qsz1xuhh03y.jpg', 23),
('https://thuhiensport.com/wp-content/uploads/2019/04/giay-da-bong-nike.jpg', 24),
('https://zocker.vn/pic/Images/Module/News/images/tai-sao-nen-chon-giay-da-bong-san-co-nhan-tao-nike-4.jpg', 25),
('https://product.hstatic.net/200000601263/product/374e8129a09e400698398657ad80eeb9_6927eaab7a054094979292f6ece54cba.jpg', 26),
('https://product.hstatic.net/200000601263/product/75b9d8dc4f5a44a8b8608e31f86a9a31_07cd36b015b24068bf825568d73bd8dd.jpg', 27),
('https://bizweb.dktcdn.net/100/340/988/products/giay-da-bong-38-4201c148-5c3d-4c2b-b837-74d5505bbf0c.jpg?v=1625903205387', 28),
('https://giaydabongtot.com/wp-content/uploads/2023/03/IMG_E0526.jpg', 29),
('https://giaydabongtot.com/wp-content/uploads/2023/02/IMG_E0530-1000x1000.jpg', 30);

-- Insert sample data into Role Table
INSERT INTO Role (RoleName, RoleDesc)
VALUES ('Admin', 'Administrator with full access.'),
       ('Marketing', 'Marketing personnel with access to marketing operations.'),
       ('Sale', 'Sales personnel with access to sales operations.'),
       ('Customer', 'Regular customer with limited access.');

-- Insert sample data into User Table
INSERT INTO User (Username, Password, RoleID, Avatar, FullName, Gender, Phone, Email, Address)
VALUES ('admin', 'adminpass', 1, 'avatar1.jpg', 'Admin User', 'Male', '111-222-3333', 'admin@example.com', '123 Admin St.'),
       ('johndoe', 'johnpass', 4, 'avatar2.jpg', 'John Doe', 'Male', '444-555-6666', 'john.doe@example.com', '456 John St.'),
       ('sale1', 'sale1pass', 3, 'avatar3.jpg', 'Alice Brown', 'Female', '222-333-4444', 'alice.brown@example.com', '100 Sale St.'),
       ('sale2', 'sale2pass', 3, 'avatar4.jpg', 'Bob Smith', 'Male', '333-444-5555', 'bob.smith@example.com', '101 Sale St.'),
       ('sale3', 'sale3pass', 3, 'avatar5.jpg', 'Carol Johnson', 'Female', '444-555-6666', 'carol.johnson@example.com', '102 Sale St.'),
       ('sale4', 'sale4pass', 3, 'avatar6.jpg', 'David Lee', 'Male', '555-666-7777', 'david.lee@example.com', '103 Sale St.'),
       ('sale5', 'sale5pass', 3, 'avatar7.jpg', 'Eva Davis', 'Female', '666-777-8888', 'eva.davis@example.com', '104 Sale St.'),
       ('marketing1', 'marketing1pass', 2, 'avatar8.jpg', 'Fiona Harris', 'Female', '777-888-9999', 'fiona.harris@example.com', '200 Marketing St.'),
       ('marketing2', 'marketing2pass', 2, 'avatar9.jpg', 'George Clark', 'Male', '888-999-0000', 'george.clark@example.com', '201 Marketing St.'),
       ('marketing3', 'marketing3pass', 2, 'avatar10.jpg', 'Hannah Scott', 'Female', '999-000-1111', 'hannah.scott@example.com', '202 Marketing St.'),
       ('marketing4', 'marketing4pass', 2, 'avatar11.jpg', 'Ian Adams', 'Male', '000-111-2222', 'ian.adams@example.com', '203 Marketing St.'),
       ('marketing5', 'marketing5pass', 2, 'avatar12.jpg', 'Jackie Thompson', 'Female', '111-222-3333', 'jackie.thompson@example.com', '204 Marketing St.');

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
VALUES 
(2, 1, 1, 180.00),
(2, 2, 1, 185.00),
(2, 3, 1, 190.00),
(2, 4, 1, 195.00),
(2, 5, 1, 200.00),
(2, 6, 1, 180.00),
(2, 7, 1, 185.00),
(2, 8, 1, 190.00),
(2, 9, 1, 195.00),
(2, 10, 1, 200.00),
(2, 11, 1, 180.00),
(2, 12, 1, 185.00),
(2, 13, 1, 190.00),
(2, 14, 1, 195.00),
(2, 15, 1, 200.00),
(2, 16, 1, 220.00),
(2, 17, 1, 225.00),
(2, 18, 1, 230.00),
(2, 19, 1, 235.00),
(2, 20, 1, 240.00),
(2, 21, 1, 220.00),
(2, 22, 1, 225.00),
(2, 23, 1, 230.00),
(2, 24, 1, 235.00),
(2, 25, 1, 240.00),
(2, 26, 1, 220.00),
(2, 27, 1, 225.00),
(2, 28, 1, 230.00),
(2, 29, 1, 235.00),
(2, 30, 1, 240.00);

-- Insert sample data into OrderStatus Table
INSERT INTO OrderStatus (Name, Description)
VALUES ('Pending', 'Order is pending.'),
       ('Shipped', 'Order has been shipped.');

-- Insert sample data into PaymentMethod Table
INSERT INTO PaymentMethod (Name, Description)
VALUES ('Credit Card', 'Payment via credit card.'),
       ('PayPal', 'Payment via PayPal.');

-- Insert sample data into `Order` Table
INSERT INTO `Order` (UserID, FullName, OrderDate, DeliverDate, Phone, Email, Address, PaymentMethodID, TotalPrice, StatusID)
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

INSERT INTO productcategory (ProductID, CategoryID) Values 
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), 
(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), 
(15, 1), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2), 
(22, 2), (23, 2), (24, 2), (25, 2), (26, 2), (27, 2), (28, 2), 
(29, 2), (30, 2);


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
