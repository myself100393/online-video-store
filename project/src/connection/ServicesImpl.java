package team6.connection;

import javax.jws.WebService;

import team6.entity.Bill;
import team6.entity.Movie;

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

}
