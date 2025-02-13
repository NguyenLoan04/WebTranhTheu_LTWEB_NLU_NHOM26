<%@include file="/layout/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <div class="px-3 py-2 container">
        <div class="row px-3 py-3">
            <div class="col-4 border-end pe-3">
                <div class="row d-flex justify-content-center">
                    <img class="col-4" src="../../static/asset/favicon/web_logo.png" alt="" id="footer-logo">

                </div>
                <div class="row p-3 text-white">
                    Sự khác biệt giữa tranh thêu tay và tranh thêu chữ thập
                    <br/>
                    Đối với tranh thêu tay nghệ thuật thì khác hẳn. Tranh thêu tay truyền thống phải mất nhiều thời
                    gian để làm quen và học, tranh truyền thống không đơn giản chỉ là kỹ thuật mà còn là tình cảm là
                    tâm hồn của người thợ được truyền tải qua mỗi bức tranh. Chính vì thế mỗi bức tranh đều có nét
                    riêng biệt và có hồn là như vậy.
                </div>
            </div>
            <!--            <div class="col-1"></div>-->
            <div class="col-8 text-white d-flex flex-column justify-content-between py-2">
                <div class="ms-3 row">
                    <div class="col-4">
                        <h4>Dịch vụ</h4>
                        <div class="row px-3"><a href="/about-us">Về chúng tôi</a></div>
                        <div class="row px-3"><a href="/privacy-policy">Chính sách quyền riêng tư</a></div>
                        <div class="row px-3"><a href="/terms">Điều khoản sử dụng</a></div>
                    </div>
                    <div class="col-4">
                        <h4>Hỗ trợ</h4>
                        <div class="row px-3"><a href="/policy">Chính sách đổi - trả - hoàn tiền</a></div>
                        <div class="row px-3"><a href="/policy">Chính sách vận chuyển</a></div>
                    </div>
                </div>
                <div class="ms-3 row py-4">
                    <div class="row "><h4>Liên hệ</h4></div>
                    <div class="col-4 px-3"><i class="fa-solid fa-location-dot px-1"></i> Khu phố 6, phường Linh
                        Trung, thành phố Thủ Đức, TP.HCM
                    </div>
                    <div class="col-4 px-3 "><i class="fa-regular fa-envelope px-1"></i>hehe@gmail.com</div>
                    <div class="col-4 px-3 "><i class="fa-solid fa-phone px-1"></i> 0392334750</div>
                </div>
            </div>
        </div>
    </div>
</footer>

<script>
    let cartSize = '${sessionScope.cart.getCartSize()}'
    if (cartSize !== '' && parseInt(cartSize)!==0) {
        const badge = $("#cart-badge")
        badge.removeClass("d-none")
        badge.text(parseInt(cartSize))
    }
</script>