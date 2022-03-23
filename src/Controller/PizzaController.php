<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
class PizzaController extends  AbstractController
{
    /**
     * @Route("/pizza")
     */
    public function homepage()
    {
        $cats=['vis','kaas','vlees','drank'];

        return $this->render('pizza/pizza.html.twig',['cats'=>$cats]);
    }
}