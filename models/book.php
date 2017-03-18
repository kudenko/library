<?php
class Book extends Model{

    public function getList($only_published = false){
        $sql = "select * from books where 1";
        //echo ('working ');
        if($only_published){
            $sql .= " and is_published = 1";
        }

        return $this->db->query($sql);
    }

    public function getCategories(){
        $sql = "select * from book_categories";
        return $this->db->query($sql);
    }

    public function getByAlias($alias){
        $alias = $this->db->escape($alias);
        $sql = "select * from  books where alias = '{$alias}' limit 1";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result[0] : null;
    }

    public function getById($id){
        $id = (int)$id;
        $sql = "select * from  books where id = '{$id}' limit 1";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result[0] : null;
    }

    public function save($data, $id = null){
        if( !(($data['alias'])) || !(($data['title'])) || !(($data['description']))
            || !(($data['author']))){
            return false;
        }

        $id = (int)$id;


        $alias = $this->db->escape($data['alias']);
        $title = $this->db->escape($data['title']);
        $description = trim($this->db->escape($data['description']), " \t\n\r\0\x0B");
        $is_published = isset($data['is_published']) ? 1 : 0;
        $author = $this->db->escape($data['author']);
        $category = (int)($this->db->escape($data['category']));
       //$additional_category = $this->escape($data['$additional_category']);
        $add_date = date('Y-m-d H:i:s');
        if($_FILES['book']['name']) {
            $file_name = $this->db->escape($_FILES['book']['name']);
        }else $file_name = $data['book2'];
        if($_FILES['image']['name']) {
            $picture_path = $this->db->escape($_FILES['image']['name']);
        }else $picture_path = $data['image2'];


        //var_dump($data);
        if(!$id){   //add new record
            $sql = "
                insert into books
                set alias = '{$alias}',
                    title = '{$title}',
                    description = '{$description}', 
                    is_published = '{$is_published}',
                    category = '{$category}',
                    author = '{$author}',
                    add_date = '{$add_date}',
                    file_name = '{$file_name}',
                    picture_path =  '{$picture_path}'
                ";
            //var_dump($message);
        }else{  //update existing record
            $sql = "
                update  books
                set alias = '{$alias}',
                    title = '{$title}',
                    description = '{$description}', 
                    is_published = '{$is_published}',
                    category = '{$category}',
                    author = '{$author}',              
                    file_name = '{$file_name}',
                    picture_path =  '{$picture_path}'
                where id = '{$id}'
                ";
        }
        return $this->db->query($sql);
    }

    public function delete($id){
        $id = (int)$id;
        $sql = "
                delete from books
                where id = '{$id}'
            ";

        return $this->db->query($sql);
    }

}