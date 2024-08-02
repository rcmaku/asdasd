<?php
namespace Controllers\Purchasedetails;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchasedetails\Purchasedetails as DAOPurchasedetail;
use Utilities\Site;
use Utilities\Validators;
class Purchasedetails extends PublicController {
  private $id_purchase;
  private $id_item_reference;
  private $quantity;
  private $unitary_price;
  private $purchasedetail = [
	"id_purchase" => "", 
		"id_item_reference" => "", 
		"quantity" => "", 
		"unitary_price" => ""
];
	 private $listUrl = "index.php?page=Purchasedetails_Purchasedetail";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_purchasedetail = '';
private $modes = [
            "INS" => "Creando nueva purchasedetail",
            "UPD" => "Editando purchasedetail",
            "DEL" => "Eliminando purchasedetail",
            "DSP" => "Detalle purchasedetail"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->purchasedetail['id_purchase'] = $_POST['id_purchase'];
						     $this->purchasedetail['id_item_reference'] = $_POST['id_item_reference'];
						     $this->purchasedetail['quantity'] = $_POST['quantity'];
						     $this->purchasedetail['unitary_price'] = $_POST['unitary_price'];
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
                        if (isset($_GET[""])){
                            $this->purchasedetail = DAOPurchasedetail::obtenerPorId(strval($_GET[""]));
                            
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
        if(isset($_POST["xss_token_purchasedetail"])) {
            $this->xss_token_purchasedetail = $_POST["xss_token_purchasedetail"];
            if( $_SESSION["xss_token_purchasedetail"] !== $this->xss_token_purchasedetail) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["id_purchase"])){
                 $this->error["id_purchase_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["id_item_reference"])){
                 $this->error["id_item_reference_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["quantity"])){
                 $this->error["quantity_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["unitary_price"])){
                 $this->error["unitary_price_error"] = "Campo es requerido";
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
               if ( DAOPurchasedetail::insertPurchasedetail(
                       $this -> purchasedetail["id_purchase"],
$this -> purchasedetail["id_item_reference"],
$this -> purchasedetail["quantity"],
$this -> purchasedetail["unitary_price"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Purchasedetail creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOPurchasedetail::updatePurchasedetail(
                    $this -> purchasedetail["id_purchase"],
$this -> purchasedetail["id_item_reference"],
$this -> purchasedetail["quantity"],
$this -> purchasedetail["unitary_price"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Purchasedetail actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOPurchasedetail::deletePurchasedetail(
                    $this->purchasedetail[""]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Purchasedetail eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["purchasedetail"] = $this->purchasedetail;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["purchasedetail"][$this->purchasedetail["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["purchasedetail"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_purchasedetail = md5("purchasedetails_purchasedetail".date('Ymdhisu'));
            $_SESSION["xss_token_purchasedetail"] = $this->xss_token_purchasedetail;
            $this->viewData["xss_token_purchasedetail"] = $this->xss_token_purchasedetail; 
        }
        

	private function render(){
            Renderer::render("purchasedetails/purchasedetailform", $this->viewData);
        }
}
