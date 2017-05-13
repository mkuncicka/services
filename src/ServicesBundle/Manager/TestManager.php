<?php

namespace ServicesBundle\Manager;

class TestManager
{
    private $pdfGenerator;

    private $entityManager;

    private $templating;

    private $kernel;

    public function __construct($pdfGenerator, $entityManager, $templating, $kernel)
    {
        $this->pdfGenerator = $pdfGenerator;
        $this->entityManager = $entityManager;
        $this->templating = $templating;
        $this->kernel = $kernel;
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
    private function generatePdf($template, $test, $fileName = null)
    {
        $tempFileName = realpath($this->kernel->getRootDir()) . '/../web/tmp/'.($fileName ? $fileName : (md5($template.time().rand()).'.pdf'));

        $filePath = $this->pdfGenerator->generateFromHtml(
            $this->templating->render(
                $template,
                array ('test' => $test)
            ), $tempFileName
        );

        return $tempFileName;
    }
}