# Nét Việt - Website kinh doanh tranh thêu
Đồ án nhóm 61 - Môn Lập trình Web - NLU 2024-2025.

## Mục lục
- [Các tính năng](#tính-năng) 
- [Cài đặt](#cài-đặt)
- [Các tính năng dự kiến](#các-tính-năng-dự-kiến)
- [Hình ảnh của web](#hình-ảnh-của-web)
---
### Tính năng
1. **Trang chủ**: Hiển thị thông tin website, sản phẩm HOT (được mua nhiều), sản phẩm đang được khuyến mãi thời điểm người dùng truy cập vào trang, sản phẩm được đánh giá cao (số lượng đánh giá 5 sao cao nhất), các sản phẩm còn hoạt động ở trên web.
2. **Danh mục**: Hiển thị sản phẩm thuộc danh mục đó, cùng với bộ lọc bao gồm: **chủ đề tranh,nhà cung cấp, giá tiền và đánh giá**. 
3. **Chi tiết tranh thêu**: Hiển thị thông tin chi tiết tranh thiêu, có thông tin giảm giá, có thể bình luận nếu người dùng đã mua tranh. Bên cạnh còn có chức năng **Mua ngay** và **Thêm vào giỏ hàng**.
4. **Giỏ hàng**: Sau khi đăng nhập, người dùng có thể thêm một sản phẩm vào giỏ hàng kèm với khuyến mãi sản phẩm (nếu có). Trang **Giỏ hàng** hiển thị thông tin sản phẩm: _tên tranh, kích thước, số lượng hiện có trong giỏ hàng,giảm giá (nếu có)_. Giỏ hàng có các chức năng: _Chọn tất cả sản phẩm, chọn 1 sản phẩm, tăng/giảm số lượng sản phẩm, xóa sản phẩm khỏi giỏ hàng_.
5. **Thanh toán**: Sau khi đã thêm sản phẩm vào giỏ hàng. Người dùng có thể tiến hành thanh toán. Sau khi chọn sản phẩm muốn thanh toán trong giỏ hàng thì hệ thống sẽ chuyển sang trang thanh toán. Người dùng chỉ có thể thanh toán nếu như đã điền địa chỉ giao hàng vào thông tin của mình trong trang **Tài khoản**. Hiện tại, web chỉ hỗ trợ thanh toán bằng tiền mặt.
6. **Đánh giá sản phẩm**: Sau khi thanh toán đơn hàng, người dùng có thể tiến hành đánh giá sản phẩm đã mua.
7. **Xác thực người dùng**: Có thể đăng ký tài khoản mới, đăng nhập bằng tài khoản của hệ thống hoặc đăng nhập bằng tài khoản Google. Với tài khoản mới đăng ký, hệ thống sẽ gửi một mã xác thực đến email đã đăng ký. Người dùng có thể vào trang xác thực để hoàn tất đăng ký.
8. **Chi tiết người dùng**: Bao gồm các thông tin người dùng kèm theo lịch sử xem sản phẩm, thay đổi thông tin, xóa thông tin.
9. **Chi tiết admin**: Bao gồm các chức năng quản lý và thay đổi thông tin của admin.

---
### Cài đặt
1. Clone repo này.
2. Tạo các file properties trong `src/java/main/resources`, trong đó:
    - _db.properties_: chức thông tin kết nối đến database: `db.host`, `db.port`, `db.username`, `db.password`, `db.name` (tên db) và `db.options= useUnicode=true&characterEncoding=utf-8`.
    - _cloud.properties_: chứa thông tin kết nối đến **cloudinary** như `cloud_name`, `api_key`, `api_secret`.
    - _email.properties_: chứa thông tin mail để gửi mã xác thực cho người dùng như `name-email` và `pass_email`.
    - _gg.properties_: chứa `loginId` của google dùng để login bằng google.
      
3. Thao tác với **Docker** cơ bản: (nếu chưa biết Docker)
    - `docker build -t your-app-name .`: Để tiến hành build Docker Image. Với `your-app-name` là tên application muốn đặt
    - `docker run -d -p 8080:8080 --name your-container-name your-app-name`: Dùng để chạy Container từ Image đã tạo với `your-container-name` là tên Container muốn đặt tại port 8080
    - Mở `localhost:8080/` để sử dụng.

---
### Các tính năng dự kiến
1. Chỉnh sửa code chưa hoàn thiện.
2. Bổ sung chức năng thêm sản phẩm vào danh sách yêu thích.
3. Bổ sung phần liên kết đến sản phẩm trong trang Giỏ hàng và User.
4. Cập nhật hash cho id sản phẩm trong trang `/product`
5. Cập nhật UI cho mọi tính năng.
6. Fix các bug còn tồn đọng.

---
### Hình ảnh của web

![image](https://github.com/user-attachments/assets/7cfa7b1a-2362-4a1d-bf9d-3aaad46a4580)
![image](https://github.com/user-attachments/assets/c016b6df-73b8-4f89-8a8b-e97639d32ed6)
![image](https://github.com/user-attachments/assets/8f33d9f4-2db9-49e8-8471-35f391fea459)
