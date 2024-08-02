<?php

namespace Dao\Security;
/*Una clase de tipos */

final class UsuarioTipo extends \Utilities\Enum
{
    const PUBLICO  = "PBL";
    const ADMINITRADAOR = "ADM";
    const AUDITOR = "AUD";
    const CLIENTE = "CLN";
}
