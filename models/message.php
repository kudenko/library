<?php

    class Message extends Model{

        public function save($data, $id = null){
            if( !(($data['name'])) || !(($data['email'])) || !(($data['message'])) ){
                return false;
            }

            $id = (int)$id;
            $name = $this->db->escape($data['name']);
            $email = $this->db->escape($data['email']);
            $message = $this->db->escape($data['message']);
            var_dump($message);
            if(!$id){   //add new record
                $sql = "
                insert into messages
                set name = '{$name}',
                    email = '{$email}',
                    messages = '{$message}' 
                
                ";
                var_dump($message);
            }else{  //update existing record
                $sql = "
                update  messages
                set name = '{$name}',
                    email = '{$email}',
                    messages = '{'$message'}'     
                where id = '{$id}'
                ";
            }

            return $this->db->query($sql);

        }

        public function getList(){
            $sql = "select * from messages where 1";
           return $this->db->query($sql);
        }

    }