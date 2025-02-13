$('.verify-cancel-button').on('click', function () {
    $('.overlay').addClass('d-none');
});

// Hàm xử lý thông tin người dùng khi đăng nhập thành công
function handleCredentialResponse(response) {
    // Lấy id_token từ Google (JWT token)
    var id_token = response.credential;

    // Để lấy thông tin từ Google
    const googleUser = parseJwt(id_token);

    // Lấy thông tin cá nhân
    const userName = googleUser.name;
    const userEmail = googleUser.email;
    const userImage = googleUser.picture;

    $.ajax({
        url: '/google-login',
        type: 'POST',
        data: {
            name: userName,
            email: userEmail,
            image: userImage,
        },
        success: function (response) {
            if (response.success) {
                window.location.href = "/";
            } else if(!response.success) {
                alert("Đăng nhập không thành công!");
            }
        },
        error: function () {
            alert("Đăng nhập không thành công!");
        }
    });
}

// Hàm giải mã id_token (JWT) để lấy thông tin người dùng
function parseJwt(token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));

    return JSON.parse(jsonPayload);
}