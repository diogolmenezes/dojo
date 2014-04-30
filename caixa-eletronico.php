<?php

  # Desenvolva um programa que simule a entrega de notas quando um cliente efetuar um saque em um caixa eletrônico. Os requisitos são os seguintes:
  # • Entregar o menor número de notas;
  # • Verificar se é possível sacar o valor solicitado com as notas disponíveis;
  # • Saldo do cliente infinito;
  # • A quantidade de notas do caixa eletrônico é infinita;
  # • Notas disponíveis de R$ 100,00; R$ 50,00; R$ 20,00 e R$ 10,00;
  #
  # Exemplos:
  # • Valor do Saque: R$ 30,00 – Resultado Esperado: Entregar 1 nota de R$20,00 e 1 nota de R$ 10,00.
  # • Valor do Saque: R$ 80,00 – Resultado Esperado: Entregar 1 nota de R$50,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.
  #
  # Para configurar um builder no Sublime:
  # {
  #    "shell_cmd": "C:\\wamp\\bin\\php\\php5.4.12\\php.exe C:\\wamp\\bin\\php\\php5.4.12\\phpunit.phar --colors $file"
  # }

  class CaixaEletronico
  {
    public function __construct()
    {
       $this->notasDisponiveis = array(100, 50, 20, 10);
    }

    public function Sacar($valor)
    {
      $notas = array();
      $valorPossivel = ($valor % 10 == 0);

      if(!$valorPossivel)
        throw new Exception("Valor inválido.");

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

    /**
    * @expectedException Exception
    * @expectedExceptionMessage Valor inválido.
    */
    public function test_sacar_2_entao_0_notas()
    {
      $this->CaixaEletronico->Sacar(2);
    }

    /**
    * @expectedException Exception
    * @expectedExceptionMessage Valor inválido.
    */
    public function test_sacar_53_entao_0_notas()
    {
      $this->CaixaEletronico->Sacar(53);
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