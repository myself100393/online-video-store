package team6.connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.jws.WebService;

import org.junit.internal.matchers.SubstringMatcher;

import team6.entity.Address;
import team6.entity.Bill;
import team6.entity.Movie;
import team6.entity.MovieInfo;
import team6.entity.Person;
import team6.entity.PersonInfo;

@WebService
public class ServicesImpl implements Services {

	public ServicesImpl() {
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

}
