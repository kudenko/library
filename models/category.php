<?php

    class Category extends Model{

        public function getList(){
            $sql = "select * from book_categories ORDER BY `weight` DESC ";
            //echo ('working ');
            return $this->db->query($sql);
        }

        public function getByAlias($alias){
            $sql = "SELECT * FROM book_categories  inner join books on book_categories.category_id = books.category where category_id = $alias AND is_published = 1 ORDER BY books.download DESC" ;
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
            $weight = (int) $data['weight'];



            $category = $this->db->escape($data['category']);
          //  var_dump($category);




            if($id){
                $sql = "update ";
            }else{
                $sql = "insert into ";
            }

            $sql .="
                book_categories
                set category = '{$category}',
                weight = '{$weight}'";
            if($id){
                $sql .= "where category_id = '{$id}'";
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

        public function getLikes($id){
            $id = (int)$id;
            $sql = "SELECT *,  l.SUMMLIKE FROM books  b left join(select book_id, sum(is_like) SUMMLIKE from likes
            group by book_id) l on b.id = l.book_id where is_published = 1 AND category = '{$id}' ORDER BY l.SUMMLIKE DESC";


            return $this->db->query($sql);
        }

    }