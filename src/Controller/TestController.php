<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TestController
{
    #[Route(path: "/test", name: "test")]
    public function test(): Response
    {
        return new Response('test');
    }
}
