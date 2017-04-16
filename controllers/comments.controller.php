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

    public function admin_index(){
            $this->data['comments'] = $this->model->getList();
    }

    public function admin_delete()
    {
        if (isset($this->params[0])) {
            $result = $this->model->delete($this->params[0]);

            if ($result) {
                Session::setFlash("Comment was deleted");
            } else {
                Session::setFlash("Comment did't deleted");
            }
            }
        Router::redirect('/admin/comments');
        }





    }