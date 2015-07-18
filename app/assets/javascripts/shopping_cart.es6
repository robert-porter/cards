// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

class ShoppingCart {
    constructor() {
        $('html').click(function() {
            $('#shopping-cart').fadeOut();
        });
        $('#shopping-cart').click(function(event){
            event.stopPropagation();
        });

        $('#show-shopping-cart').click(function(event){
            $('#shopping-cart').fadeToggle();
            event.stopPropagation();
        });

        let cart = $('#shopping-cart');
        cart.css({
            'position' : 'absolute',
            'left' : '50%',
            'top' : '0px',
            'margin-left' : -cart.outerWidth()/2,
            'margin-top' : '140px'
        });
    }

    playItemAddedAnimation() {

        var cart = $('.shopping-cart-icon');
        var imgtodrag = $('.item').find("img").eq(0);
        if (imgtodrag) {
            var imgclone = imgtodrag.clone()
                .offset({
                    top: imgtodrag.offset().top,
                    left: imgtodrag.offset().left
                })
                .css({
                    'opacity': '0.5',
                    'position': 'absolute',
                    'height': '150px',
                    'width': '150px',
                    'z-index': '100'
                })
                .appendTo($('body'))
                .animate({
                    'top': cart.offset().top + 22,
                    'left': cart.offset().left + 64,
                    'width': 75,
                    'height': 75
                }, 1000, 'easeInOutExpo');

            setTimeout(function () {
                cart.effect("shake", {
                    times: 2
                }, 200);
            }, 1500);

            imgclone.animate({
                'width': 0,
                'height': 0
            }, function () {
                $(this).detach()
            });
        }
    }

    addItem(content, totalPrice) {
        $('#line-items').append(content);
        $('#total-price').text(totalPrice);

    }

    updateQuantity(id, quantity, lineItemPrice, totalPrice) {
        $(id).find('.line-item-quantity').text(quantity);
        $(id).find('.line-item-price').text(lineItemPrice);
        $('#total-price').text(totalPrice)
    }
}