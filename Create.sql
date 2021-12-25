USE SS;--your database

 CREATE TABLE SS.Category(
	Id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Name varchar(100) NOT NULL
);

CREATE TABLE Product(
	Id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Name varchar(100) NOT NULL
);

-- -- Связь многие ко многим, поэтому создаём посредника
CREATE Table ProductCategory(
    Id int AUTO_INCREMENT NOT null primary key,
    ProductID int not null ,
    CategoryID int not null,
    FOREIGN key(ProductID) REFERENCES Product(Id) on update cascade on delete restrict,
    FOREIGN KEY(CategoryID) REFERENCES Category(Id) on update cascade on delete restrict
);
Insert into Product
VALUES (null,"Lada Vesta"),
       (null,"Top Gear Forester 26"),
       (null,"DARK SOULS III");
Insert into SS.Category
VALUES ( 0,"Computer Game"),
       (1 , "Cars"),
       ( 2,"Bikes");

Insert into productcategory
VALUES  (0, 6, 0),
        (1, 4, 1),
        (2, 5, 2);
SELECT p.Name as ProductName, c.Name as CategoryName from Product p
left join Category c on pc.CategoryId = c.Id
left join ProductCategory pc on pc.ProductId = p.Id
