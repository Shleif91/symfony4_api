<?php

use Behat\Behat\Context\Context;
use Doctrine\Common\DataFixtures\Purger\ORMPurger;
use Symfony\Component\HttpKernel\KernelInterface;

class FeatureContext implements Context
{
    /** @var KernelInterface */
    private $kernel;

    /** @var \Doctrine\ORM\EntityManagerInterface $em */
    private $em;

    public function __construct(KernelInterface $kernel)
    {
        $this->kernel = $kernel;
        $this->em = $this->kernel->getContainer()->get('doctrine.orm.entity_manager');
    }

    /** @BeforeScenario */
    public function clearData()
    {
        $purger = new ORMPurger($this->em);
        $purger->purge();
    }
}
