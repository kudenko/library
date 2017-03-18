<?php

    class BooksController extends Controller{
        public function __construct($data = array())
        {
            parent::__construct($data);
            $this->model = new Book();
        }

        public function index()
        {

            $this->data['books'] = $this->model->getList();
            $this->data['categories'] = $this->model->getCategories();

        }
//        public function test(){
//
//        }

    public function test3()
    {
        $this->data['wtf'] = 'test3 in controller';
    }

    public function view()
    {
        $params = App::getRouter()->getParams();

        if (isset($params[0])) {
            $alias = strtolower($params[0]);
            $this->data['book'] = $this->model->getByAlias($alias);
        }else echo "this text is from pages.controller. view function";

        $this->data['categories'] = $this->model->getCategories();
    }

    public function admin_index()
    {
        $this->data['books'] = $this->model->getList();
    }

    public function admin_edit()

    {
        var_dump($_FILES);
        $this->data['categories'] = $this->model->getCategories();

        $uploaddirPicture = Config::get('root') . Config::get('images');
        $uploaddirBook = Config::get('root') . Config::get('books');
        if(isset($_FILES['book']) && isset($_FILES['image'])){
            move_uploaded_file($_FILES['book']['tmp_name'], $uploaddirBook .
                $_FILES['book']['name']);
            move_uploaded_file($_FILES['image']['tmp_name'], $uploaddirPicture .
                $_FILES['image']['name']);

            if ($_POST) {
                // var_dump($_POST);
                $id = isset($_POST['id']) ? $_POST['id'] : null;

                $result = $this->model->save($_POST, $id);
                if ($result) {
                    Session::setFlash("Page was saved");
                } else {
                    Session::setFlash("Page did't saved");
                }
                //Router::redirect('/admin/books');
            }

        }



        if (isset($this->params[0])) {
            // echo 'working admin edit';
            $this->data['book'] = $this->model->getById($this->params[0]);
        } else {
            Session::setFlash('Wrong page id');
            Router::redirect('/admin/books/');
        }
    }

    public function admin_add()
    {
        if ($_POST) {
            $result = $this->model->save($_POST);
            if ($result) {
                Session::setFlash("Page was saved");
            } else {
                Session::setFlash("Page did't saved");
            }
            Router::redirect('/admin/books');
        }
    }

    public function admin_delete()
    {
        if (isset($this->params[0])) {
            $result = $this->model->delete($this->params[0]);

            if ($result) {
                Session::setFlash("Page was deleted");
            } else {
                Session::setFlash("Page did't deleted");
            }
        }
        Router::redirect('/admin/pages');
    }

    public function download(){
        var_dump($_FILES);

    $this->data['categories'] = $this->model->getCategories();
    $uploaddirPicture = Config::get('root') . Config::get('images');
    $uploaddirBook = Config::get('root') . Config::get('books');
    //$dir = '/home/grey/hometask/php-academy/homeworks/functions_forms_tasks/6/gallery';

        if(isset($_FILES['book']) && isset($_FILES['image'])){
            move_uploaded_file($_FILES['book']['tmp_name'], $uploaddirBook .
                $_FILES['book']['name']);
            move_uploaded_file($_FILES['image']['tmp_name'], $uploaddirPicture .
                $_FILES['image']['name']);

            if($_POST){
                if($this->model->save($_POST)){
                    Session::setFlash('Thank you, your book was sent successfully');
                }
            }
        }else{echo 'error from books controller ';

        }





    }

    }