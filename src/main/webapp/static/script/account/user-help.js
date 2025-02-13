// Support user
$(".question").click(function () {
    console.log($(this).children(".answer").length)
    $(this).children(".answer").css("display", "block");
})