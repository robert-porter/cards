
$(function() {
    let loaded = [];
    let url = $('.pagination .next_page a').attr('href');
    loaded.push(url.replace(/page=\d/, 'page=1'));
    $(window).scroll(function(){
        if  ( ($(document).height() - $(window).height()) - $(window).scrollTop() < 300 ){
            let url = $('.pagination .next_page a').attr('href');

            for(var i = 0; i < loaded.length; i++)
                if(loaded[i] === url)
                    return;

            $('.pagination').html('<img src="/images/ajax-loader.gif" alt="Loading..." title="Loading..." />')
            loaded.push(url);
            $.getScript(url);
        }
    });
});