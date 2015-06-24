$(function() {
    $(window).scroll(function(){
        if  ( ($(document).height() - $(window).height()) - $(window).scrollTop() < 300 ){
            let url = $('.pagination .next_page').attr('href');
            $.getScript(url);
        }
    });
});