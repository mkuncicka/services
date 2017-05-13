<?php

namespace ServicesBundle\Manager;

use Symfony\Component\HttpFoundation\Response;

class TestManager
{
    private $pdfGenerator;

    private $entityManager;

    private $templating;

    public function __construct($pdfGenerator, $entityManager, $templating)
    {
        $this->pdfGenerator = $pdfGenerator;
        $this->entityManager = $entityManager;
        $this->templating = $templating;
    }

    public function exportToPdf($test)
    {
        $template = ':test:pdf_template.html.twig';

        return $this->generatePdf($template, $test);
    }

    /**
     * Metoda obsługująca generowanie pdfów
     *
     */
    private function generatePdf($template, $data, $fileName = null)
    {
        $tempFileName = '/tmp/'.($fileName ? $fileName : (md5($template.time().rand()).'.pdf'));

        $filePath = $this->pdfGenerator->generateFromHtml(
            $this->templating->render(
                $template, $data
            ), $tempFileName
        );
        $fileName = basename($filePath);

        $content = file_get_contents($filePath);

        $response = new Response();

        $response->headers->set('Content-Type', 'application/pdf');
        $response->headers->set('Content-Disposition', 'attachment;filename="'.$fileName);

        $response->setContent($content);

        return $response;
    }
}