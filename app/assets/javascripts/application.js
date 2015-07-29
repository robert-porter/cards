// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require jquery.turbolinks
//= require jquery-ui
//= require bootstrap-sprockets
//= require_tree .


var advancedSearch = null;
var pagination = null;
var shoppingCart = null;
var ordersSearch = null;
var checkout = null;
var shippingAddOns = null;

$(function() {

    advancedSearch = new AdvancedSearch();
    pagination = new Pagination();
    shoppingCart = new ShoppingCart();
    ordersSearch = new OrdersSearch();
    checkout = new Checkout();

    $('#package-type').change(function() {
        var orderId = $('#order-id').val();
        var params = {
            package_weight: $('#package-weight').val(),
            package_type: $('#package-type').val()
        }
        $('#shipping-rates').html('<div align="center"><img src="/images/ajax-loader.gif" alt="Loading..." title="Loading..." /></div>');
        $.getScript('/admin/shipping/get_rates/' + orderId + '?' + $.param(params));
    });
});

/*

$(function() {
    function split( val ) {
        return val.split(" ");
    }
    function extractLast( term ) {
        return split( term ).pop();
    }

    $( "#search-field" )
        // don't navigate away from the field on tab when selecting an item
        .bind( "keydown", function( event ) {
            if ( event.keyCode === $.ui.keyCode.TAB &&
                $( this ).autocomplete( "instance" ).menu.active ) {
                event.preventDefault();
            }
        })
        .autocomplete({
            minLength: 0,
            source: function( request, response ) {
                $.getJSON( "/search_suggestions", {
                    term: extractLast( request.term )
                }, response );
            },
            focus: function() {
                // prevent value inserted on focus
                return false;
            },
            select: function( event, ui ) {
                var terms = split( this.value );
                // remove the current input
                terms.pop();
                // add the selected item
                terms.push( ui.item.value );
                // add placeholder to get the space at the end
                terms.push( "" );
                this.value = terms.join( " " );
                return false;
            }
        });
});
*/