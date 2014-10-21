$(function () {
    //to fix collapse mode width issue
    $(".nav li,.nav li a,.nav li ul").removeAttr('style');

    //for dropdown menu
    $(".dropdown-menu").parent().removeClass().addClass('dropdown');
    $(".dropdown>a").removeClass().addClass('dropdown-toggle').append('<b class="caret"></b>').attr('data-toggle', 'dropdown');

    //remove default click redirect effect           
    $('.dropdown-toggle').attr('onclick', '').off('click');
});