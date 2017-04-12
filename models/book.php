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
            echo 'dsjdhkasdaskhdjasj';
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
        $is_deleted = isset($data['is_deleted']) ? 1 : 0;

       if($_FILES['book']['name']) {
            $file_name = $data['book_path'];
        }else $file_name = $data['book_path2'];
        if($_FILES['image']['name']) {
            $picture_path = $data['image_path'];
        }else $picture_path = $data['image_path2'];


        //var_dump($data);
         //add new record

                if($id){
                $sql = "update ";
                    }else{
                    $sql = "insert into ";
                }

                $sql .="
                books
                set alias = '{$alias}',
                    title = '{$title}',
                    description = '{$description}', 
                    is_published = '{$is_published}',
                    category = '{$category}',
                    author = '{$author}',
                    add_date = '{$add_date}',
                    file_name = '{$file_name}',
                    picture_path =  '{$picture_path}',
                    is_deleted = '{$is_deleted}'
                    
                ";
                if($id){
                    $sql .= "where id = '{$id}'";
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