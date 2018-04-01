import java.util.ArrayList;
public class ArrayListDemo{
	public static void main(String[] args){
		ArrayList<String> stringArr = new ArrayList<String>();	

		ArrayList<Integer> integerArr = new ArrayList<Integer>();

		ArrayList<Object> objArr = new ArrayList<Object>();
		
		stringArr.add("abc");	
		stringArr.add("abc");	
		stringArr.add("abc");	

		int size = stringArr.size();
		System.out.println(size);

		String str = stringArr.get(1);
//		System.out.println(str);



		for(int i=0; i<stringArr.size(); i++){
			System.out.println( stringArr.get(i) );	
		}

		System.out.println("=====================================");

		stringArr.add(2,"bbb");
		for(int i=0; i<stringArr.size(); i++){
			System.out.println(stringArr.get(i));	
		}

		System.out.println("=====================================");

		stringArr.set(0,"xxx");
		for(int i=0; i<stringArr.size(); i++){
			System.out.println(stringArr.get(i));	
		}


		System.out.println("=====================================");

		stringArr.remove(3);
		for(int i=0; i<stringArr.size(); i++){
			System.out.println(stringArr.get(i));
		}

		stringArr.clear();
		
	}
}
