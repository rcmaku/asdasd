<?php
namespace Controllers\Funciones_roless;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Funciones_roless\Funciones_roless as DAOFunciones_roles;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Funciones_roles extends PublicController {
  private $rolescod;
  private $fncod;
  private $fnrolest;
  private $fnexp;

    public function run(): void
    {
        Site::addLink('funciones_roles_style');
        $viewData['rolescod'] = 'rolescod';
		$viewData['fncod'] = 'fncod';
		$viewData['fnrolest'] = 'fnrolest';
		$viewData['fnexp'] = 'fnexp';
		$viewData['funciones_roles']= DAOFunciones_roles::getFunciones_roles();
        Renderer::render("funciones_roless/funciones_roleslist", $viewData);
    }
}
