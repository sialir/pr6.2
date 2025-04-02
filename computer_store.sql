CREATE DATABASE computer_store;
GO

USE computer_store;
GO

/*
    Таблица Roles
    --------------------
    Содержит список ролей для пользователей.
    Поля:
      - RoleID (PK): первичный ключ
      - RoleName: название роли
      - Description: описание роли
*/
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200)
);

-- Заполнение Roles (10 записей)
INSERT INTO Roles (RoleName, Description) VALUES
('Admin', 'Administrator with full access'),
('Manager', 'Store manager'),
('Sales', 'Sales representative'),
('Technician', 'Technical support for components'),
('Inventory Specialist', 'Manages inventory'),
('Accountant', 'Handles accounting tasks'),
('Cashier', 'Processes transactions at the counter'),
('Customer Service', 'Handles customer queries'),
('Marketing', 'Handles promotions and marketing'),
('IT Support', 'Provides IT assistance');


/*
    Таблица Users
    --------------------
    Содержит учетные данные пользователей и ссылку на их роль.
    Поля:
      - UserID (PK): первичный ключ
      - Login: логин пользователя
      - Password: пароль пользователя (для реальной системы — хранить в зашифрованном виде)
      - RoleID (FK → Roles): ссылка на таблицу Roles
*/
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Login NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Заполнение Users (10 записей)
INSERT INTO Users (Login, Password, RoleID) VALUES
('admin', 'admin123', 1),
('manager1', 'manager123', 2),
('sales1', 'sales123', 3),
('tech1', 'tech123', 4),
('inventory1', 'inv123', 5),
('accountant1', 'acct123', 6),
('cashier1', 'cash123', 7),
('service1', 'serv123', 8),
('marketing1', 'mark123', 9),
('it1', 'it123', 10);


/*
    Таблица Categories
    --------------------
    Содержит категории товаров (комплектующих).
    Поля:
      - CategoryID (PK): первичный ключ
      - CategoryName: название категории
      - Description: описание категории
*/
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200)
);

-- Заполнение Categories (10 записей)
INSERT INTO Categories (CategoryName, Description) VALUES
('Processors', 'Central processing units'),
('Motherboards', 'Main boards for computers'),
('Graphics Cards', 'Video cards for rendering graphics'),
('Memory', 'RAM modules'),
('Storage', 'Hard drives and SSDs'),
('Power Supplies', 'Power supply units'),
('Cases', 'Computer cases'),
('Cooling Systems', 'Cooling solutions for components'),
('Peripherals', 'Computer peripherals like keyboards and mice'),
('Accessories', 'Additional computer accessories');


/*
    Таблица Suppliers
    --------------------
    Содержит список поставщиков.
    Поля:
      - SupplierID (PK): первичный ключ
      - SupplierName: наименование поставщика
      - ContactName: контактное лицо
      - Phone: телефон
      - Email: адрес электронной почты
      - Address: адрес
*/
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(200)
);

-- Заполнение Suppliers (10 записей)
INSERT INTO Suppliers (SupplierName, ContactName, Phone, Email, Address) VALUES
('Supplier A', 'John Doe', '1234567890', 'johndoe@suppliera.com', '123 Main St, City A'),
('Supplier B', 'Jane Smith', '2345678901', 'janesmith@supplierb.com', '456 Oak Ave, City B'),
('Supplier C', 'Mike Johnson', '3456789012', 'mike@supplierc.com', '789 Pine Rd, City C'),
('Supplier D', 'Emily Davis', '4567890123', 'emily@supplierd.com', '321 Elm St, City D'),
('Supplier E', 'David Wilson', '5678901234', 'david@suppliere.com', '654 Maple Ave, City E'),
('Supplier F', 'Sarah Miller', '6789012345', 'sarah@supplierf.com', '987 Cedar Rd, City F'),
('Supplier G', 'Robert Brown', '7890123456', 'robert@supplierg.com', '159 Spruce St, City G'),
('Supplier H', 'Laura Taylor', '8901234567', 'laura@supplierh.com', '753 Birch Ave, City H'),
('Supplier I', 'James Anderson', '9012345678', 'james@supplieri.com', '852 Walnut Rd, City I'),
('Supplier J', 'Linda Thomas', '0123456789', 'linda@supplierj.com', '951 Chestnut St, City J');


