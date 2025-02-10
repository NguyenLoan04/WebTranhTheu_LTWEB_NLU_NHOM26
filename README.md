# Nét Việt - Website kinh doanh tranh thêu.
Đồ án nhóm 26 - Môn Lập trình WEB - NLU 2024-2025

## Mục lục
- [Các tính năng](#tính-năng) 
- [Cách chạy đồ án](#cách-chạy-đồ-án)
- [Các thư viện áp dụng](#các-thư-viện)
- [Các tính năng dự kiến](#các-tính-năng-dự-kiến)
- [Ghi chú](#ghi-chú)

---
### Tính năng
 1. **Trang chủ**: Hiển thị thông tin website, sản phẩm HOT (được mua nhiều), sản phẩm đang được khuyến mãi thời điểm người dùng truy cập vào trang, sản phẩm được đánh giá cao (số lượng đánh giá 5 sao cao nhất), các sản phẩm còn hoạt động ở trên web.
 2. **Danh mục**: Hiển thị sản phẩm thuộc danh mục đó, cùng với bộ lọc bao gồm: **chủ đề tranh,nhà cung cấp, giá tiền và đánh giá**. 
 3. **Chi tiết tranh thêu**: Hiển thị thông tin chi tiết tranh thiêu, có thông tin giảm giá, có thể bình luận nếu người dùng đã mua tranh. Bên cạnh còn có chức năng **Mua ngay** và **Thêm vào giỏ hàng**.
 4. **Thêm vào giỏ hàng**: Sau khi đăng nhập, người dùng có thể thêm một sản phẩm vào giỏ hàng kèm với khuyến mãi sản phẩm (nếu có). Trang **Giỏ hàng** hiển thị thông tin sản phẩm: _tên tranh, kích thước, số lượng hiện có trong giỏ hàng,giảm giá (nếu có)_. Giỏ hàng có các chức năng: _Chọn tất cả sản phẩm, chọn 1 sản phẩm, tăng/giảm số lượng sản phẩm, xóa sản phẩm khỏi giỏ hàng_.
 5. **Chi tiết người dùng**: Bao gồm các thông tin người dùng kèm theo lịch sử xem sản phẩm, thay đổi thông tin, xóa thông tin.
 6. **Chi tiết admin**: Bao gồm các chức năng quản lý và thay đổi thông tin của admin. 

---
### Cách chạy đồ án
1. Git clone repository này về.
2. Cài đặt IDE 
3. Cài đặt **Apache Tomcat** version 10.1.31
4. Load file `pom.xml` ở project trên máy.
5. **Edit configurations**: Thêm tomcat local, build artifact và config deployment tomcat.
6. Tạo các file properties trong resources, trong đó:
    - _db.properties_: chức thông tin kết nối đến database như host, port, username, password, tên database. Đặc biệt thêm dòng `db.options= useUnicode=true&characterEncoding=utf-8`.
    - _cloud.properties_: chứa thông tin kết nối đến **cloudinary** như cloud_name, api_key, api_secret.
    - _email.properties_: chứa thông tin mail để gửi mã xác thực cho người dùng như name-email và pass_email.
    - _gg.properties_: chứa loginId của google dùng để login bằng google.
7. Nhấn nút **Run** trên tool bar hoặc tổ hợp phím `Ctrl+Shift+F10` để chạy server.

---
### Các thư viện
1. **cloudinary**
2. **Google mail**  
> Đã có trong file `pom.xml`
---
### Các tính năng dự kiến
1. Sửa lại **TOÀN BỘ** phần code chưa hoàn thiện.
2. Bổ sung chức năng thêm sản phẩm vào danh sách yêu thích.
3. Bổ sung phần liên kết đến sản phẩm trong trang Giỏ hàng và User.

---
### Ghi chú
- Version của Apache Tomcat là 10.1.31.
- Version của JDK là 21.
> Các version của các thành phần trong project đã có trên `pom.xml`
