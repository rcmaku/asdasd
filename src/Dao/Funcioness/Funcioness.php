<?php
namespace Dao\Funcioness; 
use Dao\Table; 
class Funcioness extends Table{
      private $fncod;
  private $fndsc;
  private $fnest;
  private $fntyp;

 
  public static function getFunciones(){
	 $sqlstr= "SELECT * FROM funciones";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertFunciones($fncod, $fndsc, $fnest, $fntyp){
	
    $sqlstr = "INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES (:fncod , :fndsc , :fnest , :fntyp)";
    $params = ['fncod' => $fncod, 'fndsc' => $fndsc, 'fnest' => $fnest, 'fntyp' => $fntyp];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateFunciones($fncod, $fndsc, $fnest, $fntyp){
	
        $sqlstr = "UPDATE funciones SET fncod = :fncod, fndsc = :fndsc, fnest = :fnest, fntyp = :fntyp WHERE fncod = :fncod";
        $params = ['fncod' => $fncod, 'fndsc' => $fndsc, 'fnest' => $fnest, 'fntyp' => $fntyp];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM funciones WHERE fncod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteFunciones($id){
	$sqlstr= "DELETE  FROM funciones WHERE fncod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}