/*
    Таблица Products
    --------------------
    Содержит информацию о товарах (комплектующих).
    Поля:
      - ProductID (PK): первичный ключ
      - ProductName: название товара
      - CategoryID (FK → Categories): ссылка на категорию
      - SupplierID (FK → Suppliers): ссылка на поставщика
      - Price: цена
      - Description: описание
*/
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Description NVARCHAR(200),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Заполнение Products (10 записей)
INSERT INTO Products (ProductName, CategoryID, SupplierID, Price, Description) VALUES
('Intel Core i7 Processor', 1, 1, 320.00, '8th generation Intel processor'),
('ASUS Prime Motherboard', 2, 2, 150.00, 'Reliable motherboard for Intel processors'),
('MSI Gaming Graphics Card', 3, 3, 400.00, 'High performance gaming GPU'),
('Corsair Vengeance 16GB', 4, 4, 80.00, 'DDR4 memory kit'),
('Samsung 970 EVO 1TB', 5, 5, 180.00, 'NVMe solid state drive'),
('EVGA 600W Power Supply', 6, 6, 60.00, 'Efficient power supply'),
('NZXT H510 Case', 7, 7, 70.00, 'Compact mid-tower case'),
('Noctua NH-D15 Cooler', 8, 8, 90.00, 'High performance CPU cooler'),
('Logitech Wireless Mouse', 9, 9, 25.00, 'Ergonomic wireless mouse'),
('Dell USB Keyboard', 10, 10, 30.00, 'Standard USB keyboard');


/*
    Таблица Customers
    --------------------
    Содержит информацию о клиентах (покупателях).
    Поля:
      - CustomerID (PK): первичный ключ
      - FirstName: имя
      - LastName: фамилия
      - Email: почта
      - Phone: телефон
      - Address: адрес
*/
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20),
    Address NVARCHAR(200)
);

-- Заполнение Customers (10 записей)
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Ivan', 'Ivanov', 'ivan.ivanov@example.com', '1111111111', 'Address 1'),
('Petr', 'Petrov', 'petr.petrov@example.com', '2222222222', 'Address 2'),
('Sidor', 'Sidorov', 'sidor.sidorov@example.com', '3333333333', 'Address 3'),
('Olga', 'Smirnova', 'olga.smirnova@example.com', '4444444444', 'Address 4'),
('Anna', 'Kuznetsova', 'anna.kuznetsova@example.com', '5555555555', 'Address 5'),
('Elena', 'Novikova', 'elena.novikova@example.com', '6666666666', 'Address 6'),
('Dmitry', 'Sokolov', 'dmitry.sokolov@example.com', '7777777777', 'Address 7'),
('Maria', 'Popova', 'maria.popova@example.com', '8888888888', 'Address 8'),
('Sergey', 'Lebedev', 'sergey.lebedev@example.com', '9999999999', 'Address 9'),
('Nina', 'Fedorova', 'nina.fedorova@example.com', '0000000000', 'Address 10');


/*
    Таблица Orders
    --------------------
    Содержит заказы.
    Поля:
      - OrderID (PK): первичный ключ
      - CustomerID (FK → Customers): ссылка на покупателя
      - OrderDate: дата заказа
      - TotalAmount: итоговая сумма
      - CreatedByUserID (FK → Users): кто оформил заказ
*/
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    CreatedByUserID INT NOT NULL,                -- Связь с Users
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CreatedByUserID) REFERENCES Users(UserID)
);

