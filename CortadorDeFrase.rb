# Problema:
# Escreva um programa em que dado uma frase e a quantidade de colunas que podem ser exibidas na tela, faça a quebra de linhas sem quebrar as palavras.
# Por exemplo, se passarmos a frase "Um pequeno jabuti xereta viu dez cegonhas felizes." e pedirmos para ela ser exibida em 20 colunas, teremos como
# resposta:
# Um pequeno jabuti
# xereta viu dez
# cegonhas felizes.

require "test/unit"

class CortadorDeFrase
    def cortar(frase, tamanho)
        frase_cortada   = ""
        linha           = ""
        contador        = 1;
        totalDePalavras = frase.split(" ").length

        frase.split(" ").each do |palavra|

            ultimaPalavra       = contador == totalDePalavras
            ultrapassouOTamanho = linha.length + palavra.length + 1 < tamanho

            if ultrapassouOTamanho

                linha += ultimaPalavra ? palavra : palavra + " "

                if ultimaPalavra
                    frase_cortada += linha
                end

            else
                existeLinha = linha != ""

                if existeLinha
                    frase_cortada +=  linha + "\n"
                end

                if ultimaPalavra
                    frase_cortada += palavra
                else
                    linha = palavra + " "
                end
            end

            contador+= 1
        end

        frase_cortada == "" ? frase : frase_cortada
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
        assert_equal("um \nteste \nfeito", @cortador.cortar("um teste feito", 5))
    end

    def test_um_teste_feito_11_entao_escreve_um_teste
         assert_equal("um teste \nfeito", @cortador.cortar("um teste feito", 11))
    end

    def test_corta_em_20
         assert_equal("Um pequeno jabuti \nxereta viu dez \ncegonhas felizes.", @cortador.cortar("Um pequeno jabuti xereta viu dez cegonhas felizes.", 20))
    end

    def test_palavra_grande
         assert_equal("um \ninconstitucionalicimamente \nerrado", @cortador.cortar("um inconstitucionalicimamente errado", 11))
    end
end


