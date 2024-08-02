<?php
namespace Controllers\Funcioness;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Funcioness\Funcioness as DAOFunciones;
use Utilities\Site;
use Utilities\Validators;
class Funcioness extends PublicController {
  private $fncod;
  private $fndsc;
  private $fnest;
  private $fntyp;
  private $funciones = [
	"fncod" => "", 
		"fndsc" => "", 
		"fnest" => "", 
		"fntyp" => ""
];
	 private $listUrl = "index.php?page=Funcioness_Funciones";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_funciones = '';
private $modes = [
            "INS" => "Creando nueva funciones",
            "UPD" => "Editando funciones",
            "DEL" => "Eliminando funciones",
            "DSP" => "Detalle funciones"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->funciones['fncod'] = $_POST['fncod'];
						     $this->funciones['fndsc'] = $_POST['fndsc'];
						     $this->funciones['fnest'] = $_POST['fnest'];
						     $this->funciones['fntyp'] = $_POST['fntyp'];
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
                        if (isset($_GET["fncod"])){
                            $this->funciones = DAOFunciones::obtenerPorId(strval($_GET["fncod"]));
                            
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
        if(isset($_POST["xss_token_funciones"])) {
            $this->xss_token_funciones = $_POST["xss_token_funciones"];
            if( $_SESSION["xss_token_funciones"] !== $this->xss_token_funciones) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["fncod"])){
                 $this->error["fncod_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["fndsc"])){
                 $this->error["fndsc_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["fnest"])){
                 $this->error["fnest_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["fntyp"])){
                 $this->error["fntyp_error"] = "Campo es requerido";
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
               if ( DAOFunciones::insertFunciones(
                       $this -> funciones["fncod"],
$this -> funciones["fndsc"],
$this -> funciones["fnest"],
$this -> funciones["fntyp"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOFunciones::updateFunciones(
                    $this -> funciones["fncod"],
$this -> funciones["fndsc"],
$this -> funciones["fnest"],
$this -> funciones["fntyp"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOFunciones::deleteFunciones(
                    $this->funciones["fncod"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Funciones eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["funciones"] = $this->funciones;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["funciones"][$this->funciones["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["funciones"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_funciones = md5("funcioness_funciones".date('Ymdhisu'));
            $_SESSION["xss_token_funciones"] = $this->xss_token_funciones;
            $this->viewData["xss_token_funciones"] = $this->xss_token_funciones; 
        }
        

	private function render(){
            Renderer::render("funcioness/funcionesform", $this->viewData);
        }
}
