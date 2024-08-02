<?php

namespace Controllers\Sec;

use Controllers\PublicController;
use \Utilities\Validators;
use \Utilities\Secrets\Secrets as secret;
use Exception;
/*
Este fragmento de código PHP define una clase llamada Register dentro del espacio de nombres Controllers\Sec. Aquí hay una descripción de lo que hace esta clase:


Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Sec, lo que sugiere que esta clase se encarga de la lógica relacionada con la seguridad, específicamente el registro de usuarios.

Clase Register: Esta clase extiende la clase PublicController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accesibles públicamente.

Propiedades privadas: La clase tiene varias propiedades privadas que representan el correo electrónico (txtEmail), la contraseña (txtPswd) y los errores relacionados con la validación del correo electrónico y la contraseña.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase, que incluye validar los datos recibidos del formulario de registro, verificar si hay errores, y si no hay errores, intentar registrar al usuario llamando al método newUsuario del DAO de seguridad.

Renderización de la vista: Utiliza el motor de plantillas Renderer para renderizar la vista "security/sigin" con los datos de la clase. */

class Register extends PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $errorEmail = "";
    private $errorPswd = "";
    private $hasErrors = false;
    public function run(): void
    {

        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail"];
            $this->txtPswd = $_POST["txtPswd"];
            //validaciones
            if (!(Validators::IsValidEmail($this->txtEmail))) {
                $this->errorEmail = "El correo no tiene el formato adecuado";
                $this->hasErrors = true;
            }
            if (!Validators::IsValidPassword($this->txtPswd)) {
                $this->errorPswd = "La contraseña debe tener al menos 8 caracteres una mayúscula, un número y un caracter especial.";
                $this->hasErrors = true;
            }

            if (!$this->hasErrors) {
                try {
                    if (\Dao\Security\Security::newUsuario($this->txtEmail, $this->txtPswd)) {
                        \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "¡Usuario Registrado Satisfactoriamente!");
                    }
                } catch (Error $ex) {
                    die($ex);
                }
            }
        }
        $viewData = get_object_vars($this);
        \Views\Renderer::render("security/sigin", $viewData);
    }
}
