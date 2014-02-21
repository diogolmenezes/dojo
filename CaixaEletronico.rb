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
require "test/unit"

class CaixaEletronico

    def initialize
        @notas_disponiveis = [100, 50, 20, 10]
    end

    def sacar(valor)
        notas = Array.new

        if valor > 0
            @notas_disponiveis.each do |nota_disponivel|
                while valor >= nota_disponivel
                    notas.push(nota_disponivel)
                    valor -= nota_disponivel
                end
            end
        end

        notas
    end
end

class BancoTest < Test::Unit::TestCase
    def setup
        @caixa = CaixaEletronico.new
    end

    def test_sacar_0_entao_0_notas
        assert_equal([], @caixa.sacar(0))
    end

    def test_sacar_20_entao_retorna_1_nota_20
        assert_equal([20], @caixa.sacar(20))
    end

    def test_sacar_10_entao_retorna_1_nota_10
        assert_equal([10], @caixa.sacar(10))
    end

    def test_sacar_100_entao_retorna_nota_de_100
        assert_equal([100], @caixa.sacar(100))
    end

    def test_sacar_40_entao_retorna_2_nota_de_20
        assert_equal([20,20], @caixa.sacar(40))
    end


    def test_sacar_60_entao_retorna_nota_de_50_nota_de_10
        assert_equal([50,10], @caixa.sacar(60))
    end

    def test_sacar_90_entao_retorna_1_nota_50_e_2_nota_de_20
        assert_equal([50,20,20], @caixa.sacar(90))
    end

    def test_sacar_200_entao_retorna_2_nota_100
        assert_equal([100,100], @caixa.sacar(200))
    end
end