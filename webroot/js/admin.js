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

$(function(){

    $('.delcomm').click(function(){
        var commId = $(this).attr('data-id');
        if(confirm('Удалить выбранный элемент? ')){
            $.get("/admin/comments/delete/"+ commId, function() {
                location.reload();
            })
        }});

});

$(function(){

    $('.down').click(function(){
        var book_id = $(this).attr('data-id');
        var file = $(this).attr('data-file');
            $.get("/books/getBook/" + book_id, function() {
                document.location.href = file ;

            })
        });

});

