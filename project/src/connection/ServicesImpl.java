package team6.connection;

import javax.jws.WebService;

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


}
