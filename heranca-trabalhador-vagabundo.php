<?php
  # Problema :
  # Exemplo basico de herança onde existe um trabalhador, um vagabundo e ambos são pessoas.
  # Ambos tem nome.
  # Ambos tem status
  #
  # O trabalhador:
  #  - pode andar ate em casa e ficar com status descansando
  #  - pode andar ate trabalho e ficar ocm status trabalhando
  # O vagabundo:
  #  - pode andar ate em casa e ficar com status dormindo
  #  - pode andar ate trabalho e ficar ocm status vagabundeando
  #
  # Sempre que andarem, o sistema deve retornar:
  # Fulano está indo para $local

  class Pessoa
  {
    public $Nome   = "";
    public $Status = "";

    public function __construct($nome)
    {
      $this->Nome = $nome;
    }

    public function Andar($local, $parado = "descansando", $operando = "trabalhando")
    {
      if($local == "casa")
        $this->Status = $parado;
      else
        $this->Status = $operando;

      return "$this->Nome está indo para $local";
    }
  }

  class Trabalhador extends Pessoa
  {
    public function __construct($nome)
    {
      parent::__construct($nome);
      $this->Status = "Descansando";
    }
  }

  class Vagabundo extends Pessoa
  {
    public function __construct($nome)
    {
      parent::__construct($nome);
      $this->Status = "Dormindo";
    }

    public function Andar($local, $parado = "Dormindo", $operando = "Vagabundeando")
    {
      return parent::Andar($local, $parado, $operando);
    }
  }

  // class TrabalhadorTest extends PHPUnit_Framework_TestCase
  // {
  //   public function setUp()
  //   {
  //     $this->Trabalhador = new Trabalhador("Joao");
  //   }

  //   public function test_instancia_de()
  //   {
  //     $this->assertInstanceOf("Trabalhador", $this->Trabalhador);
  //   }

  //   public function test_deve_possuir_nome()
  //   {
  //     $this->assertEquals("Joao", $this->Trabalhador->Nome);
  //   }

  //   public function test_deve_possuir_status()
  //   {
  //     $this->assertEquals("Descansando", $this->Trabalhador->Status);
  //   }

  //   public function test_deve_andar_ate_trabalho()
  //   {
  //     $this->assertEquals("Joao está indo para empresa", $this->Trabalhador->Andar("empresa"));
  //     $this->assertEquals("Trabalhando", $this->Trabalhador->Status);
  //   }

  //   public function test_deve_andar_ate_casa()
  //   {
  //     $this->Trabalhador->Andar("empresa");

  //     $this->assertEquals("Joao está indo para casa", $this->Trabalhador->Andar("casa"));
  //     $this->assertEquals("Descansando", $this->Trabalhador->Status);
  //   }
  // }

  class VagabundoTest extends PHPUnit_Framework_TestCase
  {
    public function setUp()
    {
      $this->Vagabundo = new Vagabundo("Frango");
    }

    public function test_instancia_de()
    {
      $this->assertInstanceOf("Vagabundo", $this->Vagabundo);
    }

    public function test_deve_possuir_nome()
    {
      $this->assertEquals("Frango", $this->Vagabundo->Nome);
    }

    public function test_deve_possuir_status()
    {
      $this->assertEquals("Dormindo", $this->Vagabundo->Status);
    }

    public function test_deve_andar_ate_praia()
    {
      $this->assertEquals("Frango está indo para praia", $this->Vagabundo->Andar("praia"));
      $this->assertEquals("Vagabundeando", $this->Vagabundo->Status);
    }

    public function test_deve_andar_ate_casa()
    {
      $this->Vagabundo->Andar("empresa");

      $this->assertEquals("Frango está indo para casa", $this->Vagabundo->Andar("casa"));
      $this->assertEquals("Dormindo", $this->Vagabundo->Status);
    }
  }
?>