<?php

    class LikesController extends Controller
    {
        public function __construct($data = array())
        {
            parent::__construct($data);
            $this->model = new Like();
        }

        public function like(){
            if($_POST){
                var_dump($_POST);
                var_dump($this->model->getUniqueLike($_POST['book_id'], $_POST['user_name']));
                $sq = $this->model->getUniqueLike($_POST['book_id'], $_POST['user_name']);
                if(!(empty($sq))){
                        return;
                }else {

                    $this->model->save($_POST);

                }

            }else{
                return false;
            }
        }

    }