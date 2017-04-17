<?php


    class Comment extends Model{

        public function save($data, $id = null){

            if( !($data['comment']) ){
                return false;
            }
            $id = (int)$id;
            $book_id = (int) $data['book_id'];
            $date = $data['date'];
            if(isset($data['user_name'])){
                $user_name = $data['user_name'];
            }
            $comment = $this->db->escape($data['comment']);


            if($id){
                $sql = "update ";
            }else{
                $sql = "insert into ";
            }

            $sql .="
                comments
                set book_id = '{$book_id}',
                comment_add_day = '{$date}',
                user_name = '{$user_name}',
                comment = '{$comment}'"
                ;
            if($id){
                $sql .= "where comment_id = '{$id}'";
            }

            return $this->db->query($sql);

        }

        public function getList(){
            $sql = "select * from comments";
            return $this->db->query($sql);
        }

        public function delete($id){
            $id = (int)$id;
            $sql = "
                delete from comments
                where comment_id = '{$id}'
            ";

            return $this->db->query($sql);
        }
    }