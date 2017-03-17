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
        $description = $this->db->escape($data['description']);
        $is_published = isset($data['is_published']) ? 1 : 0;
        $author = $this->db->escape($data['author']);
        $category = $this->db->escape($data['category']);
        $additional_category = $this->escape($data['$additional_category']);
        $add_date = date(YYYY-MM-DD);
        $file_name = $this->db->escape($_FILES['book']['name']);
        $picture_path = $this->db->escape($_FILES['image']['name']);


        //var_dump($data);
        if(!$id){   //add new record
            $sql = "
                insert into books
                set alias = '{$alias}',
                    title = '{$title}',
                    description = '{$description}', 
                    is_published = '{$is_published}'        
                ";
            //var_dump($message);
        }else{  //update existing record
            $sql = "
                update  books
                set alias = '{$alias}',
                    title = '{$title}',
                    description = '{$description}',
                    is_published = '{$is_published}'
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