using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace FizzBuzz.Teste
{
    [TestClass]
    public class FizzBuzzGameTest
    {
        private FizzBuzz game;

        public FizzBuzzGameTest()
        {
            game = new FizzBuzz();
        }


        [TestMethod]
        public void Joga_3_Fala_Fizz()
        {
            Assert.AreEqual(game.Jogar(3), "Fizz");
        }

        [TestMethod]
        public void Joga_5_Fala_Buzz()
        {
            Assert.AreEqual(game.Jogar(5), "Buzz");
        }

        [TestMethod]
        public void Joga_15_Fala_FizzBuzz()
        {
            Assert.AreEqual(game.Jogar(15), "FizzBuzz");
        }

        [TestMethod]
        public void Joga_30_Fala_FizzBuzz()
        {
            Assert.AreEqual(game.Jogar(30), "FizzBuzz");
        }

        [TestMethod]
        public void Joga_1_Fala_1()
        {
            Assert.AreEqual(game.Jogar(1), "1");
        }

        [TestMethod]
        public void Joga_4_Fala_4()
        {
            Assert.AreEqual(game.Jogar(4), "4");
        }

        [TestMethod]
        public void Joga_5_NaoFala_Fizz()
        {
            Assert.AreNotEqual(game.Jogar(5), "Fizz");
        }

        [TestMethod]
        public void Joga_3_NaoFala_Buzz()
        {
            Assert.AreNotEqual(game.Jogar(3), "Buzz");
        }
    }

    public class FizzBuzz
    {
        private bool Multiplo(int param, int value)
        {
            return value % param == 0;
        }

        public string Jogar(int numero)
        {
            var isFizz = Multiplo(3, numero);
            var isBuzz = Multiplo(5, numero);

            if (isFizz && isBuzz)
                return "FizzBuzz";

            if (isFizz)
                return "Fizz";

            if (isBuzz)
                return "Buzz";

            return numero.ToString();
        }
    }
}
