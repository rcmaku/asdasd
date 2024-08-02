<?php

namespace Utilities;

class Functions
{

    public static function generateId($sufix = "id")
    {
        return $secureUniqueID = bin2hex(random_bytes(64)) . date('Hi') . $sufix;
    }
    public static function isAnEmptyArray(array $count)
    {
        if (empty($count)) {
            // El array no está vacío 
            return true;
        } else {
            // El array está vacío
            return false;
        }
    }
}
