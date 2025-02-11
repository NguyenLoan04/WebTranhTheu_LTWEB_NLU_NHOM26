$(document).ready(function () {
    $('#myTable').DataTable({
        destroy: true,
        scrollY: "350px"
    }); // Khởi tạo DataTable
    $('.dt-length').css("display", "none");
    $('.dt-info').css("display", "none");
    $('.dt-search').css("display", "none");
    $('table.dataTable th.dt-type-numeric').css("text-align", "center");
    $('.dt-layout-row').eq(2).children().first().addClass('d-none');
    $('.dt-layout-row').eq(2).children().eq(1).removeClass('dt-layout-end');
    $('.dt-layout-row').eq(2).children().eq(1).addClass('dt-layout-start');
});

$('input[name="order"]').change(function () {

    $('.choose-radio-order').hide();

    const valChecked = $(this).val();
    $(`#choose-order-${valChecked}`).show();
});

//khởi tạo ban đầu
$('.choose-radio-order').hide();
$('#choose-order-1').show();
 