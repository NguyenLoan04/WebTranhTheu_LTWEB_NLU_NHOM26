$('.verify-cancel-button').click(function () {
    $('.overlay').addClass('d-none');
});

$('.overlay').click(function (event) {
    if ($(event.target).closest('.popup-container').length === 0) {
        $('.overlay').addClass('d-none');
    }
});

$('#confirm-update-pass-form').on('submit', function (event) {
    event.preventDefault();

    $.ajax({
        url: "/update-pass",
        type: "POST",
        data: {
            accountId: $('#submitBtn').val(),
            code: $('#code').val(),
            password: $('#password').val(),
            confirmPassword: $('#pre-password').val(),
        },
        success: function (response) {
            if (!response.error) {
                if (response.success) {
                    $('.success-update-pass').removeClass('d-none');
                } else if (!response.success) {
                    $('.fail-update-pass').removeClass('d-none');
                }
            } else {
                $("#error").text(response.message);
            }
            $('#submitBtn').prop('disabled', false);
        },
        error: function () {
            $('.fail-update-pass').removeClass('d-none');
            $('#submitBtn').prop('disabled', false);
        }
    });
});