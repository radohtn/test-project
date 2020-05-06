<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass="App\Repository\StatusRepository")
 */
class Status
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups("serialiser")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups("serialiser")
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups("serialiser")
     */
    private $logoName;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Groups("serialiser")
     */
    private $description;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\File", mappedBy="status")
     * @Groups("serialiser")
     */
    private $files;

    public function __construct()
    {
        $this->files = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getLogoName()
    {
        return $this->logoName;
    }

    /**
     * @param mixed $logoName
     * @return Status
     */
    public function setLogoName($logoName)
    {
        $this->logoName = $logoName;
        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection|File[]
     */
    public function getFile(): Collection
    {
        return $this->files;
    }

    public function addFile(File $files): self
    {
        if (!$this->files->contains($files)) {
            $this->files[] = $files;
            $files->setStatus($this);
        }

        return $this;
    }

    public function removeFile(File $files): self
    {
        if ($this->files->contains($files)) {
            $this->files->removeElement($files);
            // set the owning side to null (unless already changed)
            if ($files->getStatus() === $this) {
                $files->setStatus(null);
            }
        }

        return $this;
    }
}
