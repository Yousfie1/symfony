<?php

namespace App\Controller;

use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Doctrine\ManagerRegistry;
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
        $cats=['vis','vegetarisch','vlees','fiets','dag'];

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

    /**
     * @Route("/categories/{id}", name="pizza_categories")
     */
    public function categories($id,EntityManagerInterface $em)
    {

        $category=$em->getRepository(Category::class)->find($id);
        $pizzas=$category->getPizzas();
        //dd($category);

        return $this->render('pizza/pizzas.html.twig',['pizzas'=>$pizzas]);
    }
    /**
     * @Route("/order/{id}", name="app_order");
     */

    public function order(Request $request, Pizza $pizza, ManagerRegistry $managerRegistry)
    {
        $pizzaName = $pizza->getName();
        $en
    }

}