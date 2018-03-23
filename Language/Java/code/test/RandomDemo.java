import java.util.Random;
public class RandomDemo{
	public static void main(String[] args){
		Random random = new Random();
		int ran = random.nextInt(100);
		System.out.println(ran);
	}	
}
