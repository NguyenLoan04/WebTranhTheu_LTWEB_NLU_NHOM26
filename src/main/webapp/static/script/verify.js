$('.verify-cancel-button').click(function () {
    $('.overlay').addClass('d-none');
});

$('.overlay').click(function (event) {
    if ($(event.target).closest('form').length === 0) {
        $('.overlay').addClass('d-none');
    }
});

$('#verify-form').on('submit', function (event) {
    event.preventDefault();

    $.ajax({
        url: "/verify",
        type: "POST",
        data: {
            code: $('#verify').val()
        },
        success: function (response) {
            if (response.success) {
                $('.success-verify').removeClass('d-none');
            } else {
                $('.fail-verify').removeClass('d-none');
            }
            $('#submitBtn').prop('disabled', false);
        },
        error: function () {
            $('.fail-verify').removeClass('d-none');
            $('#submitBtn').prop('disabled', false);
        }
    });
});