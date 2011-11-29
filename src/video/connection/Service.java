package video.connection;

import java.util.LinkedHashMap;
import java.util.Vector;

import javax.jws.WebService;

import video.dto.Account;
import video.dto.Person;
import video.onlineStore.OnlineVideo;


@WebService
public class Service {	
	
	
	OnlineVideo omp = new OnlineVideo();
	
/* 
    public String signUp(Person person, int accountType){
    public String logOut(int personId);
    public String updatePerson(Person person, int accountType);
    public String deletePerson(int personId);
    public Person[] findPersons(String firstName, String lastName, Address address, int type, int issuedMovie);
*/
	
	public String signUp(Person person, int accountType){
		
		//Server side validation 
		String username = person.getUsername();
		String pwd = person.getPassword();
		String firstN = person.getFirstName();
		String lastN = person.getLastName();				
		if(username==null || username.length()==0){ return "false:User name is requried";}	
		if(pwd==null || pwd.length()==0){ return "false:Password is requried";}
		if(firstN==null || firstN.length()==0){ return "false:First name is requried";}
		if(lastN==null || lastN.length()==0){ return "false:Last name is requried";}		
	 		
		return omp.signUp(person,accountType);
	}	
		
	
	public String logon(String username, String pwd){
		
		//Server side validation 
		if(username==null || username.length()==0){ return "false:User name is requried";}	
		if(pwd==null || pwd.length()==0){ return "false:Password is requried";}
		
		return omp.logon(username, pwd); 
	}
	
	
	public String logout(int userId){
		
		//Server side validation 
		if(userId<=0){ return "false:User name is requried";}	
		
		return omp.logout(userId); 
	}
	
	public Person getPerson(String username){		
		return omp.getPerson(username);
	}	
	
	public Account getAccount(int userId){		
		return omp.getAccount(userId);
	}
	
	public String updatePersonAccount(Person person, Account account ){		
		return omp.updatePersonAccount(person,account);
	}
	
	
}
