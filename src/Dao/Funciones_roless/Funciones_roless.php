<?php
namespace Dao\Funciones_roless; 
use Dao\Table; 
class Funciones_roless extends Table{
      private $rolescod;
  private $fncod;
  private $fnrolest;
  private $fnexp;

 
  public static function getFunciones_roles(){
	 $sqlstr= "SELECT * FROM funciones_roles";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertFunciones_roles($rolescod, $fncod, $fnrolest, $fnexp){
	
    $sqlstr = "INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES (:rolescod , :fncod , :fnrolest , :fnexp)";
    $params = ['rolescod' => $rolescod, 'fncod' => $fncod, 'fnrolest' => $fnrolest, 'fnexp' => $fnexp];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateFunciones_roles($rolescod, $fncod, $fnrolest, $fnexp){
	
        $sqlstr = "UPDATE funciones_roles SET rolescod = :rolescod, fncod = :fncod, fnrolest = :fnrolest, fnexp = :fnexp WHERE rolescod = :rolescod";
        $params = ['rolescod' => $rolescod, 'fncod' => $fncod, 'fnrolest' => $fnrolest, 'fnexp' => $fnexp];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM funciones_roles WHERE rolescod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteFunciones_roles($id){
	$sqlstr= "DELETE  FROM funciones_roles WHERE rolescod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}