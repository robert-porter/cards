
class OrdersSearch {

    constructor() {

        this.$el = $('#orders-search');
        let $el = this.$el;

        $('html').click(function() {
            $el.fadeOut();
        });

        $el.click(function(event){
            event.stopPropagation();
        });



        $('#show-orders-search').click(function(event){
            $el.fadeToggle();
            event.stopPropagation();
        });

        $("#date-begin").datepicker();
        $("#date-end").datepicker();

        // don't close the search form if the date picker from the search form is clicked
        $('.ui-datepicker').click(function(event){
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

    }


}

