<?php
  # Problema :
  # Imagine uma brincadeira onde crianças falam um número em ordem (1,2,3…).
  # Se o número for múltiplo de 3 então a criança deve dizer Fizz ao invés do número,
  # Se o número for múltiplo de 5 então a criança deve dizer Buzz,
  # Se as duas condições forem verdadeiras então a criança precisa dizer FizzBuzz.
  class FizzBuzz
  {
    public function JogarComUm($numero)
    {
      $multiplo_de_3 = ($numero % 3 == 0);
      $multiplo_de_5 = ($numero % 5 == 0);

      if($multiplo_de_3 && $multiplo_de_5)
        return "FizzBuzz";

      if($multiplo_de_3)
        return "Fizz";

      if($multiplo_de_5)
        return "Buzz";

      return $numero;
    }

    public function Jogar($numeros)
    {
      $resultado = array();
      foreach ($numeros as $numero) {
        array_push($resultado, $this->JogarComUm($numero));
      }
      return $resultado;
    }
  }

  class FizzBuzzTest extends PHPUnit_Framework_TestCase
  {
    public function setUp()
    {
      $this->FizzBuzz = new FizzBuzz();
    }

    public function test_instancia_de()
    {
      $this->assertInstanceOf("FizzBuzz", $this->FizzBuzz);
    }

    public function test_pensa_1_fala_1()
    {
      $this->assertEquals("1", $this->FizzBuzz->JogarComUm(1));
    }

    public function test_pensa_2_fala_2()
    {
      $this->assertEquals("2", $this->FizzBuzz->JogarComUm(2));
    }

    public function test_pensa_3_fala_Fizz()
    {
      $this->assertEquals("Fizz", $this->FizzBuzz->JogarComUm(3));
    }

    public function test_pensa_6_fala_Fizz()
    {
      $this->assertEquals("Fizz", $this->FizzBuzz->JogarComUm(6));
    }

    public function test_pensa_5_fala_Buzz()
    {
      $this->assertEquals("Buzz", $this->FizzBuzz->JogarComUm(5));
    }

    public function test_pensa_10_fala_Buzz()
    {
      $this->assertEquals("Buzz", $this->FizzBuzz->JogarComUm(10));
    }

    public function test_pensa_15_fala_FizBuzz()
    {
      $this->assertEquals("FizzBuzz", $this->FizzBuzz->JogarComUm(15));
    }

    public function test_pensa_30_fala_FizBuzz()
    {
      $this->assertEquals("FizzBuzz", $this->FizzBuzz->JogarComUm(30));
    }

    public function test_pensa_1_2_3_4_5_30_fala_1_2_Fizz_4_Buzz_FizBuzz()
    {
      $this->assertEquals(array(1, 2, "Fizz", 4, "Buzz", "FizzBuzz"), $this->FizzBuzz->Jogar(array(1,2,3,4,5,30)));
    }
  }
?>