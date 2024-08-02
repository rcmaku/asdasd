<?php
namespace Controllers\Purchasedetails;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchasedetails\Purchasedetails as DAOPurchasedetail;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Purchasedetail extends PublicController {
  private $id_purchase;
  private $id_item_reference;
  private $quantity;
  private $unitary_price;

    public function run(): void
    {
        Site::addLink('purchasedetail_style');
        $viewData['id_purchase'] = 'id_purchase';
		$viewData['id_item_reference'] = 'id_item_reference';
		$viewData['quantity'] = 'quantity';
		$viewData['unitary_price'] = 'unitary_price';
		$viewData['purchasedetail']= DAOPurchasedetail::getPurchasedetail();
        Renderer::render("purchasedetails/purchasedetaillist", $viewData);
    }
}
