<?php

namespace Utilities\Paypal;


use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;
use PayPalCheckoutSdk\Core\ProductionEnvironment;

class PayPalClient
{
    /**
     * Returns PayPal HTTP client instance with environment that has access
     * credentials context. Use this instance to invoke PayPal APIs, provided the
     * credentials have access.
     */
    public static function client()
    {
        return new PayPalHttpClient(self::environment());
    }

    /**
     * Set up and return PayPal PHP SDK environment with PayPal access credentials.
     * This sample uses SandboxEnvironment. In production, use LiveEnvironment.
     */
    public static function environment()
    {
        $clientId = \Utilities\Context::getContextByKey("AVrBR-g2gaf2ZiD4PRfbH9JFQwJZ8OQRh6nrnMYUcPSX806ZpXPSvPUwHMpcu4iqK6IBnf7UD6U0nTJb");
        $clientSecret = \Utilities\Context::getContextByKey("EMyJmok94rDVRhJIVCDbdX7Bm21w4XP-c8Lcl8LZYWiEkhScSdIkfCAFF_EdpoGIE8LYU2Yn657tFLAJ");
        $enviroment = \Utilities\Context::getContextByKey("sandbox");
        if ($enviroment == 'PRD') {
            return new ProductionEnvironment($clientId, $clientSecret);
        } else {
            return new SandboxEnvironment($clientId, $clientSecret);
        }
    }
}
