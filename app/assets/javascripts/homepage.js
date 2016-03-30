// $(document).ready(function() {
$("#client-info").click(function() {
    $("#client").stop().slideToggle(500);
    return false;
});

$("#developer-info").click(function() {
    $("#developer").stop().slideToggle(500);
    return false;
});
    // });

$("#navbar-button").click(function() {
    $("#navbar").toggleClass('hide-height');
    $('#landing-page').toggleClass('darken');
});
