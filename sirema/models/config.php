<?php

class DB{

    public function conectar(){
        $pass = '';
      $link = new PDO("mysql:host=localhost;dbname=sirema;charset=utf8;port=3306","root", $pass );

        return $link;
    }
}