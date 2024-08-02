<?php

namespace Controllers;

class Error extends PublicController
{
    public function run(): void
    {
        $error_code = \Utilities\Context::getContextByKey("ERROR_CODE");
        $error_code = $error_code === "" ? 404 : $error_code;
        $error_msg = "Something stranges has happened";
        switch ($error_code) {
            case 404:
                $error_msg = "We could not find the requested";
                break;
            case $error_code >= 500:
                $error_msg = "Something unexpected happened";
                break;
        }
        http_response_code($error_code);
        \Views\Renderer::render(
            "error",
            [
                "CLIENT_ERROR_CODE" => $error_code,
                "CLIENT_ERROR_MSG" => $error_msg
            ]
        );
    }
}
