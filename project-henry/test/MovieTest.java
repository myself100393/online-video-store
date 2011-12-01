import static org.junit.Assert.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import org.junit.Test;

import team6.connection.DbConnection;
import team6.connection.SearchMovieManager;
import team6.connection.ServicesImpl;


public class MovieTest {

	@Test
	public void listMovieTest() throws SQLException {
		Statement s = DbConnection.getInstance().createStatement();
		String query = "SELECT COUNT(*) FROM movies";
		ResultSet r = s.executeQuery(query);
		int numberMovie = 0;
		while (r.next()) 
			numberMovie = r.getInt(1);
		
		ServicesImpl serviceImpl = new ServicesImpl();
		
		assertEquals(numberMovie, serviceImpl.listMovies().length);
	}

	
	@Test
	public void generateStringQueryTest() {
		SearchMovieManager smm = new SearchMovieManager();
		String name = "Pulp Fiction";
		String banner = null;
		Date release = null;
		Double rentalPrice = null;
		int category = 0;
		boolean isAvailable = true;
		String query = smm.generateStringQuery(name, banner, release, rentalPrice, category, isAvailable);
		System.out.println(query);
		assertTrue(query.equals("SELECT * FROM movies WHERE name LIKE '%Pulp Fiction%' AND nb_available > 0 "));
	}
}