-- Заполнение Orders (10 записей)
-- Предположим, что все заказы оформил менеджер (UserID = 2) для простоты
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, CreatedByUserID) VALUES
(1, '2025-03-01', 350.00, 2),
(2, '2025-03-02', 150.00, 2),
(3, '2025-03-03', 400.00, 2),
(4, '2025-03-04', 80.00, 2),
(5, '2025-03-05', 180.00, 2),
(6, '2025-03-06', 60.00, 2),
(7, '2025-03-07', 70.00, 2),
(8, '2025-03-08', 90.00, 2),
(9, '2025-03-09', 25.00, 2),
(10, '2025-03-10', 30.00, 2);


/*
    Таблица OrderDetails
    --------------------
    Детализация заказов (что именно купили).
    Поля:
      - OrderDetailID (PK): первичный ключ
      - OrderID (FK → Orders): ссылка на заказ
      - ProductID (FK → Products): ссылка на товар
      - Quantity: количество
      - UnitPrice: цена за единицу на момент покупки
*/
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Заполнение OrderDetails (10 записей)
-- Для простоты — по 1 товару в каждом заказе
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 320.00),
(2, 2, 1, 150.00),
(3, 3, 1, 400.00),
(4, 4, 1, 80.00),
(5, 5, 1, 180.00),
(6, 6, 1, 60.00),
(7, 7, 1, 70.00),
(8, 8, 1, 90.00),
(9, 9, 1, 25.00),
(10, 10, 1, 30.00);


/*
    Таблица Inventory
    --------------------
    Хранит остатки товаров на складе.
    Поля:
      - InventoryID (PK): первичный ключ
      - ProductID (FK → Products): ссылка на товар
      - StockQuantity: текущее количество на складе
      - UpdatedByUserID (FK → Users): кто внёс/обновил запись
*/
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    StockQuantity INT NOT NULL,
    UpdatedByUserID INT NOT NULL,                -- Связь с Users
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UpdatedByUserID) REFERENCES Users(UserID)
);

-- Заполнение Inventory (10 записей)
-- Предположим, что все данные о складе вносил специалист по инвентаризации (UserID = 5)
INSERT INTO Inventory (ProductID, StockQuantity, UpdatedByUserID) VALUES
(1, 50, 5),
(2, 40, 5),
(3, 30, 5),
(4, 60, 5),
(5, 20, 5),
(6, 25, 5),
(7, 35, 5),
(8, 45, 5),
(9, 70, 5),
(10, 80, 5);


/*
    Таблица Payments
    --------------------
    Информация об оплатах.
    Поля:
      - PaymentID (PK): первичный ключ
      - OrderID (FK → Orders): ссылка на заказ
      - PaymentDate: дата платежа
      - PaymentMethod: метод оплаты (наличные, карта и т.п.)
      - Amount: сумма платежа
      - ProcessedByUserID (FK → Users): кто обработал платёж
*/
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    PaymentDate DATETIME NOT NULL DEFAULT GETDATE(),
    PaymentMethod NVARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    ProcessedByUserID INT NOT NULL,             -- Связь с Users
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProcessedByUserID) REFERENCES Users(UserID)
);

-- Заполнение Payments (10 записей)
-- Допустим, все платежи проводил кассир (UserID = 7)
INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, Amount, ProcessedByUserID) VALUES
(1, '2025-03-01', 'Credit Card', 350.00, 7),
(2, '2025-03-02', 'Cash', 150.00, 7),
(3, '2025-03-03', 'Debit Card', 400.00, 7),
(4, '2025-03-04', 'Credit Card', 80.00, 7),
(5, '2025-03-05', 'Cash', 180.00, 7),
(6, '2025-03-06', 'Debit Card', 60.00, 7),
(7, '2025-03-07', 'Credit Card', 70.00, 7),
(8, '2025-03-08', 'Cash', 90.00, 7),
(9, '2025-03-09', 'Debit Card', 25.00, 7),
(10, '2025-03-10', 'Credit Card', 30.00, 7);
GO
