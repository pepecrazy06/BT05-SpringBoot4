/* =========================================================
   PROJECT: JPA CRUD CATEGORY & PRODUCT
   DATABASE: jakartaJPA
   SQL SERVER
   ========================================================= */

IF DB_ID('jakartaJPA') IS NULL
BEGIN
    CREATE DATABASE jakartaJPA;
END
GO

USE jakartaJPA;
GO



IF OBJECT_ID('dbo.OTP', 'U') IS NOT NULL
    DROP TABLE dbo.OTP;
GO

IF OBJECT_ID('dbo.products', 'U') IS NOT NULL
    DROP TABLE dbo.products;
GO

IF OBJECT_ID('dbo.videos', 'U') IS NOT NULL
    DROP TABLE dbo.videos;
GO

IF OBJECT_ID('dbo.categories', 'U') IS NOT NULL
    DROP TABLE dbo.categories;
GO

IF OBJECT_ID('dbo.[User]', 'U') IS NOT NULL
    DROP TABLE dbo.[User];
GO


/* =========================================================
   3. TABLE USER
   ========================================================= */

CREATE TABLE dbo.[User]
(
    id INT IDENTITY(1,1) PRIMARY KEY,

    email VARCHAR(255) NOT NULL UNIQUE,

    username VARCHAR(100) NOT NULL UNIQUE,

    fullname NVARCHAR(255) NULL,

    password VARCHAR(255) NOT NULL,

    avatar NVARCHAR(500) NULL,

    roleid INT NOT NULL DEFAULT 2,

    phone VARCHAR(20) NULL,

    createdDate DATETIME2(7) NOT NULL
        DEFAULT GETDATE(),

    active BIT NULL
        DEFAULT 0
);
GO


/* =========================================================
   4. TABLE CATEGORIES
   ========================================================= */

CREATE TABLE dbo.categories
(
    categoryId INT IDENTITY(1,1) PRIMARY KEY,

    categoryname NVARCHAR(255) NOT NULL,

    images NVARCHAR(500) NULL,

    status INT NOT NULL DEFAULT 1
);
GO


/* =========================================================
   5. TABLE PRODUCTS

   Quan hệ:
   categories 1 -------- N products
   ========================================================= */

CREATE TABLE dbo.products
(
    productId INT IDENTITY(1,1) PRIMARY KEY,

    productName NVARCHAR(255) NOT NULL,

    price FLOAT NOT NULL,

    description NVARCHAR(1000) NULL,

    images NVARCHAR(500) NULL,

    createdDate DATETIME2(7) NOT NULL
        DEFAULT GETDATE(),

    categoryId INT NOT NULL,

    CONSTRAINT FK_products_categories
        FOREIGN KEY (categoryId)
        REFERENCES dbo.categories(categoryId)
);
GO


/* =========================================================
   6. TABLE OTP
   Dùng cho:
   - Xác thực đăng ký
   - Quên mật khẩu
   ========================================================= */

CREATE TABLE dbo.OTP
(
    id INT IDENTITY(1,1) PRIMARY KEY,

    email VARCHAR(255) NOT NULL,

    otp VARCHAR(10) NOT NULL,

    expiredTime DATETIME2(7) NOT NULL,

    verified BIT NOT NULL
        DEFAULT 0
);
GO


/* =========================================================
   7. TABLE VIDEOS
   ========================================================= */

CREATE TABLE dbo.videos
(
    videoId VARCHAR(50) PRIMARY KEY,

    active INT NOT NULL DEFAULT 1,

    description NVARCHAR(1000) NULL,

    poster NVARCHAR(500) NULL,

    title NVARCHAR(255) NOT NULL,

    views INT NOT NULL DEFAULT 0,

    categoryId INT NOT NULL,

    CONSTRAINT FK_videos_categories
        FOREIGN KEY (categoryId)
        REFERENCES dbo.categories(categoryId)
);
GO


/* =========================================================
   8. DỮ LIỆU CATEGORY MẪU
   Giữ gần giống database hiện tại
   ========================================================= */

SET IDENTITY_INSERT dbo.categories ON;
GO

INSERT INTO dbo.categories
(
    categoryId,
    categoryname,
    images,
    status
)
VALUES
(
    1,
    N'Apple',
    N'1788617232129_1780400685.png',
    1
),
(
    2,
    N'Xiaomi',
    N'1788617206794_1426382413.png',
    1
),
(
    6,
    N'Pepe',
    N'1788618388809_570560710.webp',
    0
);
GO

SET IDENTITY_INSERT dbo.categories OFF;
GO


/* =========================================================
   9. DỮ LIỆU PRODUCT MẪU
   ========================================================= */

