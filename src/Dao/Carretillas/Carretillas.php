<?php
namespace Dao\Carretillas; 
use Dao\Table; 
class Carretillas extends Table{
      private $usercod;
  private $productId;
  private $crrctd;
  private $crrprc;
  private $crrfching;

 
  public static function getCarretilla(){
	 $sqlstr= "SELECT * FROM carretilla";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertCarretilla($usercod, $productId, $crrctd, $crrprc, $crrfching){
	
    $sqlstr = "INSERT INTO carretilla (usercod, productId, crrctd, crrprc, crrfching) VALUES (:usercod , :productId , :crrctd , :crrprc , :crrfching)";
    $params = ['usercod' => $usercod, 'productId' => $productId, 'crrctd' => $crrctd, 'crrprc' => $crrprc, 'crrfching' => $crrfching];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateCarretilla($usercod, $productId, $crrctd, $crrprc, $crrfching){
	
        $sqlstr = "UPDATE carretilla SET usercod = :usercod, productId = :productId, crrctd = :crrctd, crrprc = :crrprc, crrfching = :crrfching WHERE usercod = :usercod";
        $params = ['usercod' => $usercod, 'productId' => $productId, 'crrctd' => $crrctd, 'crrprc' => $crrprc, 'crrfching' => $crrfching];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM carretilla WHERE usercod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteCarretilla($id){
	$sqlstr= "DELETE  FROM carretilla WHERE usercod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}