# BT05-SpringBoot4
# BaiTap Spring boot 
Họ Tên: Thái Nhựt Huy
MSSV: 24110227
Môn Lập Trình Web
Ngày cập nhật cuối: 09/09/2026
Nội dung cập nhật: Hoàn thiện chức năng CRUD trong role admin bằng Spring boot 4 với JSP/JSTL cho bảng Category, bảng User, có chức năng tìm kiếm

# Spring Boot 4 Admin CRUD

## Công nghệ

- Spring Boot 4
- Spring Data JPA
- JSP/JSTL
- Bootstrap
- SQL Server
- Maven

## Chức năng

### Admin - Category
- Hiển thị danh sách Category
- Thêm Category
- Sửa Category
- Xóa Category
- Tìm kiếm Category

### Admin - User
- Hiển thị danh sách User
- Thêm User
- Sửa User
- Xóa User
- Tìm kiếm User

## Database

Database: `jakartaJPA`

Các bảng sử dụng:
- `categories`
- `User`

## Chạy project

1. Cấu hình SQL Server trong:

`src/main/resources/application.properties`

2. Chạy:

`SpringBoot4AdminCrudApplication`

3. Truy cập:

`http://localhost:8080/admin`
