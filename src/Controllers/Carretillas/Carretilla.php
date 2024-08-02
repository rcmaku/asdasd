<?php
namespace Controllers\Carretillas;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Carretillas\Carretillas as DAOCarretilla;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Carretilla extends PublicController {
  private $usercod;
  private $productId;
  private $crrctd;
  private $crrprc;
  private $crrfching;

    public function run(): void
    {
        Site::addLink('carretilla_style');
        $viewData['usercod'] = 'usercod';
		$viewData['productId'] = 'productId';
		$viewData['crrctd'] = 'crrctd';
		$viewData['crrprc'] = 'crrprc';
		$viewData['crrfching'] = 'crrfching';
		$viewData['carretilla']= DAOCarretilla::getCarretilla();
        Renderer::render("carretillas/carretillalist", $viewData);
    }
}
