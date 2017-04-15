function confirmDelete() {
    if(confirm("Delete this item? ")){
        return true;
    }else{
        return false;
    }
}
$(function(){

    $('.del').click(function(){
        var bookId = $(this).attr('data-id');
        if(confirm('Удалить выбранный элемент? ')){
        $.get("/admin/books/delete/"+ bookId, function() {
            location.reload();
        })
    }});

});

$(function(){

    $('.delcat').click(function(){
        var catId = $(this).attr('data-id');
        if(confirm('Удалить выбранный элемент? ')){
            $.get("/admin/categories/delete/"+ catId, function() {
                location.reload();
            })
        }});

});
