<?php

    class CommentsController extends Controller{
        public function __construct($data = array())
        {
            parent::__construct($data);
            $this->model = new Comment();
        }

    public function sendComment()
    {
        var_dump($_POST);
        if (isset($_POST)) {
            $this->model->save($_POST) ;
            Router::redirect("/books/view/" . $_POST['book_id']);
        }
    }
    }