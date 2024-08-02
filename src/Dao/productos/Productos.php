<?php

namespace Dao\Productos;

class Productos extends \Dao\Table
{
    public static function getProductosOferta(): array
    {


        $sqlstr = "SELECT productName as nombre, productPrice as precio, productImgUrl as imagen, productStock as stock FROM products;";
        $products = self::obtenerRegistros($sqlstr, array());
        return $products;
    }

    /* CRUD
        Create -- Insert
        Read -- Select
        Update -- Update
        Delete -- Delete
    */

    public static function createProducto(
        $name,
        $description,
        $price,
        $imgUrl,
        $stock,
        $status,
    ) {
        $InsSql = "INSERT INTO products (productName, productDescription, productPrice, productImgUrl, productStock, productStatus)
         value (:name, :description, :price,:imgUrl, :stock, :status);";
        $insParams = [
            'productName' => $name,
            'productDescription' => $description,
            'productPrice' => $price,
            'productImgUrl' => $imgUrl,
            'productStock' => $stock,
            'productStatus' => $status,

        ];

        return self::executeNonQuery($InsSql, $insParams);
    }

    public static function updateProducto(
        $id,
        $name,
        $description,
        $price,
        $imgUrl,
        $stock,
        $status
    ) {
        $UpdSql = "UPDATE products set productName = :name, productDescription = :description, productPrice = :price, productImgUrl = :imgUrl, productStock = :stock, productStatus = :status where productId = :id;";
        $updParams = [
            'productId' => $id,
            'productName' => $name,
            'productDescription]' => $description,
            'productPrice' => $price,
            'productImgUrl' => $imgUrl,
            'productStock' => $stock,
            'projectStatus' => $status
        ];

        return self::executeNonQuery($UpdSql, $updParams);
    }

    public static function deleteProducto($id)
    {
        $DelSql = "DELETE from products where productId = :id;";
        $delParams = ['productId' => $id];
        return self::executeNonQuery($DelSql, $delParams);
    }


    public static function readAllProductos($filter = '')
    {
        $sqlstr = "SELECT a.* from products where name like :filter;";
        $params = array('filter' => '%' . $filter . '%');
        return self::obtenerRegistros($sqlstr, $params);
    }


    public static function readProducto($id)
    {
        $sqlstr = "SELECT * from products where productId = :id;";
        $params = array('productId' => $id);
        return self::obtenerUnRegistro($sqlstr, $params);
    }
}
