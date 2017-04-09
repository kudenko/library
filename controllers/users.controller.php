<?php

    class UsersController extends Controller{
        public function __construct(array $data = array())
        {
            parent::__construct($data);
            $this->model = new User();
        }
        public function admin_login(){
            if($_POST && isset($_POST['login']) && isset($_POST['password'])){
                $user = $this->model->getByLogin($_POST['login']);
                $hash = md5(Config::get('salt').$_POST['password']);

                if($user && $user['is_active'] && $hash == $user['password']){
                    Session::set('login', $user['login']);
                    Session::set('role', $user['role']);
                }
                Router::redirect('/admin/');
            }
        }

        public function admin_logout(){
            Session::destroy();
            Router::redirect('/admin/');
        }

        public function registration()
        {


            if (isset($_POST['login']) && isset($_POST['password']) && isset($_POST['email'])) {

            if($this->model->getByLogin($_POST['login'])){
                Session::setFlash('Такое имя уже используется. Пожалуйста, измените имя');
                return;
            }

            if($this->model->getByEmail($_POST['email'])){
                Session::setFlash('Такой емейл уже используется. Пожалуйста, измените емейл');
                    return;
            }

                if ($_POST['password'] == $_POST['rep_pass']) {

                    if($this->model->save($_POST)) {

                        Session::setFlash('Пользователь успешно создан');

                    }else{
                        Session::setFlash('Все поля при регистрации должны быть заполнены');

                    }

                }else{
                    Session::setFlash('Пароли не совпадают');
                }


            }else{
                Session::setFlash('Все поля при регистрации должны быть заполнены');
            }
        }

        public function login(){
            if($_POST && isset($_POST['login']) && isset($_POST['password'])){
                $user = $this->model->getByLogin($_POST['login']);
                $hash = md5(Config::get('salt').$_POST['password']);

                if($user && $user['is_active'] && $hash == $user['password']){
                    Session::set('login', $user['login']);
                    Session::set('role', $user['role']);
                    Router::redirect('/');
                }
                //Router::redirect('/admin/');
            }
        }

        public function logout(){
            Session::destroy();
            Router::redirect('/');
        }
    }