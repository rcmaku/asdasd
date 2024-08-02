<?php

namespace Dao\Productss;

use Dao\Table;

class Productss extends Table
{

        private $productId;
        private $productName;
        private $productDescription;
        private $productPrice;
        private $productImgUrl;
        private $productStock;
        private $productStatus;


        public static function getProducts()
        {
                $sqlstr = "SELECT * FROM products";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function insertProducts($productId, $productName, $productDescription, $productPrice, $productImgUrl, $productStock, $productStatus)
        {

                $sqlstr = "INSERT INTO products (productId, productName, productDescription, productPrice, productImgUrl, productStock, productStatus) VALUES (:productId , :productName , :productDescription , :productPrice , :productImgUrl , :productStock , :productStatus)";
                $params = ['productId' => $productId, 'productName' => $productName, 'productDescription' => $productDescription, 'productPrice' => $productPrice, 'productImgUrl' => $productImgUrl, 'productStock' => $productStock, 'productStatus' => $productStatus];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updateProducts($productId, $productName, $productDescription, $productPrice, $productImgUrl, $productStock, $productStatus)
        {

                $sqlstr = "UPDATE products SET productId = :productId, productName = :productName, productDescription = :productDescription, productPrice = :productPrice, productImgUrl = :productImgUrl, productStock = :productStock, productStatus = :productStatus WHERE productId = :productId";
                $params = ['productId' => $productId, 'productName' => $productName, 'productDescription' => $productDescription, 'productPrice' => $productPrice, 'productImgUrl' => $productImgUrl, 'productStock' => $productStock, 'productStatus' => $productStatus];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM products WHERE productId = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deleteProducts($id)
        {
                $sqlstr = "DELETE  FROM products WHERE productId = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}
