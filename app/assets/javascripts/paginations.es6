
$(function() {
    let loaded = [];
    let url = $('.pagination .next_page a').attr('href');

    let page_re = /page=(\d+)/
    let page = page_re.exec(url)[1];
    loaded.push(+page - 1);

    $(window).scroll(function(){
        if  ( ($(document).height() - $(window).height()) - $(window).scrollTop() < 300 ){
            let url = $('.pagination .next_page a').attr('href');

            if(url == null) // page is loading
                return;

            let page = page_re.exec(url)[1];

            for(var i = 0; i < loaded.length; i++)
                if(loaded[i] == page)
                    return;

            $('.pagination').html('<img src="/images/ajax-loader.gif" alt="Loading..." title="Loading..." />')
            loaded.push(url);
            $.getScript(url);
        }
    });
});