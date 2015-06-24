

function clearAll()
{
    $(":checkbox:checked").removeAttr('checked');
    $(".player-name-input").each(function() {
        $(this).val("");
    });
}


function appendPart(query, part)
{
    if(query ==  "") {
        query = part;
    }
    else if(part != "") {
        query = query + " " + part;
    }

    return query;
}

function advancedSearchFormSubmit()
{
    var teamBoxes = $("#team-checkboxes").find(":checked");
    var teamList = teamBoxes.map(function() {return $(this).val(); }).get().join();
    $("#teams-input").val(teamList);

    var manufacturerBoxes = $("#manufacturer-checkboxes").find(":checked");
    var manufacturerList = manufacturerBoxes.map(function() {return $(this).val(); }).get().join();
    $("#manufacturers-input").val(manufacturerList);

    var productBoxes = $("#product-checkboxes").find(":checked");
    var productList = productBoxes.map(function() {return $(this).val(); }).get().join();
    $("#products-input").val(productList);

    var tagBoxes = $("#tag-checkboxes").find(":checked");
    var tagList = productBoxes.map(function() {return $(this).val(); }).get().join();
    $("#tags-input").val(productList);

    var names = $(".player-name-input input");

    names.each(function() {
       query = appendPart(query, $(this).val());
    });

    var input = document.getElementById('search-hidden-input');
    input.value = query;

}
