
class AdvancedSearch {

    constructor() {

        this.$el = $('#advanced-search');
        let $el = this.$el;

        $('html').click(function() {
            $el.fadeOut();
        });

        $el.click(function(event){
            event.stopPropagation();
        });

        $('#show-advanced-search').click(function(event){
            $el.fadeToggle();
            event.stopPropagation();
        });

        this.setPosition();
    }

    setPosition() {
        this.$el.css({
            'position' : 'absolute',
            'left' : '50%',
            'top' : '0px',
            'margin-left' : -this.$el.outerWidth()/2,
            'margin-top' : '140px'
        });
    }

    clearAll()
    {
        this.$el.find(":checkbox:checked").removeAttr('checked');
        this.$el.find(".player-name-input").each(function() {
            $(this).val("");
        });
    }

    appendPart(query, part)
    {
        if(query ==  "") {
            query = part;
        }
        else if(part != "") {
            query = query + " " + part;
        }

        return query;
    }

    checkboxesToHiddenInput(checkboxesContainer, hiddenInput) {
        var boxes = $(checkboxesContainer).find(":checked");
        var list = boxes.map(function() {return $(this).val(); }).get().join();
        $(hiddenInput).val(list);
    }

    formSubmit()
    {
        this.checkboxesToHiddenInput("#team-checkboxes", "#teams-input");
        this.checkboxesToHiddenInput("#manufacturer-checkboxes", "#manufacturers-input");
        this.checkboxesToHiddenInput("#product-checkboxes", "#products-input");
        this.checkboxesToHiddenInput("#tag-checkboxes", "#tags-input");

        var names = $(".player-name-input input");
        names.each(function() {
            query = this.appendPart(query, $(this).val());
        });

        var input = document.getElementById('search-hidden-input');
        input.value = query;

    }


}


