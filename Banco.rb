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

class Banco

    @@notas_disponiveis = [100, 50, 20, 10]

    def sacar(valor)

        notas = Array.new

        
        for nota_disponivel in @@notas_disponiveis
            while valor > 0
                if valor >= nota_disponivel
                    valor -= empilhar_nota nota_disponivel, notas
                end
            end
        end
        

        return notas
    end

    private
        def empilhar_nota(nota, notas)
            notas.push(nota)
            return nota
        end
end

class BancoTest < Test::Unit::TestCase
    def setup
        @banco = Banco.new
    end

    def test_sacar_0_entao_0_notas
        assert_equal([], @banco.sacar(0))
    end

    def test_sacar_20_entao_retorna_1_nota_20
        assert_equal([20], @banco.sacar(20))
    end

    def test_sacar_10_entao_retorna_1_nota_10
        assert_equal([10], @banco.sacar(10))
    end

    def test_sacar_100_entao_retorna_nota_de_100
        assert_equal([100], @banco.sacar(100))
    end

    def test_sacar_40_entao_retorna_2_nota_de_20
        assert_equal([20,20], @banco.sacar(40))
    end

    def test_sacar_90_entao_retorna_1_nota_50_e_2_nota_de_20
        assert_equal([50,20,20], @banco.sacar(90))
    end

    def test_sacar_200_entao_retorna_2_nota_100
        assert_equal([100,100], @banco.sacar(200))
    end
end