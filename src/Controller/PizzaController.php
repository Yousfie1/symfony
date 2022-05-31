<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;

use App\Entity\Pizza;
use App\Repository\OrderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Doctrine\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class PizzaController extends AbstractController
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
     * @Route("/")
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
    public function order(Request $request, Pizza $pizza, OrderRepository $orderRepository)
    {

        $order = new Order();
        $order->setSetStatus("in progress");
        $order->setPizza($pizza);
        $form = $this->createFormBuilder($order)
       #    ->add('size', EntityType::class , [
       #         'class'=> Size::class,
       #         'choice_label'=> function(Size $size){
       #         return $size->getName();
       #         }
       #     ])
            ->add('fname' , TextType::class , ['label'=>'Voornaam'])
            ->add('sname' , TextType::class , ['label'=>'Achternaam'])
            ->add('address' , TextType::class , ['label'=>'Adres'])
            ->add('zipcode' , TextType::class , ['label'=>'Postcode'])
            ->add('email' , TextType::class , ['label'=>'Email adres'])
            ->add('save' , SubmitType::class , ['label'=>'Bestellen'])
            ->getForm();



               $form->handleRequest($request);

               if($form->isSubmitted()){
                  $order = $form->getData();
                  $orderRepository->add($order);
                return $this->redirectToRoute('app_overview');

               }

              return $this->renderForm('form/form.html.twig', [
                            'form' => $form,
                        ]);
    }

    /**
     * @Route("/overview" , name="app_overview")
     */
    public function overview(OrderRepository $orderRepository){
        $orders = $orderRepository->findAll();
        return $this->render('pizza/overzicht.html.twig',
        [
            'orders' => $orders
        ]);
    }

}