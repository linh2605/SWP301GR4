USE [master]
GO

-- Drop the database if it exists
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SportShopOnline')
BEGIN
    ALTER DATABASE SportShopOnline SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE SportShopOnline
END
GO

-- Create the database
CREATE DATABASE SportShopOnline
GO

USE SportShopOnline
GO

-- CREATE TABLES

-- Brand Table
CREATE TABLE Brand (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(50) UNIQUE NOT NULL,
    BrandDesc NVARCHAR(MAX)
);

-- Supplier Table
CREATE TABLE Supplier (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName NVARCHAR(50) NOT NULL,
    SupplierEmail NVARCHAR(50),
    SupplierPhone NVARCHAR(30)
);

-- Category Table
CREATE TABLE Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50) UNIQUE NOT NULL,
    CategoryDesc NVARCHAR(MAX)
);

-- Subcategory Table
CREATE TABLE Subcategory (
    SubCategoryID INT IDENTITY(1,1) PRIMARY KEY,
    SubCategoryName NVARCHAR(50) UNIQUE NOT NULL,
    SubCategoryDesc NVARCHAR(MAX),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Product Table
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) UNIQUE NOT NULL,
    ProductPrice DECIMAL(10, 2) CHECK (ProductPrice >= 0),
    Stock INT CHECK (Stock >= 0),
    ProductRating INT CHECK (ProductRating BETWEEN 0 AND 5),
    ProductDesc NVARCHAR(MAX) NOT NULL,
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
    ContactID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(150),
    Email NVARCHAR(150),
    Message NVARCHAR(3500)
);

