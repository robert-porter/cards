function checkboxesToHiddenInput(checkboxesContainer, hiddenInput) {
    var boxes = $(checkboxesContainer).find(":checked");
    var list = boxes.map(function() {return $(this).val(); }).get().join();;
    $(hiddenInput).val(list);
}

function itemFormSubmit()
{
    checkboxesToHiddenInput("#item-form-tags-checkboxes", "#tag_list");
}
