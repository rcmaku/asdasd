<?php

namespace Controllers\Cart;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Productss\Productss as DaoProducts;
use Dao\Funcioness\Funcioness as DAOFunciones;
use Dao\Purchases\Purchases as DAOCompras;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Inicio extends PrivateController
{

    public function run(): void
    {
        $viewData = [];
        $productData = array();
        $totalCrrprc = 0;
        $totalcrrctd = 0;
        $early = "";

        $fecha_mas_reciente_timestamp = 0;
        $viewData['isClient'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['productos'] = DaoProducts::getProducts();

        $viewData['compras'] = \Dao\Purchases\Purchases::getPurchaseByUser($_SESSION["usercod"]);
        $count = \Dao\Purchases\Purchases::getPurchaseByUserCount($_SESSION["usercod"]);
        $viewData['isEmptyPurchases'] = empty($count);

        error_reporting(E_ERROR | E_PARSE);
        $this->viewData['token'] = md5("sssdbu3heu3hi4h3uio43" . '' . date('Ymdhisu') . '');
        self::cart();
        $_SESSION["token_xs"] = $this->viewData['token'];

        $xls =  \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']);
        $_SESSION['xls'] = $xls;
        $xls = \DAO\Security\Security::getCodigoByEmail($_SESSION["login"]['userEmail']);

        if (isset($_SESSION["cart" . $xls])) {
            $cart = $_SESSION["cart" . $xls];
            $viewData['products'] = $cart;
            if (self::deleteCarrito($xls)) {
                $cart = "";
                if (isset($viewData['products'])) {
                    unset($viewData['products']);
                }
                $viewData['isEmpty'] = true;
            }
            if (isset($viewData['products'])) {
                foreach ($viewData['products'] as $product) {
                    if (isset($product['crrprc'])) {
                        $totalCrrprc += $product['crrprc'];
                    }
                    if (isset($product['crrctd'])) {
                        $totalcrrctd += $product['crrctd'];
                    }
                    if (isset($product['crrctd'])) {

                        $timestamp = strtotime($product['crrfching']);
                        if ($timestamp > $fecha_mas_reciente_timestamp) {
                            $fecha_mas_reciente_timestamp = $timestamp;
                        }
                    }
                }
                $viewData['total_products'] = $totalCrrprc;
                $viewData['quantity'] = $totalcrrctd;
                $viewData['crrfching'] =  date('Y-m-d', $fecha_mas_reciente_timestamp);
                $nuevaFecha = strtotime($viewData['crrfching'] . ' +30 days');
                $viewData['crrfchingRemove'] = date('Y-m-d', $nuevaFecha);
                $viewData['isEmpty'] = false;
            }
        } else {
            $viewData['isEmpty'] = true;
        }

        $phrase = "C";
        for ($x = 0; $x < 100; $x++) {
            $random_number = mt_rand(0, 25);
            $phrase .= chr($random_number + ord('A'));
        }

        $viewData['token'] = md5($phrase . '' . date('Ymdhisu') . '');
        $_SESSION['tokenShopping'] = $viewData['token'];


        Renderer::render("checkout/checkout", $viewData);
    }

    public static function compras()
    {
        $viewData = array();
        $productData = array();
        $totalCrrprc = 0;
        $totalcrrctd = 0;
        $early = "";
        self::carrito();
        $fecha_mas_reciente_timestamp = 0;

        $xls = \DAO\Security\Security::getCodigoByEmail($_SESSION["login"]['userEmail']);

        if (isset($_SESSION["cart" . $xls])) {
            $cart = $_SESSION["cart" . $xls];
            $viewData['products'] = $cart;
            if (self::deleteCarrito($xls)) {
                $cart = "";
                if (isset($viewData['products'])) {
                    unset($viewData['products']);
                }
                $viewData['isEmpty'] = true;
            }
            if (isset($viewData['products'])) {
                $total_products = 0;
                foreach ($viewData['products'] as $product) {
                    if (isset($product['crrprc'])) {
                        $totalCrrprc += $product['crrprc'];
                    }
                    if (isset($product['crrctd'])) {
                        $totalcrrctd += $product['crrctd'];
                    }

                    if (isset($product['crrprc']) && isset($product['crrctd'])) {
                        $total_products += $product['crrprc'] * $product['crrctd'];
                    }


                    if (isset($product['crrctd'])) {

                        $timestamp = strtotime($product['crrfching']);
                        if ($timestamp > $fecha_mas_reciente_timestamp) {
                            $fecha_mas_reciente_timestamp = $timestamp;
                        }
                    }
                }
                $viewData['total_products'] = $total_products;
                $viewData['quantity'] = $totalcrrctd;
                $viewData['crrfching'] =  date('Y-m-d', $fecha_mas_reciente_timestamp);
                $nuevaFecha = strtotime($viewData['crrfching'] . ' +30 days');
                $viewData['crrfchingRemove'] = date('Y-m-d', $nuevaFecha);
                $viewData['isEmpty'] = false;
            }
        } else {
            $viewData['isEmpty'] = true;
        }

        $phrase = "C";
        for ($x = 0; $x < 100; $x++) {
            $random_number = mt_rand(0, 25);
            $phrase .= chr($random_number + ord('A'));
        }

        $viewData['token'] = md5($phrase . '' . date('Ymdhisu') . '');
        $_SESSION['tokenShopping'] = $viewData['token'];
    }
    private static function deleteCarrito($xls)
    {
        $data = 'cart' . strval($xls);
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if (isset($_POST['deleteButton'])) {
                if (isset($_SESSION[$data])) {
                    unset($_SESSION[$data]);
                    echo '<script>alert("Carrito was removed");</script>';
                    return true;
                } else {
                    echo '<script>alert("Couldnt find carrito");</script>';
                    return false;
                }
            }
        }
    }

    private static function Carrito()
    {
        $xls = \DAO\Security\Security::getCodigoByEmail($_SESSION["login"]['userEmail']);
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if ($_SESSION["tokenShopping"] == $_POST["xsx"]) {
                if (isset($_POST['deleteButton'])) {
                    if (!isset($_SESSION['cart' . $xls])) {
                        unset($_SESSION['cart' . $xls]);
                        echo '<script>alert("Carrito was removed");</script>';
                    }
                }
                if (isset($_POST['deleteItem'])) {
                    $crrfching = $_POST['deleteItem'];
                    foreach ($_SESSION['cart' . $xls] as $key => $product) {
                        if ($product['crrfching'] === $crrfching) {
                            unset($_SESSION['cart' . $xls][$key]);
                            break;
                        }
                    }
                }
            }
        }
    }

    static private function cart()
    {

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if (isset($_POST['addToCart'])) {
                $xls =  \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']);
                $_SESSION['user'] = $xls;

                if (!isset($_SESSION['cart' . $xls])) {
                    $product = [
                        "usercod" => $xls,
                        "productid" => $_POST['productId'],
                        "productName" => $_POST['productName'],
                        "crrctd" => $_POST['productQuantity'],
                        "crrprc" => $_POST['productPrice'],
                        "crrfching" => date("Y-m-d H:i:s")
                    ];

                    $_SESSION['cart' . $xls][0] = $product;
                    echo '<script>alert("' . $_POST['productName'] . ' added to checkout carrito");</script>';
                } else {
                    $found = false;
                    $carrito = intval(count($_SESSION['cart' . $xls]));
                    foreach ($_SESSION['cart' . $xls] as $key => $product) {
                        if ($product['productid'] === $_POST['productId']) {
                            $_SESSION['cart' . $xls][$key]['crrctd'] = strval(intval($product['crrctd']) + 1);
                            $found = true;
                            break;
                        } else {
                            $found = false;
                        }
                    }
                    if ($found === false && $carrito > 0) {
                        $product = [
                            "usercod" => $xls,
                            "productid" => $_POST['productId'],
                            "productName" => $_POST['productName'],
                            "crrctd" => $_POST['productQuantity'],
                            "crrprc" => $_POST['productPrice'],
                            "crrfching" => date("Y-m-d H:i:s")
                        ];

                        $_SESSION['cart' . $xls][$carrito] = $product;
                        echo '<script>alert("' . $_POST['productName'] . ' added checkout carrito");</script>';
                    }
                }
            }
        }
    }
}
