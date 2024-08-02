<?php

/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */

namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */

/*
Este archivo PHP define una clase llamada Index dentro del espacio de nombres Controllers. Aquí está un resumen de su funcionalidad:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers, lo que sugiere que forma parte de un conjunto de controladores en la aplicación.

Clase Index: Esta clase se utiliza como el controlador principal para la página de inicio (index) de la aplicación.

Método run(): Este método es público y no devuelve ningún valor (void). Controla la lógica para preparar los datos de la vista de la página de inicio. Los datos de ejemplo proporcionados son una lista de productos con información como el artista, el producto, el precio y la URL de la imagen. Luego, utiliza el renderer de vistas para renderizar la vista "index" junto con los datos preparados. */
class Index extends PublicController
{
    /**
    
     *
     * @return void
     */
    private $isSubscribed = "";
    public function run(): void
    {
        $viewData = array();

        \Views\Renderer::render("index", $viewData);
    }
}
