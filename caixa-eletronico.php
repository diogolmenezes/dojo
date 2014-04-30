<?php

  //
  // Configurar um Builder no Sublime
  // {
  //    "shell_cmd": "C:\\wamp\\bin\\php\\php5.4.12\\php.exe C:\\wamp\\bin\\php\\php5.4.12\\phpunit.phar --colors $file"
  // }
  //

  class CaixaEletronico
  {
    public function __construct()
    {
       $this->notasDisponiveis = array(100, 50, 20, 10);
    }

    public function Sacar($valor)
    {
      $notas = array();

      foreach($this->notasDisponiveis as $nota)
      {
        while($nota <= $valor)
        {
          array_push($notas, $nota);
          $valor -= $nota;
        }
      }

      return $notas;
    }
  }

  class CaixaEletronicoTest extends PHPUnit_Framework_TestCase
  {
    public function setUp()
    {
      $this->CaixaEletronico = new CaixaEletronico();
    }

    public function test_instancia_de()
    {
      $this->assertInstanceOf("CaixaEletronico", $this->CaixaEletronico);
    }

    public function test_sacar_0_entao_0_notas()
    {
        $this->assertEquals(array(), $this->CaixaEletronico->Sacar(0));
    }

    public function test_sacar_10_entao_retorna_1_nota_10()
    {
        $this->assertEquals(array(10), $this->CaixaEletronico->Sacar(10));
    }

    public function test_sacar_20_entao_retorna_1_nota_20()
    {
        $this->assertEquals(array(20), $this->CaixaEletronico->Sacar(20));
    }

    public function test_sacar_100_entao_retorna_nota_de_100()
    {
        $this->assertEquals(array(100), $this->CaixaEletronico->Sacar(100));
    }

    public function test_sacar_40_entao_retorna_2_notas_20()
    {
        $this->assertEquals(array(20,20), $this->CaixaEletronico->Sacar(40));
    }

    public function test_sacar_60_entao_retorna_1_nota_50_e_uma_10()
    {
        $this->assertEquals(array(50, 10), $this->CaixaEletronico->Sacar(60));
    }

     public function test_sacar_80_entao_retorna_1_nota_50_uma_20_e_uma_10()
    {
        $this->assertEquals(array(50, 20, 10), $this->CaixaEletronico->Sacar(80));
    }
  }
?>