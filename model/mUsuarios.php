<?php
    class ModelUsuarios{
        private $conn;
        public function __construct(){
            require("SISTEMA_ELECCIONES/config/db.php");
            $this->conn = Db::Conectar(); 
        }

        public function insertar($documento){
            $stmt = $this->conn->prepare("INSERT INTO usuarios VALUES (null,:documento_usuario, :id_rol)");

            $id_rol = 2;
            
            $stmt->bindParam(":documento_usuario",$documento);
            $stmt->bindParam("id_rol",$id_rol);

            // $stmt->execute([
            //     ":documento_usuario" => $documento,
            //     ":id_rol" => 2
            // ]);
            return ($stmt->execute()) ? $this->conn->lastInsertId() : false;
            }

    }
