<?php

    class User extends Model{
        public function getByLogin($login){
            $login = $this->db->escape($login);
            $sql = "
                select * from users where login = '{$login}' limit 1
            ";
            $result = $this->db->query($sql);
            if(isset($result[0])){
                return $result[0];
            }
            return false;
        }

        public function save($data){
            if( !(($data['password'])) || !(($data['login'])) || !(($data['email'])) ){

                return false;
            }

            $login = $this->db->escape($data['login']);
            $password = $this->db->escape($data['password']);
            $password = md5(Config::get('salt') . $password);
            $email = $this->db->escape($data['email']);
            $role = $this->db->escape($data['role']);
            $is_active = isset($data['is_active']) ? 1 : 0;

            $sql = "
                insert into users
                set login = '{$login}',
                    password = '{$password}',
                    email = '{$email}',
                    role = '{$role}',
                    is_active = '{$is_active}'
                ";

            return $this->db->query($sql);



        }
    }