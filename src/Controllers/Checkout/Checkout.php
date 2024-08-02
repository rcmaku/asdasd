<?php

namespace Controllers\Checkout;
/*Este controlador PHP maneja el proceso de checkout, incluyendo la creación y gestión de órdenes de compra, la preparación de datos para su almacenamiento en la base de datos, y la interacción con PayPal. Aquí hay un resumen de las funciones principales:

1. **run():** Este método se ejecuta al cargar la página de checkout. Verifica si se ha enviado un formulario (POST). Si no, simplemente renderiza la vista de checkout. Si se ha enviado un formulario, crea una nueva orden de PayPal utilizando la clase `PayPalOrder` del espacio de nombres `Utilities\Paypal`, obtiene el ID de la orden generada por PayPal y redirige al usuario a la página de PayPal para completar el pago.

2. **getSession():** Este método recupera los detalles de los productos añadidos al carrito de compras de la sesión y los añade a la orden de PayPal utilizando el método `addItem()` de la clase `PayPalOrder`.

3. **addToDB():** Este método calcula el total de la compra y prepara los detalles de la compra para ser almacenados en la base de datos. Además, actualiza la sesión con los detalles de la compra.

4. **addPurchase():** Este método agrega la compra a la base de datos después de que se haya completado el pago a través de PayPal. Utiliza los detalles de la compra preparados anteriormente y los inserta en la tabla de compras (`purchase`). Además, maneja la lógica para actualizar las suscripciones de los usuarios si los productos comprados son suscripciones.

5. **getData():** Este método obtiene los datos del carrito de compras del usuario actual.

6. **getDetail():** Este método obtiene los detalles de la compra para mostrarlos en la vista de confirmación de compra.

7. **addToDetail():** Este método agrega detalles adicionales a los detalles de la compra.
. */

use Dao\Carretillas\Carretillas as Carrito;
use Controllers\PublicController;
use Dao\Purchases\Purchases as purchase;
use Dao\Purchasedetails\Purchasedetails as detail;


class Checkout extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test" . (time() - 10000000),
                "http://localhost:8080/BetaGaming/index.php?page=checkout_error",
                "http://localhost:8080/BetaGaming/index.php?page=checkout_accept"
            );
            self::getSession($PayPalOrder);
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');


        \Views\Renderer::render("paypal/checkout", $viewData);
    }

    public static function getSession($PayPalOrder)
    {
        $xls = $_SESSION['xls'];
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                $PayPalOrder->addItem(strval($productName), strval($productName . " purchased on  " . Date('HH-mm-ss')), strval($productId), floatval($productPrice), round(floatval($productPrice * 0.15), 2), intval($productQuantity), "DIGITAL_GOODS");
            }
        }
    }
    public static function addToDB()
    {
        $xls = $_SESSION['xls'];
        $total = 0.00;
        $detail = "Purchased: ";
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                $total += $productPrice * $productQuantity;
                $detail .= "Se compro {{$productName}} || {{$productQuantity}} || {{$productPrice}} || ";
                self::addToDetail($detail);
            }
        }
        $_SESSION['detailofPurchase'] = $detail;
        return $total;
    }
    public static function getDetail()
    {
        $data = $_SESSION['detailofPurchase'];
        unset($_SESSION['detailofPurchase']);
        return $data;
    }
    public static function addToDetail($detail)
    {
        return $detail .= $detail . "\n";
    }


    public static function addPurchase($payment)
    {
        $xls = $_SESSION['xls'];
        $idFor = \Utilities\Functions::generateId("purchase");
        purchase::insertPurchase($idFor, date("Y-m-d"), self::addToDb(), "Comprado en Kevstrx", \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']), $payment,);
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                detail::insertPurchasedetail($idFor, $productId, $productQuantity, $productPrice);
            }
        }
    }

    public static function generateAddItem($data)
    {
        if (!\Utilities\Functions::isAnEmptyArray(($data))) {
            $data = implode("", $data);
            echo $data;
        } else {
            echo '<script>alert("NO data"); </script>';
        }
    }
}
