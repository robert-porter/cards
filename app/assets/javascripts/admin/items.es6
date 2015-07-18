function itemFormSubmit()
{
    var price = +$('#price-cents').val();
    $('#price-cents').val(100 * price);

    var shippingPrice = +$('#shipping-price-cents').val();
    $('#shipping-price-cents').val(100 * shippingPrice);
}
