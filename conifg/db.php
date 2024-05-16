<?php
class Db{
    static $host = "localhost";
    static $dbname = "elecciones_db";
    static $user = "root";
    static $password = "";

    public static function Conectar(){
        try{
            $conexion  = new PDO("mysql:host=".self::$host.";dbname=".self::$dbname,self::$user,self::$password);
            return $conexion;
        }catch(PDOException $e){
         return $e->getMessage();
        }
    }
}
?>