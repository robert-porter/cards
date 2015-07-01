$(function() {

    var loaded = [window.location.href, window.location.href+'&page=1'];

    let url = $('.pagination .next_page').attr('href');

    $(window).scroll(function(){
        if  ( ($(document).height() - $(window).height()) - $(window).scrollTop() < 300 ){
            let url = $('.pagination .next_page').attr('href');

            for(var i = 0; i < loaded.length; i++)
                if(loaded[i] === url)
                    return;

            loaded.push(url);
            $.getScript(url);
        }
    });
});