# HotelBooking — Nền tảng đặt phòng khách sạn trực tuyến

Ứng dụng **ASP.NET Core MVC (.NET 8)** sử dụng **Entity Framework Core**, **ASP.NET Core Identity** và **Microsoft SQL Server**.

## Cấu trúc dự án

- `HotelBooking/` — mã nguồn ASP.NET Core MVC, giao diện, model, controllers, migrations và README chi tiết.
- `Database/HotelBookingDb.sql` — script tạo cơ sở dữ liệu và dữ liệu mẫu cho SQL Server.

## Chạy thử trên Windows

1. Cài **.NET 8 SDK** và **SQL Server / SQL Server LocalDB**.
2. Dùng SSMS chạy `Database/HotelBookingDb.sql` trên máy chủ SQL Server của bạn.
3. Mở `HotelBooking/HotelBooking.csproj` trong Visual Studio.
4. Sửa chuỗi `ConnectionStrings:DefaultConnection` trong `HotelBooking/appsettings.json` cho phù hợp với tên SQL Server trên máy của bạn (ví dụ `(localdb)\MSSQLLocalDB`).
5. Khôi phục NuGet packages, build và chạy bằng Visual Studio hoặc `dotnet run --project HotelBooking/HotelBooking.csproj`.

> **Lưu ý:** CSDL kèm dữ liệu và tài khoản mẫu chỉ dành cho mục đích học tập/demo. Trước khi triển khai công khai, hãy thay mật khẩu mẫu và đưa mọi secret thật ra khỏi repository. Nếu dùng SQL Server 2014, EF Core 8 có thể cần cấu hình độ tương thích SQL 120 trong `UseSqlServer`.

Xem thêm [`HotelBooking/README.md`](HotelBooking/README.md) để biết chi tiết tính năng và tài khoản demo.
