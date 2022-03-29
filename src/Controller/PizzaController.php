<?php

namespace App\Controller;

use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;
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
        $cats=['vis','vega','vlees','fiets','dag'];

        return $this->render('pizza/pizza.html.twig',['cats'=>$cats]);
    }

    /**
     * @Route("/category")
     */
    public function category(EntityManagerInterface $em)
    {
        $cats=$em->getRepository(Category::class)->findAll();
        //dd($cats);

        return $this->render('pizza/category.html.twig',['cats'=>$cats]);
    }

}