SET IDENTITY_INSERT dbo.products ON;
GO

INSERT INTO dbo.products
(
    productId,
    productName,
    price,
    description,
    images,
    createdDate,
    categoryId
)
VALUES

(
    1,
    N'Dell Laptop',
    15000000,
    N'Laptop test',
    N'dell.jpg',
    '2026-08-28T15:28:40.9533333',
    2
),

(
    2,
    N'Nokia Phone',
    5000000,
    N'Điện thoại test',
    N'nokia.jpg',
    '2026-08-28T15:29:39.1900000',
    1
),

(
    4,
    N'Dell Laptop',
    15000000,
    N'Laptop Dell',
    N'images/dell.jpg',
    '2026-09-03T08:09:34.8333333',
    2
),

(
    5,
    N'Nokia Phone',
    5000000,
    N'Điện thoại Nokia',
    N'images/nokia.jpg',
    '2026-09-03T08:09:34.8333333',
    1
),

(
    6,
    N'iPhone 16',
    22000000,
    N'Điện thoại iPhone',
    N'images/iphone.jpg',
    '2026-09-03T08:09:34.8333333',
    1
),

(
    16,
    N'iPhone 17 Pro',
    8990000,
    N'iPhone 17 Pro',
    N'1788618053017_705050565.webp',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    17,
    N'iPhone 17 Pro Max',
    10990000,
    N'iPhone 17 Pro Max 64GB',
    N'1788617998094_1665889785.jpg',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    18,
    N'Xiaomi 17',
    11990000,
    N'iPhone 17 64GB',
    N'1788617950544_1694518936.jpg',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    19,
    N'Xiaomi 12',
    13990000,
    N'Xiaomi 12',
    N'1788617900687_1723148087.jpg',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    20,
    N'iPhone 13',
    14990000,
    N'iPhone 13 128GB',
    N'1788617131737_1451403797.jpg',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    21,
    N'iPhone 13 Pro',
    17990000,
    N'iPhone 13 Pro 128GB',
    N'1788617103955_769000188.webp',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    22,
    N'iPhone 14',
    18990000,
    N'iPhone 14 128GB',
    N'1788617074148_2072850567.webp',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    23,
    N'iPhone 14 Pro',
    21990000,
    N'iPhone 14 Pro 128GB',
    N'1788617046802_1691916421.webp',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    24,
    N'iPhone 15',
    22990000,
    N'iPhone 15 128GB',
    N'1788617013805_1076415969.webp',
    '2026-09-05T20:45:37.6600000',
    1
),

(
    25,
    N'iPhone 15 Pro Max',
    29990000,
    N'iPhone 15 Pro Max 256GB',
    N'1788616962828_463185834.webp',
    '2026-09-05T20:45:37.6600000',
    1
);
GO

SET IDENTITY_INSERT dbo.products OFF;
GO


/* =========================================================
   10. TÀI KHOẢN DEMO

   Để giảng viên có thể login trực tiếp.
   active = 1 nên không cần xác thực OTP.
   ========================================================= */

INSERT INTO dbo.[User]
(
    email,
    username,
    fullname,
    password,
    avatar,
    roleid,
    phone,
    createdDate,
    active
)
VALUES
(
    'admin@gmail.com',
    'admin',
    N'Administrator',
    '123456',
    NULL,
    1,
    '0900000001',
    GETDATE(),
    1
);
GO


INSERT INTO dbo.[User]
(
    email,
    username,
    fullname,
    password,
    avatar,
    roleid,
    phone,
    createdDate,
    active
)
VALUES
(
    'user@gmail.com',
    'user',
    N'User Demo',
    '123456',
    NULL,
    2,
    '0900000002',
    GETDATE(),
    1
);
GO


/* =========================================================
   11. VIDEO MẪU
   ========================================================= */

INSERT INTO dbo.videos
(
    videoId,
    active,
    description,
    poster,
    title,
    views,
    categoryId
)
VALUES
(
    'v01',
    1,
    N'Test JPA',
    N'poster.jpg',
    N'Video test',
    100,
    1
);
GO


/* =========================================================
   12. OTP

   Không insert OTP mẫu.
   OTP sẽ được tạo tự động khi:
   - Đăng ký
   - Quên mật khẩu
   ========================================================= */


/* =========================================================
   13. KIỂM TRA DATABASE
   ========================================================= */

SELECT *
FROM dbo.categories
ORDER BY categoryId;
GO


SELECT *
FROM dbo.products
ORDER BY productId;
GO


SELECT *
FROM dbo.[User]
ORDER BY id;
GO


SELECT *
FROM dbo.OTP
ORDER BY id;
GO


SELECT *
FROM dbo.videos
ORDER BY videoId;
GO