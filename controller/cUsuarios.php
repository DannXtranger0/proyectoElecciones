<?php
class ControllerUsuarios{
    private $modelUsuarios;
    public function __construct(){
        require("model/mUsuarios");
        $this->modelUsuarios = new $ModelUsuarios();
    }

    public function insertar($nombre){
        $this->modelUsuarios->insertar($nombre);
    }


}