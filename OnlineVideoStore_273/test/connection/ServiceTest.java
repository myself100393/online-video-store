package connection;
import static org.junit.Assert.*;

import java.util.Random;

import org.junit.Test;

import video.connection.Service;
import video.dto.Person;


public class ServiceTest {
	
	Random r = new Random();
	Service s = new Service();

	@Test
	public void signUp(){
		
		int testNum = 10; // Change to 1000	
		int currentNoOfPeople = getPersonTableSize();
//		System.out.println("number of people:" + currentNoOfPeople);

		for(int i=0; i<testNum; i++){
			Person p = generatePerson(i);			
			String result = s.signUp(p, 1);			
//			System.out.println("result:"+result+" : "+i);			
		}
		
		int afterInsert = getPersonTableSize();
		
		
		assertTrue(currentNoOfPeople+testNum==afterInsert);
	}
	
	
	

	private int getPersonTableSize() {
		return s.getPersonTableSize();
		
	}

	private Person generatePerson(int id) {

		String token = Long.toString(Math.abs(r.nextLong()), 36);
		
		int size = token.length();
		int half = size/2;
		String lastname = token.substring(0, half);
		String firstname = token.substring(half, size);		
		
		Person person = new Person();	
		person.setUsername("user"+id + token.substring(0, half));
		person.setLastName(lastname);
		person.setFirstName(firstname);		
		person.setPassword(token);
		
		return person;
	}

}
