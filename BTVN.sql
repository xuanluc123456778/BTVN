USE AdventureWorks2022
GO
CREATE TABLE Toys (
    ProductCode VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(30),
    Category VARCHAR(30),
    Manufacturer VARCHAR(40),
    AgeRange VARCHAR(15),
    UnitPrice MONEY,
    Netweight INT,
    QtyOnHand INT
);
-- Thêm dữ liệu vào bảng Toys với QtyOnHand ít nhất là 20 cho mỗi sản phẩm
INSERT INTO Toys (ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand)
VALUES
    ('T001', 'LEGO Set', 'Lego', 'LEGO Group', '3-5 years', 25.99, 600, 25),
    ('T002', 'Board Game', 'Board Game', 'Hasbro', '6-10 years', 19.99, 850, 30),
    ('T003', 'Action Figure', 'Action Figure', 'Mattel', '5-12 years', 9.99, 200, 20),
    -- Thêm dữ liệu cho các sản phẩm khác tương tự
    ('T015', 'Puzzle', 'Puzzle', 'Ravensburger', '8-12 years', 12.49, 450, 22);
GO
CREATE PROCEDURE HeavyToys AS
BEGIN
    SELECT * FROM Toys WHERE Netweight > 500;
END;
GO
CREATE PROCEDURE PriceIncrease AS
BEGIN
    UPDATE Toys SET UnitPrice = UnitPrice + 10;
END;
GO
CREATE PROCEDURE QtyOnHand AS
BEGIN
    UPDATE Toys SET QtyOnHand = QtyOnHand - 5;
END;
GO
-- Thực thi thủ tục HeavyToys để liệt kê các đồ chơi nặng hơn 500g
EXEC HeavyToys;

-- Thực thi thủ tục PriceIncrease để tăng giá của tất cả các sản phẩm lên 10 đơn vị giá
EXEC PriceIncrease;

-- Thực thi thủ tục QtyOnHand để giảm số lượng tồn kho mỗi thứ 5 đơn vị
EXEC QtyOnHand;
GO