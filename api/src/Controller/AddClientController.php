<?php

namespace App\Controller;

use App\Entity\File;
use App\Entity\Project;
use App\Repository\ProjectRepository;
use App\Repository\StatusRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AddClientController extends AbstractController
{
    /**
     * @Route("/add/client", name="add_client")
     * @param EntityManagerInterface $em
     * @param ProjectRepository $projectRepository
     * @return Response
     */
    public function index(EntityManagerInterface $em, ProjectRepository $projectRepository)
    {

        //$project = $projectRepository->findOneBy(['id' => 5]);
        //$project->setLogoName(uniqid('logo_') . 'png');
        //$em->persist($project);

        /*for ($i = 1; $i < 6; $i++) {
            $status = $statusRepository->findOneBy(['id' => $i]);
            $project = new Project();
            $file = new File();
            $status->setLogoName(uniqid('logo_') . 'png');
            $project->setName(Uniqid('projet_'));
            $file->setFilename(Uniqid('no_du_fichier_') . '.png');
            $em->persist($status);
        }*/

        //$em->flush();

        return $this->render('add_client/index.html.twig', [
            'controller_name' => 'AddClientController',
        ]);
    }
}
