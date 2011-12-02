package team6.connection;

import java.util.Date;

import javax.jws.WebService;

import team6.entity.Address;
import team6.entity.Bill;
import team6.entity.Movie;
import team6.entity.MovieInfo;
import team6.entity.Person;
import team6.entity.PersonInfo;

@WebService
public class ServicesImpl implements Services {
	
	private MovieManager movieManager = new MovieManager();

	@Override
	public String addMovie(Movie movie) {
		if (movieManager.insert(movie))
			return "SUCCESS";
		else
			return "ERROR";
	}

	@Override
	public String updateMovie(Movie movie) {
		if (movieManager.update(movie))
			return "SUCCESS";
		else
			return "ERROR";
	}

	@Override
	public String deleteMovie(String movieId) {
		if (movieManager.delete(Integer.valueOf(movieId)))
			return "SUCCESS";
		else
			return "ERROR";
	}

	@Override
	public Bill generateBill(int personId, int month, int year) {
		return movieManager.generateBill(personId, month, year);
	}
	
	@Override
	public PersonInfo displayPerson(int personId) {
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		return movieManager.displayPerson(personId);
	}
	
	@Override
	public MovieInfo displayMovie(int movieId) {
		
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		return movieManager.displayMovie(movieId);
	}
	
	@Override
	public Person[] listAllPersons(int type) {
		
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		return movieManager.listAllPersons(type);
	}

	@Override
	public Movie[] findMovies(String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable) {
		SearchMovieManager smm = new SearchMovieManager();
		return smm.findMovies(name, banner, release, rentalPrice, category, isAvailable);
	}

	@Override
	public Movie[] listMovies() {
		SearchMovieManager smm = new SearchMovieManager();
		return smm.listMovies();
	}

	@Override
	public String issueMovie(int movieId, int personId) {
		SearchMovieManager smm = new SearchMovieManager();
		return smm.issueMovie(movieId, personId);
	}

	@Override
	public String submitMovie(int movieId, int personId) {
		SearchMovieManager smm = new SearchMovieManager();
		return smm.submitMovie(movieId, personId);
	}

	@Override
	public String logon(String user, String hashPassword) {
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		return movieManager.logon(user, hashPassword);
	}
	
	@Override
	public String signUp(Person person, int accountType, String ssn) {
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		
		return movieManager.signUp(person, accountType, ssn);
	}

	@Override
	public String logOut(int personId) {
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		
		return movieManager.logOut(personId);
	}

	@Override
	public String updatePerson(Person person, int accountType, String ssn) {
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		
		return movieManager.updatePerson(person, accountType, ssn);
	}

	@Override
	public String deletePerson(int personId) {
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		
		return movieManager.deletePerson(personId);
	}

	@Override
	public Person[] findPersons(String firstName, String lastName, Address address, int type, int issuedMovie) {
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		
		return movieManager.findPersons(firstName, lastName, address, type, issuedMovie);
	}


}
