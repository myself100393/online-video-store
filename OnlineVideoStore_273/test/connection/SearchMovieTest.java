package connection;

import static org.junit.Assert.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.junit.Test;

import com.mysql.jdbc.Statement;

import video.connection.DatabaseConnection;
import video.onlineStore.OnlineVideo;

public class SearchMovieTest {

	@Test
	public void listMovieTest() throws SQLException {
		DatabaseConnection db = new DatabaseConnection();
		String query = "SELECT COUNT(*) FROM movie";
		ResultSet r = db.con.createStatement().executeQuery(query);
		int numberMovie = 0;
		while (r.next()) 
			numberMovie = r.getInt(1);
		
		OnlineVideo omp = new OnlineVideo();
		
		assertEquals(numberMovie, omp.listMovies().length);
	}

	
	@Test
	public void generateStringQueryTest() {
		OnlineVideo omp = new OnlineVideo();
		int id = 0;
		String name = "Pulp Fiction";
		String banner = null;
		Date release = null;
		Double rentalPrice = null;
		int category = 0;
		boolean isAvailable = true;
		String query = omp.generateStringQuery(id, name, banner, release, rentalPrice, category, isAvailable);
		assertTrue(query.equals("SELECT * FROM movie WHERE name LIKE '%Pulp Fiction%' AND nb_available > 0 "));
	}
	
	
	@Test
	public void issueMovieTest() {
		
	}

}
