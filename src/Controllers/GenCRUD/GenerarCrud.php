<?php

namespace Controllers\GenCRUD;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\GenCRUD\GenerateCRUD;



class GenerarCrud extends PublicController
{

  public function run(): void
  {
    $dataview = [];
    Renderer::render("GenCRUD/crudeando", $dataview);
    self::handlePost();
  }
  public function handlePost()
  {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      if (isset($_POST["generate"])) {
        $tableName = $_POST["nombre_tabla"];
        self::handleExistence($tableName);
      }
    }
  }
  public function handleExistence($tableName)
  {
    if (GenerateCrud::tableExists($tableName)) {
      self::generate($tableName);
      GenerateCRUD::ShowRoutes($tableName);
    }
  }
  public function generate($tableName)
  {

    GenerateCRUD::GenerateFormController($tableName);
    GenerateCRUD::GenerateListController($tableName);
    GenerateCRUD::GenerateFormTemplate($tableName);
    GenerateCRUD::GenerateListTemplate($tableName);
    GenerateCRUD::GenerateDAO($tableName);
  }
}
