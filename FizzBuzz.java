package code;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author Carlos
 *
 */
public class FizzBuzz {


	/**
	 * @param numero: Numero a ser validado
	 * @return: Retorna true se for multiplo de 3
	 */
	private static boolean isFizz(int numero){

		if ((numero % 3) == 0){
			return true;
		}
		return false;
	}

	/**
	 * @param numero: Numero a ser validado
	 * @return: Retorna true se for multiplo de 5
	 */
	private static boolean isBuzz(int numero){

		if ((numero % 5) == 0){
			return true;
		}
		return false;
	}


	/**
	 * @param numero: Numero a ser jogado
	 * @return: Retorna a resposta para o numero informado
	 */
	private static String toPlay(int numero){

		String retorno = "";

		if (isFizz(numero)) retorno += "Fizz";
		if (isBuzz(numero)) retorno += "Buzz";
		if (retorno.equals("")) retorno += numero;

		return retorno;
	}

	/**
	 * @param args
	 * @throws IOException
	 * @throws NumberFormatException
	 */
	public static void main(String[] args) throws NumberFormatException, IOException {

		 BufferedReader bufferRead = new BufferedReader(new InputStreamReader(System.in));

		 System.out.print("Numero:");

		 int num = Integer.parseInt(bufferRead.readLine());
		 System.out.println(toPlay(num));

	}

}
