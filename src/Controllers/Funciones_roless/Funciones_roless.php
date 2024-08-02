<?php
namespace Controllers\Funciones_roless;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Funciones_roless\Funciones_roless as DAOFunciones_roles;
use Utilities\Site;
use Utilities\Validators;
class Funciones_roless extends PublicController {
  private $rolescod;
  private $fncod;
  private $fnrolest;
  private $fnexp;
  private $funciones_roles = [
	"rolescod" => "", 
		"fncod" => "", 
		"fnrolest" => "", 
		"fnexp" => ""
];
	 private $listUrl = "index.php?page=Funciones_roless_Funciones_roles";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_funciones_roles = '';
private $modes = [
            "INS" => "Creando nueva funciones_roles",
            "UPD" => "Editando funciones_roles",
            "DEL" => "Eliminando funciones_roles",
            "DSP" => "Detalle funciones_roles"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->funciones_roles['rolescod'] = $_POST['rolescod'];
						     $this->funciones_roles['fncod'] = $_POST['fncod'];
						     $this->funciones_roles['fnrolest'] = $_POST['fnrolest'];
						     $this->funciones_roles['fnexp'] = $_POST['fnexp'];
			      $this->processAction();
           }
        }
        $this->prepareViewData();
        $this->render();
        }
		private function init()
        {
            if (isset($_GET["mode"])) {
                if (isset($this->modes[$_GET["mode"]])) {
                    $this->mode = $_GET["mode"];
                    if($this->mode !== "INS") {
                        if (isset($_GET["rolescod"])){
                            $this->funciones_roles = DAOFunciones_roles::obtenerPorId(strval($_GET["rolescod"]));
                            
                        }
                    }
                } else {
                    $this->handleError("Oops, el programa no encuentra el modo solicitado, intente de nuevo");
                }
            } else {
                $this->handleError("Oops, el programa falló, intente de nuevo.");
            }
        }
		private function handleError($errMsg){
            Site::redirectToWithMsg($this->listUrl, $errMsg);
        }

		private function validateFormData(){
        if(isset($_POST["xss_token_funciones_roles"])) {
            $this->xss_token_funciones_roles = $_POST["xss_token_funciones_roles"];
            if( $_SESSION["xss_token_funciones_roles"] !== $this->xss_token_funciones_roles) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["rolescod"])){
                 $this->error["rolescod_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["fncod"])){
                 $this->error["fncod_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["fnrolest"])){
                 $this->error["fnrolest_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["fnexp"])){
                 $this->error["fnexp_error"] = "Campo es requerido";
                }
        //if (!in_array($_POST["status"], ["INA", "ACT"])) {
           // $this->error["status_error"] = "Estado es inválido.";
       // } else {
          //  $this->error["status_error"] = ""; 
        //}
        
        return count($this->error) == 0;
    }

	private function processAction(){
        switch ($this->mode) {
            case 'INS':
               if ( DAOFunciones_roles::insertFunciones_roles(
                       $this -> funciones_roles["rolescod"],
$this -> funciones_roles["fncod"],
$this -> funciones_roles["fnrolest"],
$this -> funciones_roles["fnexp"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones_roles creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOFunciones_roles::updateFunciones_roles(
                    $this -> funciones_roles["rolescod"],
$this -> funciones_roles["fncod"],
$this -> funciones_roles["fnrolest"],
$this -> funciones_roles["fnexp"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones_roles actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOFunciones_roles::deleteFunciones_roles(
                    $this->funciones_roles["rolescod"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Funciones_roles eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["funciones_roles"] = $this->funciones_roles;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["funciones_roles"][$this->funciones_roles["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["funciones_roles"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_funciones_roles = md5("funciones_roless_funciones_roles".date('Ymdhisu'));
            $_SESSION["xss_token_funciones_roles"] = $this->xss_token_funciones_roles;
            $this->viewData["xss_token_funciones_roles"] = $this->xss_token_funciones_roles; 
        }
        

	private function render(){
            Renderer::render("funciones_roless/funciones_rolesform", $this->viewData);
        }
}
