<?php
namespace Controllers\Bitacoras;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Bitacoras\Bitacoras as DAOBitacora;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Bitacora extends PublicController {
  private $bitacoracod;
  private $bitacorafch;
  private $bitprograma;
  private $bitdescripcion;
  private $bitobservacion;
  private $bitTipo;
  private $bitusuario;

    public function run(): void
    {
        Site::addLink('bitacora_style');
        $viewData['bitacoracod'] = 'bitacoracod';
		$viewData['bitacorafch'] = 'bitacorafch';
		$viewData['bitprograma'] = 'bitprograma';
		$viewData['bitdescripcion'] = 'bitdescripcion';
		$viewData['bitobservacion'] = 'bitobservacion';
		$viewData['bitTipo'] = 'bitTipo';
		$viewData['bitusuario'] = 'bitusuario';
		$viewData['bitacora']= DAOBitacora::getBitacora();
        Renderer::render("bitacoras/bitacoralist", $viewData);
    }
}
