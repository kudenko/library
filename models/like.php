<?php

    class Like extends Model
    {
        public function save($data)
        {
            if (!($data['book_id']) || !($data['user_name'])){

                return false;
            }

        $id = (int)$data['book_id'];
        $name = $this->db->escape($data['user_name']);

        $sql =  "INSERT INTO `likes` set 
                book_id = '{$id}',
                user_name = '{$name}',
                is_like = 1;
                ";

        return $this->db->query($sql);
        }

        public function getUniqueLike($book_id, $user_name){
            echo '111111111111111111';
            var_dump ($book_id);
            var_dump ($user_name);
            $name = $this->db->escape($user_name);

            echo '222222222222222222222222222';
            $id = (int)$book_id;
            var_dump ($book_id);

            echo '222222222222';
            $sql = "SELECT * FROM likes where user_name = '{$name}' AND  book_id = '{$id}';";
            var_dump($sql);
            return $this->db->query($sql);
        }

    }