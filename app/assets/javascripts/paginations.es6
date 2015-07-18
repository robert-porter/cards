




class Pagination {

    constructor() {
        this.loaded = [];
        this.loaded.push(this.nextPageNumber() - 1);
        $(window).scroll(this.scrollHandler.bind(this));
    }

    shouldLoadNexPage() {
       return ($(document).height() - $(window).height()) - $(window).scrollTop() < 300
    }

    scrollHandler() {
        if  ( this.shouldLoadNexPage() ){
            let next = this.nextPageNumber();
            let url = this.nextPageUrl();

            if(next == null) // page is loading...
                return;

            for(var i = 0; i < this.loaded.length; i++)
                if(this.loaded[i] == next)
                    return;

            this.showLoading();
            this.loaded.push(url);
            $.getScript(url);
        }
    }

    addPaginationControl(content) {
        $('.pagination').replaceWith(content);
    }

    end() {
        $(window).off('scroll');
        $('.pagination').remove();
    }

    showLoading() {
        $('.pagination').html('<img src="/images/ajax-loader.gif" alt="Loading..." title="Loading..." />');
    }

    nextPageNumber() {
        let url = this.nextPageUrl();
        if(url == null)
            return null;

        let pageRE = /page=(\d+)/
        let page = pageRE.exec(url)[1];
        return page;
    }

    nextPageUrl()
    {
        return $('.pagination .next_page a').attr('href');
    }
}
