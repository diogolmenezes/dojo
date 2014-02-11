# Desenvolva uma classe que abstraia o funcionamento de uma conta bancária.
# Deve ser possivel:
# - Criar contas com no mínimo 50 reais
# - Depositar dinheiro
# - Sacar dinheiro
# - Transferir dinheiro
# Não deve ser possível:
# - Sacar mais so que se tem
# - Sacar ou depositar valores negativos

require 'test/unit'

class Conta
    @saldo = 0

    def saldo
        @saldo
    end

    def initialize(valor)
        validar_valor_para_criar_conta valor
        @saldo = valor
    end

    def depositar(valor)
        validar_valor_para_deposito valor
        @saldo += valor
    end

    def sacar(valor)
        validar_valor_para_saque valor
        @saldo -= valor
    end

    def transferir(valor, conta)
        self.sacar valor
        conta.depositar valor
    end

    private
        def validar_valor_para_saque(valor)
            if valor < 0
                raise ValorInvalidoError
            end

            if valor > @saldo
                raise ValorNaoDisponivelError
            end
        end

        def validar_valor_para_deposito(valor)
            if valor < 0
                raise ValorInvalidoError
            end
        end

        def validar_valor_para_criar_conta(valor)
            if valor < 50
                raise ValorMinimoError
            end
        end
end


class ContaTest < Test::Unit::TestCase
    def test_deve_criar_conta_com_valor
        assert_raise ArgumentError do
            Conta.new
        end
    end

    def test_ao_criar_conta_com_30_ValorMinimoError
        assert_raise ValorMinimoError do
            Conta.new 30
        end
    end

    def test_ao_criar_conta_com_10_ValorMinimoError
        assert_raise ValorMinimoError do
            Conta.new 10
        end
    end

    def test_deve_criar_conta_com_50
        assert_not_nil Conta.new 50
    end

    def test_deve_mostrar_saldo
        @conta = Conta.new 50
        assert_equal 50, @conta.saldo
    end

    def test_ao_depositar_20_saldo_fica_70
        @conta = Conta.new 50
        @conta.depositar 20

        assert_equal 70, @conta.saldo
    end

    def test_ao_depositar_30_saldo_fica_80
        @conta = Conta.new 50
        @conta.depositar 30

        assert_equal 80, @conta.saldo
    end

    def test_ao_depositar_20_depois_30_saldo_fica_100
        @conta = Conta.new 50
        @conta.depositar 20
        @conta.depositar 30
        assert_equal 100, @conta.saldo
    end

    def test_ao_depositar_negativo_ValorInvalidoError
        @conta = Conta.new 50
        assert_raise ValorInvalidoError do
            @conta.depositar -30
        end
    end

    def test_ao_sacar_10_saldo_fica_40
        @conta = Conta.new 50
        @conta.sacar 10
        assert_equal 40, @conta.saldo
    end

    def test_ao_sacar_30_saldo_fica_20
        @conta = Conta.new 50
        @conta.sacar 30
        assert_equal 20, @conta.saldo
    end

    def test_ao_sacar_negativo_ValorInvalidoError
        @conta = Conta.new 50
        assert_raise ValorInvalidoError do
            @conta.sacar -30
        end
    end

    def test_ao_sacar_60_ValorNaoDisponivelError
        @conta = Conta.new 50
        assert_raise ValorNaoDisponivelError do
            @conta.sacar 60
        end
    end

    def test_ao_sacar_70_ValorNaoDisponivelError
        @conta = Conta.new 50
        assert_raise ValorNaoDisponivelError do
            @conta.sacar 70
        end
    end

    def test_ao_transferir_20_contaA_fica_com_30_e_contaB_com_70
        @contaA = Conta.new 50
        @contaB = Conta.new 50
        @contaA.transferir(20, @contaB)
        assert_equal(30, @contaA.saldo)
        assert_equal(70, @contaB.saldo)
    end

    def test_ao_transferir_70_ValorNaoDisponivelError
        @contaA = Conta.new 50
        @contaB = Conta.new 50
        assert_raise ValorNaoDisponivelError do
            @contaA.transferir(70, @contaB)
        end
    end

    def test_ao_transferir_negativo_ValorInvalidoError
        @contaA = Conta.new 50
        @contaB = Conta.new 50
        assert_raise ValorInvalidoError do
            @contaA.transferir(-70, @contaB)
        end
    end

    def test_ao_depositar_30_sacar_20_depsitar_80_transferir_100_emA_contaA_40_contaB_150
        @contaA = Conta.new 50
        @contaB = Conta.new 50
        @contaA.depositar 30
        @contaA.sacar 20
        @contaA.depositar 80
        @contaA.transferir 100, @contaB

        assert_equal 40, @contaA.saldo
        assert_equal 150, @contaB.saldo
    end
end

class ValorMinimoError < RuntimeError
end

class ValorInvalidoError < RuntimeError
end

class ValorNaoDisponivelError < RuntimeError
end