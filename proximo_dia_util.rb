# Desenvolva uma classe que retorne o proximo dia util
# Problema apareceu na lista de ruby on rails

require 'test/unit'
require 'date'
require 'active_support/core_ext/numeric/time'

def proximo_dia_util(data)
    data += 2.day if data.saturday?
    data += 1.day if data.sunday?
    feriado(data) ? proximo_dia_util(data + 1.day) : data
end

# funcao que simulanda feriado
def feriado(data)
    data == Date.new(2016,8,9) || data == Date.new(2016,8,10)
end

class DataTest < Test::Unit::TestCase
    def test_ao_receber_segunda_retorna_segunda
        data = proximo_dia_util(Date.new(2016,8,8))
        assert data.monday?
    end

    def test_ao_receber_terca_e_quarta_feriado_retorna_quinta
        data = proximo_dia_util(Date.new(2016,8,9))
        assert data.thursday?
    end

    def test_ao_receber_quarta_feriado_retorna_quinta
        data = proximo_dia_util(Date.new(2016,8,10))
        assert data.thursday?
    end

    def test_ao_receber_quinta_retorna_quinta
        data = proximo_dia_util(Date.new(2016,8,11))
        assert data.thursday?
    end

    def test_ao_receber_sexta_retorna_sexta
        data = proximo_dia_util(Date.new(2016,8,12))
        assert data.friday?
    end

    def test_ao_receber_sabado_retorna_segunda
        data = proximo_dia_util(Date.new(2016,8,13))
        assert data.monday?
    end

    def test_ao_receber_domingo_retorna_segunda
        data = proximo_dia_util(Date.new(2016,8,14))
        assert data.monday?
    end
end



