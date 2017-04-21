<?php

    class BooksController extends Controller{
        public function __construct($data = array())
        {
            parent::__construct($data);
            $this->model = new Book();
        }

        public function index()
        {

            $this->data['books'] = $this->model->getDown();
            $this->data['categories'] = $this->model->getCategories();

        }
//        public function test(){
//
//        }

    public function admin_about()
    {
        //$this->data['about'] = 'test3 in controller';
    }

    public function view()
    {
        $params = App::getRouter()->getParams();

        if (isset($params[0])) {
            $id = (int)($params[0]);
            $this->data['book'] = $this->model->getById($id);
            $this->data['comment'] = $this->model->getBookComment($id);
            $this->data['likes'] = $this->model->getCountLikes($id);
        }else echo "this text is from pages.controller. view function";

        $this->data['categories'] = $this->model->getCategories();
    }

    public function admin_index()
    {
        $this->data['books'] = $this->model->getList();
    }

    public function admin_edit()


    {

        $this->data['categories'] = $this->model->getCategories();
        $uploaddirPicture = Config::get('root') . Config::get('images');
        $uploaddirBook = Config::get('root') . Config::get('books');





        if(isset($_FILES['book']) && isset($_FILES['image'])) {


            $image_path = time() . $_FILES['image']['name'];
            $book_path = time() . $_FILES['book']['name'];

            move_uploaded_file($_FILES['book']['tmp_name'], $uploaddirBook .
                $book_path);
            move_uploaded_file($_FILES['image']['tmp_name'], $uploaddirPicture .
                $image_path);
            if ($_FILES['book']['size'] != 0) {
                $_POST['book_path'] = $book_path;
            }
            if($_FILES['image']['size'] != 0) {
                $_POST['image_path'] = $image_path;

            }
        }
            if ($_POST) {
            //echo "<pre>";
            //var_dump($_POST);
                if(isset($_POST['image_path']))
                {$_POST['image_path'] = $image_path;}

                if(isset($_POST['book_path']))
                {$_POST['book_path'] = $book_path;}
                $id = isset($_POST['id']) ? $_POST['id'] : null;

                if ($this->model->save($_POST, $id)) {
                    Session::setFlash('Спасибо, книга изменена успешно.');
                }
            }





        if (isset($this->params[0])) {
            // echo 'working admin edit';
            $this->data['book'] = $this->model->getById($this->params[0]);
        } else {
            Session::setFlash('Wrong page id');
           // Router::redirect('/admin/books/');
        }
    }

    public function admin_add()
    {
        $this->data['categories'] = $this->model->getCategories();
        $uploaddirPicture = Config::get('root') . Config::get('images');
        $uploaddirBook = Config::get('root') . Config::get('books');
        //$dir = '/home/grey/hometask/php-academy/homeworks/functions_forms_tasks/6/gallery';

        if(!(isset($_POST['alias']) || isset($_POST['title']) || isset($_POST['description'])
            || isset($_POST['author']))){
            Session::setFlash("Все поля обязательны для заполнения");
            return;

            foreach (Config::get('blacklist') as $item){

                if(preg_match("/$item\$/i", $_FILES['image']['name'])){
                    Session::setFlash("Вы грузите не изображение!!!");
                    return;
                }

                if(preg_match("/$item\$/i", $_FILES['book']['name'])){
                    Session::setFlash("Вы грузите не книгу!!!");
                    return;
                }

            }

            if(($_FILES['book']['size'] > 20485760) || ($_FILES['image']['size']) > 20485760){
                Session::setFlash("Размер файлов не должен превышать 10 Мбайт.");
                return;
            }
            //print_r( ($_FILES['book']['size']));
            //echo('<pre>');
//            var_dump((mime_content_type( $_FILES['book']['tmp_name'])));
//            var_dump((mime_content_type( $_FILES['image']['tmp_name'])));

            $picture_type = mime_content_type( $_FILES['image']['tmp_name']);
            $book_type = mime_content_type( $_FILES['book']['tmp_name']);


            if(!(($picture_type == 'image/jpeg') || ($picture_type == 'image/jpeg') || $picture_type == 'image/png')) {
                Session::setFlash("Вы грузите не изображение!!!");
                return;
            }

            if(!(($book_type == 'text/plain') || ($book_type == 'application/xml'))){
                Session::setFlash("Вы грузите не книгу!!!");
                return;
            }
        }



        if(isset($_FILES['book']) && isset($_FILES['image'])){
            $image_path =   time() . $_FILES['image']['name'];
            $book_path =  time() . $_FILES['book']['name'] ;

            move_uploaded_file($_FILES['book']['tmp_name'], $uploaddirBook .
                $book_path );
            move_uploaded_file($_FILES['image']['tmp_name'], $uploaddirPicture .
                $image_path);
            if(($_FILES['book']['size'] != 0) && $_FILES['image']['size'] != 0) {
                $_POST['image_path'] = $image_path;
                $_POST['book_path'] = $book_path;
                if ($_POST) {
                    if ($this->model->save($_POST)) {
                        Session::setFlash('Спасибо, книга загружена успешно.ится на сайте после проверки.');
                    }
                }
            }

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
        Router::redirect('/admin/books');
    }

    public function download(){
        //var_dump($_FILES);

    $this->data['categories'] = $this->model->getCategories();
    $uploaddirPicture = Config::get('root') . Config::get('images');
    $uploaddirBook = Config::get('root') . Config::get('books');
    //$dir = '/home/grey/hometask/php-academy/homeworks/functions_forms_tasks/6/gallery';

        if(!(isset($_POST['alias']) || isset($_POST['title']) || isset($_POST['description'])
            || isset($_POST['author']))){
            Session::setFlash("Все поля обязательны для заполнения");

        }


        if(isset($_FILES['book']) && isset($_FILES['image'])){
            $image_path =   time() . $_FILES['image']['name'];
            $book_path =  time() . $_FILES['book']['name'] ;

            foreach (Config::get('blacklist') as $item){

                if(preg_match("/$item\$/i", $_FILES['image']['name'])){
                    Session::setFlash("Вы грузите не изображение!!!");
                    return;
                }

                if(preg_match("/$item\$/i", $_FILES['book']['name'])){
                    Session::setFlash("Вы грузите не книгу!!!");
                   return;
                }

            }

            if(($_FILES['book']['size'] > 10485760) || ($_FILES['image']['size']) > 10485760){
                Session::setFlash("Размер файлов не должен превышать 10 Мбайт.");
                return;
            }
            //print_r( ($_FILES['book']['size']));
            //echo('<pre>');
//            var_dump((mime_content_type( $_FILES['book']['tmp_name'])));
//            var_dump((mime_content_type( $_FILES['image']['tmp_name'])));

            $picture_type = mime_content_type( $_FILES['image']['tmp_name']);
            $book_type = mime_content_type( $_FILES['book']['tmp_name']);


            if(!(($picture_type == 'image/jpeg') || ($picture_type == 'image/jpeg') || $picture_type == 'image/png')) {
                Session::setFlash("Вы грузите не изображение!!!");
                return;
            }

            if(!(($book_type == 'text/plain') || ($book_type == 'application/xml'))){
                Session::setFlash("Вы грузите не книгу!!!");
                return;
            }


            move_uploaded_file($_FILES['book']['tmp_name'], $uploaddirBook .
                $book_path );
            move_uploaded_file($_FILES['image']['tmp_name'], $uploaddirPicture .
                $image_path);
            if(($_FILES['book']['size'] != 0) && $_FILES['image']['size'] != 0) {
                $_POST['image_path'] = $image_path;
                $_POST['book_path'] = $book_path;
                if ($_POST) {
                    if ($this->model->save($_POST)) {
                        Session::setFlash('Спасибо, книга загружена успешно. Она появится на сайте после проверки.');
                    }
                }
            }else{
                Session::setFlash('Вы не загрузили книгу или изображение. Пожалуйста, повторите попытку. ');
            }

        }
    }

    public function page404(){

}
    public function getBook(){
        if (isset($this->params[0])) {
            $this->model->countDownload($this->params[0]);
        }


    }

    public function likes()
    {

        $this->data['books'] = $this->model->getLikes();
        $this->data['categories'] = $this->model->getCategories();

    }

    }