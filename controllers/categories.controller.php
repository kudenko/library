<?php

    class CategoriesController extends Controller{

        public function __construct(array $data = array()){
            parent::__construct($data);
            $this->model = new Category();
        }

        public function admin_index(){

                $this->data = $this->model->getList();

            }


        public function index(){
            $this->data = $this->model->getList();
        }

        public function view()
        {
            $params = App::getRouter()->getParams();

            if (isset($params[0])) {
                $alias = strtolower($params[0]);
                $this->data['categories'] = $this->model->getByAlias($alias);
                $this->data['category']  = $this->model->getCategoryById($alias);
            }else echo "this text is from pages.controller. view function";

        }

        public function admin_edit(){

            //$params = App::getRouter()->getParams();


            if ($_POST) {
                 var_dump($_POST);
                $id = isset($_POST['id']) ? $_POST['id'] : null;

                $result = $this->model->save($_POST, $id);
                if ($result) {
                    Session::setFlash("Category was saved");
                } else {
                    Session::setFlash("Category did't saved");
                }
               // Router::redirect('/admin/categories');
            }

                if (isset($this->params[0])) {
                    //echo "dasdas";
                    // echo 'working admin edit';
                    $this->data['category'] = $this->model->getCategoryById($this->params[0]);
                } else {
                    Session::setFlash('Wrong page id');
                    Router::redirect('/admin/books/');
                }



        }

        public function admin_add(){
            if($_POST){
                $result = $this->model->save($_POST, $id);
                if ($result) {
                    Session::setFlash("Category was saved");
                } else {
                    Session::setFlash("Category did't saved");
                }
                Router::redirect('/admin/categories');
            }
        }


        public function admin_delete()
        {
            if (isset($this->params[0])) {
                $result = $this->model->delete($this->params[0]);

                if ($result) {
                    Session::setFlash("Category was deleted");
                } else {
                    Session::setFlash("Category did't deleted");
                }
            }
            Router::redirect('/admin/categories');
        }



    }