function itemFormSubmit()
{
    var tagBoxes = $("#item-form-tags-checkboxes").find(":checked");
    var tagList = tagBoxes.map(function() {return $(this).val(); }).get().join();
    $("#tag_list").val(tagList);

    var price = +$('#price-cents').val();
    $('#price-cents').val(100 * price);
}
