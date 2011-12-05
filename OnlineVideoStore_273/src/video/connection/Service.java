package video.connection;

import java.util.Date;

import javax.jws.WebService;

import video.dto.Account;
import video.dto.Address;
import video.dto.Bill;
import video.dto.Movie;
import video.dto.MovieInfo;
import video.dto.Person;
import video.dto.PersonInfo;
import video.onlineStore.OnlineVideo;
import video.util.Validator;

@WebService
public class Service {
	
 
OnlineVideo omp = new OnlineVideo();


	
	public Movie[] findMovies(int id,String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable) {
		//SearchMovieManager smm = new SearchMovieManager();
		return omp.findMovies(id,name, banner, release, rentalPrice, category, isAvailable);
	}

	
	public Movie[] listMovies() {
		//SearchMovieManager smm = new SearchMovieManager();
		return omp.listMovies();
	}

	
	public String issueMovie(int movieId, int personId) {
		//SearchMovieManager smm = new SearchMovieManager();
		return omp.issueMovie(movieId, personId);
	}

	
	public String submitMovie(int movieId, int personId) {
		//SearchMovieManager smm = new SearchMovieManager();
		return omp.submitMovie(movieId, personId);
	}
	
	public String addMovie(Movie movie) {
		if (omp.insert(movie))
			return "SUCCESS";
		else
			return "ERROR";
	}

	public String updateMovie(Movie movie) {
		if (omp.update(movie))
			return "SUCCESS";
		else
			return "ERROR";
	}

	public String deleteMovie(String movieId) {
		if (omp.delete(Integer.valueOf(movieId)))
			return "SUCCESS";
		else
			return "ERROR";
	}

	public Bill generateBill(int personId, int month, int year) {
		return omp.generateBill(personId, month, year);
	}
	
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
	
	
	
	public Address getAddress(int userId){		
		return omp.getAddress(userId);
	}
	
	
	public String updatePersonAccount(Person person, Account account,Address address ){
 		
		//Server side validation
		//Person
		String username = person.getUsername();
		String pwd = person.getPassword();
		String firstN = person.getFirstName();
		String lastN = person.getLastName();
 		//Account
 		String ssn  = account.getSsn();
 		int userType = account.getUserType();
 		//Address
 		String street = address.getStreet();
 		String city = address.getCity();
 		String state = address.getState();
 		String country = address.getCountry();
 		String zip = address.getZip();
 		
  
 		
 		String zipResult = Validator.ValidateZip(zip); 	
 		String ssnResult = Validator.SSN(ssn); 
 		
 		
 		if(zipResult.substring(0,5).equals("false")){
 		
 			return zipResult;
 		}
 		
 		if(ssnResult.substring(0,5).equals("false")){ 		
 			return ssnResult;
 		}
 		 		
 		//Person
		if(username==null || username.length()==0){ return "false:User name is requried";}	
		if(pwd==null || pwd.length()==0){ return "false:Password is requried";}
		if(firstN==null || firstN.length()==0){ return "false:First name is requried";}
		if(lastN==null || lastN.length()==0){ return "false:Last name is requried";}
 		//Account		
		if(userType<0 || userType > 3){ return "false:Invalid User Type";}
		if(ssn==null || ssn.length()!=9 ){ return "false:Please enter 9 digits number";}		
		//Address
		if(street==null || street.length()==0){ return "false:Street name is requried";}	
		if(city==null || city.length()==0){ return "false:City is requried";}		
		if(state==null || state.length()!=2){ return "false:State name is requried / State name is mispelled";}
		if(country==null || country.length()==0){ return "false:Last name is requried";}
		
		return omp.updatePersonAccount(person,account,address);
	}
	
	
	
	public boolean isUsernameExisted(String username){
		return omp.isUsernameExisted(username);
	}
	
	
	public String deletePerson(int personId){		
		return omp.deletePerson(personId);		
	}
	
	
	public Person[] find_Persons(int id, String firstName, String lastName, String username, Date registration,Date last_Login){		
		return omp.find_Persons(id,firstName,lastName,username,registration,last_Login);
	}

	
	public PersonInfo displayPerson(int personId) {
		// TODO Auto-generated method stub
		return omp.displayPerson(personId);
	}

	public MovieInfo displayMovie(int movieId) {
		// TODO Auto-generated method stub
		return omp.displayMovie(movieId);
	}

	
	

}
