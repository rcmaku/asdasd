<?php

namespace Controllers\Sec;

use Utilities\Secur\Crypt as sec;
use DAO\Logusers\Logusers as TheLog;

/*Se encarga de loggout el user y de cerrar la sesion */

/* https://th.bing.com/th/id/OIP.gpqmtUD7Xu0BZMXJGR5McAHaI0?rs=1&pid=ImgDetMain */

class Logout extends \Controllers\PublicController
{
    public function run(): void
    {
        \Utilities\Security::logout();
        \Utilities\Site::redirectTo("index.php");
    }
}
