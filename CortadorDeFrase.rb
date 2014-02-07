# Problema:
# Escreva um programa em que dado uma frase e a quantidade de colunas que podem ser exibidas na tela, faça a quebra de linhas sem quebrar as palavras.
# Por exemplo, se passarmos a frase "Um pequeno jabuti xereta viu dez cegonhas felizes." e pedirmos para ela ser exibida em 20 colunas, teremos como
# resposta:

require "test/unit"

class CortadorDeFrase
    def cortar(frase, tamanho)
        frase_cortada  = ""

        frase.split(" ").each do |palavra|
            if frase_cortada.length + palavra.length < tamanho
                frase_cortada += palavra.length == 0 ? palavra : " " + palavra
            end
        end

        frase_cortada
    end
end

class CortadorDeFraseTest < Test::Unit::TestCase
    def setup
        @cortador = CortadorDeFrase.new
    end

    def test_teste_3_entao_escreve_teste
        assert_equal("teste", @cortador.cortar("teste", 1))
    end

    def test_um_teste_feito_5_entao_escreve_um
        assert_equal("um", @cortador.cortar("um teste feito", 5))
    end

    def test_um_teste_feito_11_entao_escreve_um_teste
        assert_equal("um teste", @cortador.cortar("um teste feito", 11))
    end
end


