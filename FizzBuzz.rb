# Problema :
# Imagine uma brincadeira onde crianças falam um número em ordem (1,2,3…).
# Se o número for múltiplo de 3 então a criança deve dizer Fizz ao invés do número,
# se o número for múltiplo de 5 então a criança deve dizer Buzz,
# por fim se as duas condições forem verdadeiras então a criança precisa dizer FizzBuzz.

require "test/unit"

class FizzBuzz
    def falar(numero)
        if multiplo_de_3(numero) && multiplo_de_5(numero)
            "FizzBuzz"
        elsif multiplo_de_3(numero)
            "Fizz"
        elsif multiplo_de_5(numero)
            "Buzz"
        else
            numero
        end
    end

    def jogar(numeros)
        numeros.map! { |n| self.falar(n) }

        #resultado = []
        #numeros.each do |n|
        #    resultado << self.falar(n)
        #end
        #resultado
    end

    private
        def multiplo_de_5(numero)
            numero % 5 == 0
        end

        def multiplo_de_3(numero)
            numero % 3 == 0
        end
end


class FizzBuzzTest < Test::Unit::TestCase
    def setup
        @fizzBuzz = FizzBuzz.new
    end

    def test_1_fale_1
        assert_equal(1, @fizzBuzz.falar(1))
    end

    def test_2_fale_2
        assert_equal(2, @fizzBuzz.falar(2))
    end

    def test_3_fale_fizz
        assert_equal("Fizz", @fizzBuzz.falar(3))
    end

    def test_6_fale_fizz
        assert_equal("Fizz", @fizzBuzz.falar(6))
    end

    def test_5_fale_buzz
        assert_equal("Buzz", @fizzBuzz.falar(5))
    end

    def test_10_fale_buzz
        assert_equal("Buzz", @fizzBuzz.falar(10))
    end

    def test_15_fale_fizzbuzz
        assert_equal("FizzBuzz", @fizzBuzz.falar(15))
    end

    def test_30_fale_fizzbuzz
        assert_equal("FizzBuzz", @fizzBuzz.falar(30))
    end

    def test_1_2_3_4_5_15_fale_1_2_fizz_4_buzz_fizzbuzz
        assert_equal([1,2,"Fizz",4,"Buzz", "FizzBuzz"], @fizzBuzz.jogar([1,2,3,4,5,15]))
    end
end