-- Images Table
CREATE TABLE Images (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,
    Image NVARCHAR(MAX),
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Role Table
CREATE TABLE Role (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(50) NOT NULL UNIQUE,
    RoleDesc NVARCHAR(MAX)
);

-- User Table
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(50) NOT NULL,
    RoleID INT NOT NULL,
    Avatar NVARCHAR(MAX),
    FullName NVARCHAR(50),
    Gender NVARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    Phone NVARCHAR(20),
    Email NVARCHAR(50) UNIQUE,
    Address NVARCHAR(50),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

-- Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Content NVARCHAR(MAX),
    Image NVARCHAR(MAX),
    FeedbackDate DATE NOT NULL,
    Status INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- UsersWishList Table
CREATE TABLE UsersWishList (
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    PRIMARY KEY (UserID, ProductID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- UserCard Table
CREATE TABLE UserCard (
    UserCardID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- OrderStatus Table
CREATE TABLE OrderStatus (
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    Description NVARCHAR(100)
);

-- PaymentMethod Table
CREATE TABLE PaymentMethod (
    PaymentMethodID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    Description NVARCHAR(100)
);

-- Order Table
CREATE TABLE [Order] (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    FullName NVARCHAR(MAX),
    OrderDate DATE,
    DeliverDate DATE,
    Phone NVARCHAR(11),
    Email NVARCHAR(MAX),
    [Address] NVARCHAR(MAX),
    PaymentMethodID INT,
    TotalPrice DECIMAL(10, 2),
    StatusID INT NOT NULL,
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID),
    FOREIGN KEY (StatusID) REFERENCES OrderStatus(StatusID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

-- OrderDetail Table
CREATE TABLE OrderDetail (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT CHECK (Quantity > 0),
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Discount Table
CREATE TABLE Discount (
    DiscountID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    Amount DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    Status BIT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Refund Table
CREATE TABLE Refund (
    OrderDetailID INT PRIMARY KEY,
    RefundDate DATETIME DEFAULT GETDATE(),
    Reason NVARCHAR(MAX),
    Image NVARCHAR(MAX),
    RefundStatus INT, -- 1 is approved, 0 is default, -1 is declined
    DeclineReason NVARCHAR(MAX),
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetail(OrderDetailID)
);




INSERT INTO Brand (BrandName, BrandDesc)
VALUES
    ('John Doe', 'John Doe is a prolific author with many published works.'),
    ('Jane Smith', 'Jane Smith is an award-winning author known for her novels.'),
    ('Michael Johnson', 'Michael Johnson is a bestselling author of mystery novels.'),
	('Philip Gray','Philip Gray was inspired to write TWO STORM WOOD by his grandfather who fought in the First World War.He lives in London.'),
	('Harper Lee','Harper Lee was born in 1926 in Monroeville, Alabama. She attended Huntington College and studied law at the University of Alabama. She is the author of the acclaimed novels To Kill a Mockingbird and Go Set a Watchman, and was awarded the Pulitzer Prize, the Presidential Medal of Freedom and numerous other literary awards and honours. She died on 19 February 2016.'),
	('Richard Osman','Richard Osman is an author, producer and television presenter. His first three novels, The Thursday Murder Club, The Man Who Died Twice and The Bullet That Missed were multi-million-copy record-breaking bestsellers around the world. The Last Devil to Die is his fourth book. He lives in London with his wife, Ingrid, and their cat Liesl.'),
	('Paul McCartney','Born in Liverpool in 1942, Paul McCartney was raised in the city and educated at the Liverpool Institute. Since writing his first song at 14, McCartney has dreamed and dared to be different. He lives in England.'),
	('Ladybird','We make growing up the best story ever! Here at Ladybird, we publish playful books for little hands. From touch-and-feel books to bedtime stories and non-fiction, we help 0-7s to learn, play and grow - sparking plenty of smiles along the way. The home of Ten Minutes to Bed, Baby Touch, Peppa Pig and Hey Duggee, we know just how to capture curious little imaginations and guide them from one story to the next.'),
	('J.K. Rowling','	Joanne Rowling CH OBE FRSL, best known by her pen name J. K. Rowling, is a British author and philanthropist. She wrote Harry Potter, a seven-volume fantasy series published from 1997 to 2007'),
	('George R.R. Martin','George Raymond Richard Martin, also known as GRRM, is an American novelist, screenwriter, television producer and short story writer.'),
	('Michelle Obama','Michelle LaVaughn Robinson Obama is an American attorney and author who served as the first lady of the United States from 2009 to 2017, being married to former president Barack Obama. Raised on the South Side of Chicago, Obama is a graduate of Princeton University and Harvard Law School.'),
	('Dan Brown','Daniel Gerhard Brown is an American author best known for his thriller novels, including the Robert Langdon novels Angels & Demons, The Da Vinci Code, The Lost Symbol, Inferno, and Origin. His novels are treasure hunts that usually take place over a period of 24 hours.'),
	('Michael Crichton','John Michael Crichton was an American writer and filmmaker. His books have sold over 200 million copies worldwide, and over a dozen have been adapted into films. His literary works heavily feature technology and are usually within the science fiction, techno-thriller, and medical fiction genres.'),
	('Jane Austen','Jane Austen was an English novelist known primarily for her six novels, which implicitly interpret, critique, and comment upon the British landed gentry at the end of the 18th century. Austens plots often explore the dependence of women on marriage for the pursuit of favourable social standing and economic security.'),
	('Gillian Flynn','Gillian Schieber Flynn is an American author, screenwriter, and producer. She is known for writing the thriller and mystery novels Sharp Objects, Dark Places, and Gone Girl, which are all critically acclaimed.'),
	('F. Scott Fitzgerald','Francis Scott Key Fitzgerald was an American novelist, essayist, and short story writer. He is best known for his novels depicting the flamboyance and excess of the Jazz Agea term he popularized in his short story collection Tales of the Jazz Age.'),
	('Donna Tartt','Donna Louise Tartt is an American novelist and essayist. Her novels are The Secret History, The Little Friend, and The Goldfinch. Tartt won the WH Smith Literary Award for The Little Friend and the Pulitzer Prize for Fiction for The Goldfinch.'),
	('Art Spiegelman','Art Spiegelman is an American cartoonist, editor, and comics advocate best known for his graphic novel Maus. His work as co-editor on the comics magazines Arcade and Raw has been influential, and from 1992 he spent a decade as contributing artist for The New Yorker.'),
	('Alan Moore, Dave Gibbons',''),
	('Nicholas Sparks','Nicholas Charles Sparks is an American romance novelist, screenwriter, and film producer. He has published twenty-three novels, all New York Times bestsellers, and two works of non-fiction, with over 115 million copies sold worldwide in more than 50 languages.'),
	('Rupi Kaur','Rupi Kaur is a Canadian poet, illustrator, photographer, and author. Born in Punjab, India, Kaur immigrated to Canada at a young age with her family. She began performing poetry in 2009 and rose to fame on Instagram, eventually becoming a popular poet through her three collections of poetry.'),
	('Stephen King','Stephen Edwin King is an American author of horror, supernatural fiction, suspense, crime, science-fiction, and fantasy novels. Described as the "King of Horror", his books have sold more than 350 million copies as of 2006, and many have been adapted into films, television series, miniseries, and comic books.'),
	('Jhumpa Lahiri','Nilanjana Sudeshna "Jhumpa" Lahiri is an Indian American author known for her short stories, novels, and essays in English and, more recently, in Italian.'),
	('George Saunders','George Saunders is an American writer of short stories, essays, novellas, childrens books, and novels. His writing has appeared in The New Yorker, Harpers, McSweeneys, and GQ. He also contributed a weekly column, American Psyche, to The Guardians weekend magazine between 2006 and 2008. '),
	('Suzanne Collins','Suzanne Collins is an American author and television writer. She is best known as the author of the young adult dystopian book series The Hunger Games.'),
	('John Green','John Michael Green is an American author, YouTuber, podcaster, and philanthropist. His books have more than 50 million copies in print worldwide, including The Fault in Our Stars, which is one of the best-selling books of all time.'),
	('E.H. Gombrich','Sir Ernst Hans Josef Gombrich OM CBE FBA was an Austrian-born art historian who, after settling in England in 1936, became a naturalised British citizen in 1947 and spent most of his working life in the United Kingdom.'),
	('Alain de Botton','Alain de Botton FRSL is a Swiss-born British author and public speaker. His books discuss various contemporary subjects and themes, emphasizing philosophys relevance to everyday life. He published Essays in Love, which went on to sell two million copies'),
	('Anne Frank','Annelies Marie Frank was a German-born Jewish girl who kept a diary in which she documented life in hiding under Nazi persecution. She is a celebrated diarist who described everyday life from her family hiding place in an Amsterdam attic.'),
	('Steven Bartlett', 'Steven Cliff Bartlett is a British-Nigerian entrepreneur and podcaster. He is the founder of Thirdweb, Flight Story and Flight Story Fund. He was the co-founder and co-CEO of Social Chain AG, but stepped down as CEO in 2020. In 2022, he began appearing as an investor on the BBC One show Dragons Den.'),

('Rupal Patel', 'Rupal Patel is an economist at the Bank of England. Rupal specialises in trying to prevent economic crises, which means you know who to blame when everything goes wrong.'),

('Jack Meaning', 'Jack Meaning is an economist at the Bank of England. Jack is focused on protecting the pound in your pocket, which means he goes to lots of long meetings about interest rates.'),

('Jane Dunn', 'Jane Dunn started her blog in 2014 after training at Ashburton Chefs Academy. Jane has baked on This Morning, James Martins Saturday Kitchen, and her recipes have been featured in The Times, Fabulous, Cosmopolitan and Baking Heaven Magazine. Her first book, Janes Patisserie, is the fastest selling baking book of all time, a No.1 Sunday Times bestseller and her second, Janes Patisserie Celebrate!, was also an instant No.1 bestseller.'),

('Nathan Anthony', 'Nathan Anthony is the no.1 bestselling author and creator of hit food platform Bored of Lunch. Nathan is a Northern Irish home cook who set up his food blog during lockdown to get people cooking, eating healthier and give them something to focus on during the pandemic. By day Nathan works at a FTSE100 company so cooks in a way to suit his hectic schedule. Initially aimed at busy professionals this quickly expanded to all those working from home, busy parents and those who want quick, calorie-controlled recipes. Bored of Lunch now has 2.4 million followers across all platforms.'),

('James Clear', 'James Clear is an expert on habits and decision making. He made his name as the author of one of the fastest-growing email newsletters in history, which grew from zero to 100,000 subscribers in under two years. Today, his newsletter has over 400,000 subscribers, and his articles at jamesclear.com receive 10 million hits each year. His work frequently appears in publications including the New York Times, Forbes and Business Insider.'),

('Thomas Erikson', 'Thomas Erikson is a Swedish behavioural expert, bestselling author and active lecturer. For more than 20 years, he has travelled across Europe delivering lectures and seminars in Swedish and in English to executives and managers in companies including IKEA, Coca Cola, Microsoft, Volva and KIA Motors. Surrounded by Idiots (Omgiven Av Idioter) is a Swedish runaway bestseller, selling more than 1 million copies in Sweden alone. It has sold over 3 million copies worldwide, since it was first published in 2014, and has been translated into 55 languages.'),

('Ben Macintyre', 'Ben Macintyre is the multimillion-copy bestselling author of books including Colditz, Agent Sonya, SAS: Rogue Heroes, The Spy and the Traitor, Agent Zigzag, Operation Mincemeat and A Spy Among Friends. He is a columnist and Associate Editor at The Times, and has worked as the newspapers correspondent in New York, Paris and Washington. Several of his books have been made into films and television series, including Operation Mincemeat, A Spy Among Friends and SAS: Rogue Heroes.'),

('Mark Urban', 'Mark Urban is the Diplomatic Editor of BBCs Newsnight programme and was formerly defence correspondent for the Independent. He formerly served in the British Army, both in the Royal Tank Regiment and in the Territorial Army. He is the author of several books, including Task Force Black (his deep-dive look at the SAS in the Iraq War, which was a Sunday Times number one bestseller) and The Skripal Files, a Sunday Times Best Politics Book of 2018.'),

('Wolfram Eilenberger', 'Wolfram Eilenberger is a founding editor of Philosophie Magazin and host of the Sternstunde Philosophie television programme. He has taught philosophy at the University of Toronto, Indiana University, the Berlin University of the Arts and ETH Zrich. His most recent book, Time of the Magicians, was a runaway bestseller on publication in Germany, where it won the prestigious Bayerischer Buchpreis, as well as in Spain and Italy, and has been translated into more than thirty languages.'),

('Caroline Criado Perez', 'Caroline Criado Perez is a writer, broadcaster and award-winning feminist campaigner. Her most notable campaigns have included co-founding The Womens Room, getting a woman on Bank of England banknotes, forcing Twitter to revise its procedures for dealing with abuse and successfully campaigning for a statue of suffragist Millicent Fawcett to be erected in Parliament Square. She was the 2013 recipient of the Liberty Human Rights Campaigner of the Year Award, and was awarded an OBE in the Queens Birthday Honours 2015. Invisible Women has won the FT & McKinsey Business Book of the Year Award, the Books Are My Bag Readers Choice Award and the Royal Society Science Book Prize. She lives in London.'),

('Neil deGrasse Tyson', 'Neil deGrasse Tyson was born in New York City the same week NASA was founded. After a BA in Physics from Harvard, a PhD in Astrophysics from Columbia, and a Postdoctoral research fellowship at Princeton, Tyson become the Frederick P. Rose Director of the Hayden Planetarium, where he has served since 1996. Neil is the host of the award-winning Cosmos TV series, and StarTalk, the first ever science-based talk show and podcast. He has over 13 million Twitter followers, among the top 200 people in the world.'),

('Bill Bryson', 'Bill Bryson was born in Des Moines, Iowa, in 1951. His bestselling books include The Road to Little Dribbling, Notes from a Small Island, A Walk in the Woods, One Summer and The Life and Times of the Thunderbolt Kid. In a national poll, Notes from a Small Island was voted the book that best represents Britain.'),

('Raphael Honigstein', 'Raphael Honigstein is the UKs top expert on German football. He is a columnist for the Guardian and ESPN, writes for Sddeutsche Zeitung in Germany and appears as a pundit for BT Sport and ESPN as well as Sky in Germany. He is also a regular fixture on the Guardians award-winning podcast, Football Weekly. His first book, Englischer Fussball, was shortlisted for Football Book of the Year and his latest book is Das Reboot: How German Football Reinvented Itself and Conquered the World.'),

('George Kimball', 'George E. Kimball III (December 20, 1943  July 6, 2011) was an American author and journalist who spent 25 years as a sports columnist for the Boston Herald before retiring in 2005. Considered one of the foremost boxing writers of his era, he is the author of Four Kings: Leonard, Hagler, Hearns, Duran, and the Last Great Era of Boxing (2008) and "Manly Art:'),

('Beatrix Potter', 'Beatrix Potter is one of the worlds best-loved childrens authors of all time. From her first book, The Tale of Peter Rabbit (1902) she went on to create a series of stories based around animal characters including Mrs Tiggy-winkle, Mr Jeremy Fisher and Tom Kitten. Her humorous, lively tales and beautiful illustrations have become a natural part of childhood. A source of inspiration was the Lake District where she lived for the last thirty years of her life as a farmer and conservationist.'),

('Ed Vere', 'Ed Vere is an award-winning and New York Times bestselling writer and illustrator of picture books, including How To Be a Lion - winner of Oscars Book Prize - and Max the Brave which was named one of The Sunday Timess 100 Modern Childrens Classics.'),

('Farhana Islam', 'Farhana Islam is a Primary School Teacher with a passion for telling stories and empowering diverse voices. Not Now, Noor is her debut picture book.');

-- Insert data into the Publisher table
INSERT INTO Supplier (SupplierName, SupplierEmail, SupplierPhone)
VALUES
    ('ABC Publications', 'info@abc.com', '123-456-7890'),
    ('XYZ Publishers',  'info@xyz.com', '987-654-3210'),
    ('123 Publishing', 'info@123.com', '111-222-3333'),
    ('Scholastic', 'info@scholastic.com', '123-456-7890'),
    ('Bantam', 'info@bantam.com', '555-123-4567'),
    ('Simon & Schuster', 'info@simonschuster.com', '777-888-9999'),
    ('Crown Publishing', 'info@crownpublishing.com', '888-222-3333'),
    ('Doubleday', 'info@doubleday.com', '333-444-5555'),
    ('Ballantine Books', 'info@ballantinebooks.com', '999-555-4444'),
    ('Vintage Classics', 'info@vintageclassics.com', '777-555-6666'),
    ('Harper Perennial Modern Classics', 'info@harperperennial.com', '555-777-8888'),
    ('Andrews McMeel Publishing', 'info@andrewsmcmeel.com', '666-444-5555'),
    ('Anchor', 'info@anchorbooks.com', '222-666-7777'),
    ('Scribner', 'info@scribner.com', '444-999-8888'),
    ('Mariner Books', 'info@marinerbooks.com', '333-111-9999'),
    ('Random House', 'info@randomhouse.com', '111-222-3333'),
    ('Scholastic Press', 'info@scholasticpress.com', '666-777-8888'),
    ('Dutton Books', 'info@duttonbooks.com', '555-444-7777'),
    ('Phaidon Press', 'info@phaidonpress.com', '222-999-6666'),
    ('Penguin Classics', 'info@penguinclassics.com', '444-777-5555'),
    ('Oxford University Press', 'info@oxfordpress.com', '777-333-1111'),
    ('Ballantine Books', 'info@ballantinebooks.com', '999-888-7777'),
    ('Harper', 'info@harper.com', '111-555-4444'),
    ('W. W. Norton & Company', 'info@wwnorton.com', '888-444-5555'),
    ('Vintage', 'info@vintage.com', '555-666-7777'),
    ('Scribner', 'info@scribner.com', '777-666-5555'),
    ('Little, Brown and Company', 'info@littlebrown.com', '666-888-9999'),
    ('Pantheon', 'info@pantheonbooks.com', '333-777-8888'),
    ('DC Comics', 'info@dccomics.com', '222-555-4444'),
    ('Grand Central Publishing', 'info@grandcentralpublishing.com', '888-777-6666');


INSERT INTO [Role](RoleName, RoleDesc) VALUES
	('Admin', 'Controls and oversees the entire system, responsible for system settings, user management, and data statistics.'),
	('Marketing','Manages inventory of books,manage books detail , refund , discount and feedback,wishlist of customer about books  assists with customer inquiries'),
	('Sale','Manages order list and order detail '),
	('Customer','Searches for books, reads reviews, places orders, makes payments,refunds,adds books to wishlist  and can provide feedback.');
--user table
INSERT INTO [User](Fullname, username, [password], RoleID, Email, Avatar, Gender) VALUES
	('Admin', 'admin', 'de/EELwjsNDdXaxj5sBz0CQGwBk=', 1, 'admin@gr6.com', 'data:image/png;base64,UklGRswLAABXRUJQVlA4IMALAADwfQCdASpYAlgCPlEokEajoqGhIhUYCHAKCWlu4XdOAPblopP3MbPsf9R/xXbD/e+Wp3Ubs9pv1FfeeuPsN+KWgj+pN8qzN/qfWNmg9UWvM0APzt5+n/j/ovQ39F/s78Bv8v/ufpd+w/91vZu/YD//gzaMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuL0jPxk4J/T40dFlLjc6jQGozdGODo4Kb3HWACvELjALqagCuoWuyxs+wZpzD2peOt8nUoG4wrABXiFxgF1NQBXh/Frvz0TDcVX/gf5jUBY/2GMQuMAupqAK8QuL/pEACHw0zumy6lOLb3wRbaZ3U1AFeIXE/DYOJrlM7qaLaohGNS3gArxC4wC6moArwf0/Ph6dI/xO80oVADk8AK8QuMAupqAK8QtzOqn+0VXV/4ux0vWeBXWACvELjALqagCuoTkb3cAHBrSpp4mOc3mQma+XU1AFeIXGAXU1AFeDkHlYCC1rg5LV23CMcb9lkrrABXiFxgF1NQBXUjAgVX+34MqjUpOE32baID80WHMTUoP1/q3DfzRP0tYU4TeBxwV1KrpeYuMAupqAK8QuL/q0YnCC0VSdaT09C97yCXAytjv1RNTv+3ITTr1hWBFc2I7IPcSRgF1NQBXiFxf9WnQtq3G+J3wYUn7qCy6bwa5rhrxC4wC6moArwcmUd1uke+CLbTOjDrAbPot5DfBdTUAV4hcYBRvzcVJdzO6moArwcaO7XQ4p1NQBXiFxgFxDXvRmQEW2md1NPHYMI3jX011NQBXiFxgFxQMFBfbxC4wC6mnj4cp8TTe46wAV4hcTxmf7agCvELjAKM8+9MQuMAupqAK8P7J3DUXNAcZ2oHPN9CGpMHaxVM0McdlVUplU9+zCWYdB3MuEAwE6qMONZ0m7cJzfGOb/3Vwb5to1HUCsAFeIXGAXU1AIBN7jrABX1qmoArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArw/gAD+/dpXxzMIMgIAAAAAAAAAAAAAAAF0A4G6jjyOEwFj04lORGhzLNuk0NoPPtHJvFMmckyIePeyzYW8h2otAwf/Wy6ttJaCIU2v6KThP8PDLg5asi/Q7WPYswZSavwnnE9zpCspe6By0pzT5HMfkP61i+F2WyMo1K30JInQ9YecCqmG/OtfCqFBeXb+N+g4fhvx0ZLTPfp2mPgijoTIyJaAqPhrlft7eStyS4QU/DHZbNd4vIYjBjqGZpifmnh2T+/CW40ba7CZG9hV+xyC5hsgwTPvg8JPmI7mYscgNag/TJVUP1lMUR57tO5R5l/27U6fPPziYHfex7a5FxLjAFRrnDWSJjdk/t4MIfyDVVvR1t6jryt7XUrRTgZA41xd+7/AsrPECCKVp/m6f8UwHKuDtgk2po4utoBErSgOnXxzpyn9rIryF+vfZ9p+2mi1tXGgQAL4ifReXgbD7cqj6TMjixYuj2AIu1u845BKOUxoQxS1WMeoME5lYdpktU3KBMcfgmCGd5MC2pTjG0hzIgBTbFnHxbqEaCmK/GX+KGLDair6IdH72QKMCnjTipriY2fhX9b+PU60BzbLWsz3ebcs3CMXbewv/qcYX38N30ut970VD9AGpj7ugiCLgI0bZ0XD/zf2GGF7KhDoNUs+5DHbMH87aIE3yfvtx6k8e5nsYCjYzEJ3cwxOIByIFO38XF1Z0jPCdOFWdmmfxwuWG51J4LrqGdzrzvzt9sAxTCcgOaz/QZcrD6w8l4irnKCz35PhGFXk3rVnwB9+mkqApYEoZc0a/w6NYhOQN0mmRmzZz3/wwfPWRcHbmJFq7UXPDpAy/HG753B0Ox/r/TJDqDo4GgB2Dn9a/RIstOAU5PEJ3K3Rf9TPqAEVO04qTaqoMFCYU1SdW7Pu6UxWyMAiBINiOiHLM8+f8hdZBblk9G2ZuWVx58VLluBR2W9Mxo+5c9V24tX+njJ/U4n2LzdMPru8dL8NPkwT7+/w5KC+YnRs2wFTbopGa0gwfNzv5G06dDi66oAhvi3Apcjx+JMfn/9oF7mDQX3QThalx+VInqDbxRqdiiJ4t6lnmhTHtWj99TwJXFGODRkdAHN+Nb3U2FuOXLulIM8TG/yaUz4eHv3xLcrFiNG5LtgE/hhZdJIrIomJrYueZETa1XjE3IZLzjHjaaggNMxId7MV1F4ihCLl5/hGLFGv85RYOQ9af5B0P22Rmys3lGT3D0KWkuZpd3yvQpXfEmqrvbzT+Yd7zoSsCgm/X1GN4AO1Tyzki8gBZ0L0UOB55a6ytfwCHNrHBXQPm5vbXg32WSh5NRd76Oc5KZX5wct3cv8lrjX2DornfZMS+yXizF6M4sbmNXmhWpWP5UwQ2+Axr7x4dCv3PpVx+YVt+mCpX5hnHmNcEi3tvKltUYbOOwPmZUB0cRLj8X8D1DXk0R37ES9FqO5ModqrYhnR2DupufFYTpiGmwHvjadsUrS3fu39oH0xZU2mLkQM5a/+HsYHZdFJhZ0CP3uq3N2MdqY67p9fFEhwk1aFexBM9GRpdyvWZtDnM9tY9CgXjFEax1BO0ONQpgA5M+NMLX/lwyly1vybKKUf6OjPcBC8sWaU9gdDuPETUxFDflOjilDLyMZdImnEfXVdYJDKDkxodqSNZvhLF8ykMfww8yBpY3sXwpdh9db7S6f4LbjX87l5zxF1jieIVxl2/R51p0P3G/vQKkU6eOgSmlaMCd0XeE1Td8wopu/Hxjlv6GPbFaiFmTo1Xke4Mt7lqis2ZnTrz83769pdm+DqDkMI26lRdl+o21Ee8afhpfMnWKegnvtm67qaabBXTQe/d5JDVDYG95idCz/33eYf2yUbDYJkYQl5JjhSmALtUv3NWP/a03j6+sKranm1+Sw6esAPS3Dncw6UiOIhSr7iqYCUpgqWz+lGoSBYfBCYfE/5e7kV5YoAIsU3JThAnuFuzUEm9XvCFZcawRKBbv4I9B/chprWFLWHwGrVQIYtVYHoHD3FKIKxDCeWXqtqNdtMe2dT37StSa6BQtG/tDvlDqe59xO9yOXLNvWBwWnZ609U61lMPwVVkZl1bO9xAWNVlZYj36UqRTjsnqkx64Zyu0mZv9nkhUSiwmF6COOpzkNwGNcQcFKwfH8NbFuj47QhI4zBBgbvp6F5zp4P+bl6pkhjmJ3BpOmQGH2H3jD19gNp9HYFrvfPrZ9Xj7rvJrnolVoNSsgedjEi/DWrP/LPRT5DYCFqgVx1c/Q+3UMdn3c7GFbNtPdtugeq584WMhXnXWN2ffSDYODlIS4dXyIEBvEND0QGPNzOIkGrPz6bBNTmet0QyGXJ3amhhscW3hCiZbIayqPSa3QNBEEE8aC1GZ3iYYTjXqfn/6AOEGgx9x7CZ+wjG9DKqDj8W2J3nKeONMf/rc98Lu3o4fEWGhYrBRiGWCPQ29ZGlPZOxzbMVuYvRFUl/ydW/NM9EdmuourZwjTN6p+y7dgJbgz/U5PowHgILrpRUGbQ68CTH9uHRj52GjBz0NI0Jij6BKEfxonnGEPtQOgRqC7+T2hY2S8aGDpNI2h0jZ/5V4BxWce74IaAYYao/K8mRZg8kfr4w3P+c1Vtf6TxmcZRnYr59vKIVY/cREOUJJsCeIEOcCAAAAAAAAAAAAAAAAAAAA==', 'Other'),
	('Marketing', 'm', 'de/EELwjsNDdXaxj5sBz0CQGwBk=', 2, 'marketing@gr6.com', 'data:image/png;base64,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','Other'),
	('Seller', 's', 'de/EELwjsNDdXaxj5sBz0CQGwBk=', 3, 'sale@gr6.com', 'data:image/png;base64,UklGRswLAABXRUJQVlA4IMALAADwfQCdASpYAlgCPlEokEajoqGhIhUYCHAKCWlu4XdOAPblopP3MbPsf9R/xXbD/e+Wp3Ubs9pv1FfeeuPsN+KWgj+pN8qzN/qfWNmg9UWvM0APzt5+n/j/ovQ39F/s78Bv8v/ufpd+w/91vZu/YD//gzaMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuL0jPxk4J/T40dFlLjc6jQGozdGODo4Kb3HWACvELjALqagCuoWuyxs+wZpzD2peOt8nUoG4wrABXiFxgF1NQBXh/Frvz0TDcVX/gf5jUBY/2GMQuMAupqAK8QuL/pEACHw0zumy6lOLb3wRbaZ3U1AFeIXE/DYOJrlM7qaLaohGNS3gArxC4wC6moArwf0/Ph6dI/xO80oVADk8AK8QuMAupqAK8QtzOqn+0VXV/4ux0vWeBXWACvELjALqagCuoTkb3cAHBrSpp4mOc3mQma+XU1AFeIXGAXU1AFeDkHlYCC1rg5LV23CMcb9lkrrABXiFxgF1NQBXUjAgVX+34MqjUpOE32baID80WHMTUoP1/q3DfzRP0tYU4TeBxwV1KrpeYuMAupqAK8QuL/q0YnCC0VSdaT09C97yCXAytjv1RNTv+3ITTr1hWBFc2I7IPcSRgF1NQBXiFxf9WnQtq3G+J3wYUn7qCy6bwa5rhrxC4wC6moArwcmUd1uke+CLbTOjDrAbPot5DfBdTUAV4hcYBRvzcVJdzO6moArwcaO7XQ4p1NQBXiFxgFxDXvRmQEW2md1NPHYMI3jX011NQBXiFxgFxQMFBfbxC4wC6mnj4cp8TTe46wAV4hcTxmf7agCvELjAKM8+9MQuMAupqAK8P7J3DUXNAcZ2oHPN9CGpMHaxVM0McdlVUplU9+zCWYdB3MuEAwE6qMONZ0m7cJzfGOb/3Vwb5to1HUCsAFeIXGAXU1AIBN7jrABX1qmoArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArxC4wC6moArw/gAD+/dpXxzMIMgIAAAAAAAAAAAAAAAF0A4G6jjyOEwFj04lORGhzLNuk0NoPPtHJvFMmckyIePeyzYW8h2otAwf/Wy6ttJaCIU2v6KThP8PDLg5asi/Q7WPYswZSavwnnE9zpCspe6By0pzT5HMfkP61i+F2WyMo1K30JInQ9YecCqmG/OtfCqFBeXb+N+g4fhvx0ZLTPfp2mPgijoTIyJaAqPhrlft7eStyS4QU/DHZbNd4vIYjBjqGZpifmnh2T+/CW40ba7CZG9hV+xyC5hsgwTPvg8JPmI7mYscgNag/TJVUP1lMUR57tO5R5l/27U6fPPziYHfex7a5FxLjAFRrnDWSJjdk/t4MIfyDVVvR1t6jryt7XUrRTgZA41xd+7/AsrPECCKVp/m6f8UwHKuDtgk2po4utoBErSgOnXxzpyn9rIryF+vfZ9p+2mi1tXGgQAL4ifReXgbD7cqj6TMjixYuj2AIu1u845BKOUxoQxS1WMeoME5lYdpktU3KBMcfgmCGd5MC2pTjG0hzIgBTbFnHxbqEaCmK/GX+KGLDair6IdH72QKMCnjTipriY2fhX9b+PU60BzbLWsz3ebcs3CMXbewv/qcYX38N30ut970VD9AGpj7ugiCLgI0bZ0XD/zf2GGF7KhDoNUs+5DHbMH87aIE3yfvtx6k8e5nsYCjYzEJ3cwxOIByIFO38XF1Z0jPCdOFWdmmfxwuWG51J4LrqGdzrzvzt9sAxTCcgOaz/QZcrD6w8l4irnKCz35PhGFXk3rVnwB9+mkqApYEoZc0a/w6NYhOQN0mmRmzZz3/wwfPWRcHbmJFq7UXPDpAy/HG753B0Ox/r/TJDqDo4GgB2Dn9a/RIstOAU5PEJ3K3Rf9TPqAEVO04qTaqoMFCYU1SdW7Pu6UxWyMAiBINiOiHLM8+f8hdZBblk9G2ZuWVx58VLluBR2W9Mxo+5c9V24tX+njJ/U4n2LzdMPru8dL8NPkwT7+/w5KC+YnRs2wFTbopGa0gwfNzv5G06dDi66oAhvi3Apcjx+JMfn/9oF7mDQX3QThalx+VInqDbxRqdiiJ4t6lnmhTHtWj99TwJXFGODRkdAHN+Nb3U2FuOXLulIM8TG/yaUz4eHv3xLcrFiNG5LtgE/hhZdJIrIomJrYueZETa1XjE3IZLzjHjaaggNMxId7MV1F4ihCLl5/hGLFGv85RYOQ9af5B0P22Rmys3lGT3D0KWkuZpd3yvQpXfEmqrvbzT+Yd7zoSsCgm/X1GN4AO1Tyzki8gBZ0L0UOB55a6ytfwCHNrHBXQPm5vbXg32WSh5NRd76Oc5KZX5wct3cv8lrjX2DornfZMS+yXizF6M4sbmNXmhWpWP5UwQ2+Axr7x4dCv3PpVx+YVt+mCpX5hnHmNcEi3tvKltUYbOOwPmZUB0cRLj8X8D1DXk0R37ES9FqO5ModqrYhnR2DupufFYTpiGmwHvjadsUrS3fu39oH0xZU2mLkQM5a/+HsYHZdFJhZ0CP3uq3N2MdqY67p9fFEhwk1aFexBM9GRpdyvWZtDnM9tY9CgXjFEax1BO0ONQpgA5M+NMLX/lwyly1vybKKUf6OjPcBC8sWaU9gdDuPETUxFDflOjilDLyMZdImnEfXVdYJDKDkxodqSNZvhLF8ykMfww8yBpY3sXwpdh9db7S6f4LbjX87l5zxF1jieIVxl2/R51p0P3G/vQKkU6eOgSmlaMCd0XeE1Td8wopu/Hxjlv6GPbFaiFmTo1Xke4Mt7lqis2ZnTrz83769pdm+DqDkMI26lRdl+o21Ee8afhpfMnWKegnvtm67qaabBXTQe/d5JDVDYG95idCz/33eYf2yUbDYJkYQl5JjhSmALtUv3NWP/a03j6+sKranm1+Sw6esAPS3Dncw6UiOIhSr7iqYCUpgqWz+lGoSBYfBCYfE/5e7kV5YoAIsU3JThAnuFuzUEm9XvCFZcawRKBbv4I9B/chprWFLWHwGrVQIYtVYHoHD3FKIKxDCeWXqtqNdtMe2dT37StSa6BQtG/tDvlDqe59xO9yOXLNvWBwWnZ609U61lMPwVVkZl1bO9xAWNVlZYj36UqRTjsnqkx64Zyu0mZv9nkhUSiwmF6COOpzkNwGNcQcFKwfH8NbFuj47QhI4zBBgbvp6F5zp4P+bl6pkhjmJ3BpOmQGH2H3jD19gNp9HYFrvfPrZ9Xj7rvJrnolVoNSsgedjEi/DWrP/LPRT5DYCFqgVx1c/Q+3UMdn3c7GFbNtPdtugeq584WMhXnXWN2ffSDYODlIS4dXyIEBvEND0QGPNzOIkGrPz6bBNTmet0QyGXJ3amhhscW3hCiZbIayqPSa3QNBEEE8aC1GZ3iYYTjXqfn/6AOEGgx9x7CZ+wjG9DKqDj8W2J3nKeONMf/rc98Lu3o4fEWGhYrBRiGWCPQ29ZGlPZOxzbMVuYvRFUl/ydW/NM9EdmuourZwjTN6p+y7dgJbgz/U5PowHgILrpRUGbQ68CTH9uHRj52GjBz0NI0Jij6BKEfxonnGEPtQOgRqC7+T2hY2S8aGDpNI2h0jZ/5V4BxWce74IaAYYao/K8mRZg8kfr4w3P+c1Vtf6TxmcZRnYr59vKIVY/cREOUJJsCeIEOcCAAAAAAAAAAAAAAAAAAAA==','Other'),
	('Tran Thi Cau', 'c0', 'de/EELwjsNDdXaxj5sBz0CQGwBk=', 4, 'customer0@gr6.com', 'data:image/png;base64,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','Other'),
	('Nguyen Van Muc', 'c1', 'de/EELwjsNDdXaxj5sBz0CQGwBk=', 4, 'customer1@gr6.com', 'data:image/png;base64,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','Other'),
	('Ha Noi Oi', 'c2', 'de/EELwjsNDdXaxj5sBz0CQGwBk=', 4, 'customer2@gr6.com', 'data:image/png;base64,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','Other'),
	('Truong Son Tay', 'c3', 'de/EELwjsNDdXaxj5sBz0CQGwBk=', 4, 'customer3@gr6.com', 'data:image/png;base64,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','Other'),
	('Do Cong Minh', 'dhcongminh', 'Aga7yNH0k2fdLtnKOn0k8r4k8X4=', 4, 'nnguyenmanhshay@gmail.com', 'data:image/png;base64,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','Other');


INSERT INTO Category (CategoryName, CategoryDesc)
VALUES 
    ('Accessories', 'Sports accessories like caps and bags'),
    ('Equipment', 'Sports equipment like rackets and balls');

-- Inserting more sample data into Subcategory table
INSERT INTO Subcategory (SubCategoryName, SubCategoryDesc, CategoryID)
VALUES 
    ('Caps', 'Caps and hats', 1),
    ('Bags', 'Sports bags', 1),
    ('Rackets', 'Rackets for various sports', 2),
    ('Balls', 'Balls for various sports', 2);
GO

-- Inserting more sample data into Product table
INSERT INTO Product (ProductName, ProductPrice, Stock, ProductRating, ProductDesc, BrandID, SupplierID)
VALUES 
    ('Nike Cap', 25.00, 100, 4, 'Cap from Nike', 1, 1),
    ('Adidas Bag', 50.00, 60, 5, 'Bag from Adidas', 2, 2),
    ('Yonex Badminton Racket', 100.00, 30, 5, 'Badminton racket from Yonex', 3, 1),
    ('Wilson Tennis Ball', 5.00, 200, 4, 'Tennis ball from Wilson', 4, 2);
GO

-- Inserting more sample data into ProductCategory table
INSERT INTO ProductCategory (ProductID, CategoryID, SubCategoryID)
VALUES 
    (1, 2, 4),
    (2, 1, 1),
    (3, 2, 3),
    (4, 1, 2);
GO

-- Inserting more sample data into Feedback table
INSERT INTO Feedback (UserID, ProductID, Rating, Content, FeedbackDate, Status)
VALUES 
    (2, 1, 4, 'Great product!', GETDATE(), 1),
    (3, 2, 5, 'Excellent quality!', GETDATE(), 1);
GO
