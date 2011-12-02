package team6;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import team6.connection.DbConnection;
import team6.connection.SearchMovieManager;
import team6.connection.ServicesImpl;
import team6.entity.Movie;

public class MainTest {

	/**
	 * @param args
	 * @throws SQLException
	 */
	public static void main(String[] args)  {
//		SearchMovieManager smm = new SearchMovieManager();
//		System.out.println(smm.generateStringQuery("", "", null, 1.1, 0, true));
		
		ServicesImpl si = new ServicesImpl();
//		Movie[] listMovie = new Movie[4];
//		for (int i = 0; i < listMovie.length; i++) {
//			listMovie[i] = si.findMovies("Pu", "", null, 20.0, 0, true)[i];
//			System.out.println(listMovie[i].getName());
//		}
		
		System.out.println(si.submitMovie(12, 1));
	}
}
