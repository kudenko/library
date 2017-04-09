<?php

    class Category extends Model{

        public function getList(){
            $sql = "select * from book_categories";
            //echo ('working ');
            return $this->db->query($sql);
        }

        public function getByAlias($alias){
            $sql = "SELECT * FROM book_categories  inner join books on book_categories.category_id = books.category where category_id = $alias" ;
            //echo ('working ');
            return $this->db->query($sql);
        }

        public function getCategoryById($id){
            $id = (int)$id;
            $sql = "select * from book_categories where category_id = '{$id}'  limit 1";
            return $this->db->query($sql);
            return isset($result[0]) ? $result[0] : null;
        }

        public function save($data, $id = null){
            if( !($data['category']) ){
                return false;
            }

            $id = (int)$id;

            $category = $this->db->escape($data['category']);
          //  var_dump($category);
            if(!$id){   //add new record
                $sql = "
                insert into book_categories
                set category = '{$category}'
                
                ";
                //var_dump($message);
            }else{  //update existing record
                $sql = "
                update  book_categories
                set category = '{$category}'
                where category_id = '{$id}'
                ";
            }

            return $this->db->query($sql);

        }

        public function delete($id){
            $id = (int)$id;
            $sql = "
                delete from book_categories
                where category_id = '{$id}'
            ";

            return $this->db->query($sql);
        }

    }