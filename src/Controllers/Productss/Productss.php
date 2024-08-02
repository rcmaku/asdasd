<?php
namespace Controllers\Productss;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Productss\Productss as DAOProducts;
use Utilities\Site;
use Utilities\Validators;
class Productss extends PublicController {
  private $productId;
  private $productName;
  private $productDescription;
  private $productPrice;
  private $productImgUrl;
  private $productStock;
  private $productStatus;
  private $products = [
	"productid" => "", 
		"productname" => "", 
		"productdescription" => "", 
		"productprice" => "", 
		"productimgurl" => "", 
		"productstock" => "", 
		"productstatus" => ""
];
	 private $listUrl = "index.php?page=Productss_Products";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_products = '';
private $modes = [
            "INS" => "Creando nueva products",
            "UPD" => "Editando products",
            "DEL" => "Eliminando products",
            "DSP" => "Detalle products"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->products['productid'] = $_POST['productid'];
						     $this->products['productname'] = $_POST['productname'];
						     $this->products['productdescription'] = $_POST['productdescription'];
						     $this->products['productprice'] = $_POST['productprice'];
						     $this->products['productimgurl'] = $_POST['productimgurl'];
						     $this->products['productstock'] = $_POST['productstock'];
						     $this->products['productstatus'] = $_POST['productstatus'];
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
                        if (isset($_GET["productId"])){
                            $this->products = DAOProducts::obtenerPorId(strval($_GET["productId"]));
                            
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
        if(isset($_POST["xss_token_products"])) {
            $this->xss_token_products = $_POST["xss_token_products"];
            if( $_SESSION["xss_token_products"] !== $this->xss_token_products) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["productid"])){
                 $this->error["productid_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["productname"])){
                 $this->error["productname_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["productdescription"])){
                 $this->error["productdescription_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["productprice"])){
                 $this->error["productprice_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["productimgurl"])){
                 $this->error["productimgurl_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["productstock"])){
                 $this->error["productstock_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["productstatus"])){
                 $this->error["productstatus_error"] = "Campo es requerido";
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
               if ( DAOProducts::insertProducts(
                       $this -> products["productid"],
$this -> products["productname"],
$this -> products["productdescription"],
$this -> products["productprice"],
$this -> products["productimgurl"],
$this -> products["productstock"],
$this -> products["productstatus"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Products creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOProducts::updateProducts(
                    $this -> products["productid"],
$this -> products["productname"],
$this -> products["productdescription"],
$this -> products["productprice"],
$this -> products["productimgurl"],
$this -> products["productstock"],
$this -> products["productstatus"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Products actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOProducts::deleteProducts(
                    $this->products["productId"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Products eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["products"] = $this->products;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["products"][$this->products["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["products"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_products = md5("productss_products".date('Ymdhisu'));
            $_SESSION["xss_token_products"] = $this->xss_token_products;
            $this->viewData["xss_token_products"] = $this->xss_token_products; 
        }
        

	private function render(){
            Renderer::render("productss/productsform", $this->viewData);
        }
}
