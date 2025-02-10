# Nét Việt - Website kinh doanh tranh thêu
Đồ án nhóm 26 - Môn Lập trình Web - NLU 2024-2025

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
4. **Giỏ hàng**: Sau khi đăng nhập, người dùng có thể thêm một sản phẩm vào giỏ hàng kèm với khuyến mãi sản phẩm (nếu có). Trang **Giỏ hàng** hiển thị thông tin sản phẩm: _tên tranh, kích thước, số lượng hiện có trong giỏ hàng,giảm giá (nếu có)_. Giỏ hàng có các chức năng: _Chọn tất cả sản phẩm, chọn 1 sản phẩm, tăng/giảm số lượng sản phẩm, xóa sản phẩm khỏi giỏ hàng_.
5. **Thanh toán**: Sau khi đã thêm sản phẩm vào giỏ hàng. Người dùng có thể tiến hành thanh toán. Sau khi chọn sản phẩm muốn thanh toán trong giỏ hàng thì hệ thống sẽ chuyển sang trang thanh toán. Người dùng chỉ có thể thanh toán nếu như đã điền địa chỉ giao hàng vào thông tin của mình trong trang **Tài khoản**. Hiện tại, web chỉ hỗ trợ thanh toán bằng tiền mặt.
6. **Đánh giá sản phẩm**: Sau khi thanh toán đơn hàng, người dùng có thể tiến hành đánh giá sản phẩm đã mua.
7. **Xác thực người dùng**: Có thể đăng ký tài khoản mới, đăng nhập bằng tài khoản của hệ thống hoặc đăng nhập bằng tài khoản Google. Với tài khoản mới đăng ký, hệ thống sẽ gửi một mã xác thực đến email đã đăng ký. Người dùng có thể vào trang xác thực để hoàn tất đăng ký.
8. **Chi tiết người dùng**: Bao gồm các thông tin người dùng kèm theo lịch sử xem sản phẩm, thay đổi thông tin, xóa thông tin.
9. **Chi tiết admin**: Bao gồm các chức năng quản lý và thay đổi thông tin của admin.

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
### Các tính năng dự kiến
1. Sửa lại **TOÀN BỘ** phần code chưa hoàn thiện.
2. Bổ sung chức năng thêm sản phẩm vào danh sách yêu thích.
3. Bổ sung phần liên kết đến sản phẩm trong trang Giỏ hàng và User.

---
### Ghi chú
- Sử dụng Apache Tomcat 10.1.31 để host server