package team6.connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import team6.entity.Movie;

public class SearchMovieManager {
	
	public Movie[] listMovies() {
		Statement s;
		ArrayList<Movie> arraylistMovies = new ArrayList<Movie>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			s = DbConnection.getInstance().createStatement();
			String query = "SELECT * FROM movies ORDER BY name ASC";
			ResultSet r = s.executeQuery(query);
			while (r.next()) {
				Long timestamp = r.getDate("release_date").getTime();
				java.util.Date releaseDate = new java.util.Date(timestamp);
				arraylistMovies.add(new Movie(r.getString("name"), r.getString("banner"), releaseDate, Double.parseDouble(r.getString("rent_amount")), Integer.parseInt(r.getString("nb_available"))));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Movie[] listMovie = new Movie[arraylistMovies.size()];
		int i = 0;
		for (Movie movie : arraylistMovies) 
			listMovie[i++] = movie;
		return listMovie;
	}

	public String generateStringQuery(String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable) {
		boolean isFirstArg = true;
		String query = "SELECT * FROM movies ";
		if (name != null && name.length() > 0) {
			if (isFirstArg) {
				query += "WHERE name LIKE '%" + name + "%' ";
				isFirstArg = false;
			}
			else
				query += "AND name LIKE '%" + name + "%' ";
		}
		
		if (banner != null && banner.length() > 0) {
			if (isFirstArg) {
				query += "WHERE banner LIKE '%" + banner + "%' ";
				isFirstArg = false;
			}
			else
				query += "AND banner LIKE '%" + banner + "%' ";
		}
		
		if (release != null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateRelease = dateFormat.format(release);
			if (isFirstArg) {
				query += "WHERE release_date = '" + dateRelease + "' ";
				isFirstArg = false;
			}
			else
				query += "AND release_date = '" + dateRelease + "' ";
		}
		
		if (rentalPrice != null) {
			if (isFirstArg) {
				query += "WHERE rent_amount <= " + rentalPrice + " ";
				isFirstArg = false;
			}
			else
				query += "AND rent_amount <= " + rentalPrice + " ";
		}
		
		
		if (isAvailable) {
			if (isFirstArg) {
				query += "WHERE nb_available > " + 0 + " ";
				isFirstArg = false;
			}
			else
				query += "AND nb_available > " + 0 + " ";
		}
		else {
			if (isFirstArg) {
				query += "WHERE nb_available = " + 0 + " ";
				isFirstArg = false;
			}
			else
				query += "AND nb_available = " + 0 + " ";
		}
		
		return query;
	}
	
	public Movie[] findMovies(String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable) {
		Statement s;
		ArrayList<Movie> arraylistMovies = new ArrayList<Movie>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			s = DbConnection.getInstance().createStatement();
			String query = generateStringQuery(name, banner, release, rentalPrice, category, isAvailable);
			ResultSet r = s.executeQuery(query);
			while (r.next()) {
				Long timestamp = r.getDate("release_date").getTime();
				java.util.Date releaseDate = new java.util.Date(timestamp);
				arraylistMovies.add(new Movie(r.getString("name"), r.getString("banner"), releaseDate, Double.parseDouble(r.getString("rent_amount")), Integer.parseInt(r.getString("nb_available"))));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Movie[] listMovie = new Movie[arraylistMovies.size()];
		int i = 0;
		for (Movie movie : arraylistMovies) 
			listMovie[i++] = movie;
		return listMovie;
	}
	
	// status=rented
	// vérifier en fonction du type de compte combien de films ils ont emprunté
	// premium = 10
	// simple member = 2
	public String issueMovie(int movieId, int personId) {
		Statement s;
		String result = "";
		int nbAvailable = 0;
		int accountType = 0;
		int maxMovieRented = 0;
		boolean canRent = false;
		try {
			// Type of account
			s = DbConnection.getInstance().createStatement();
			String query = "SELECT type FROM accounts WHERE person_id = ?";
			PreparedStatement prepare = DbConnection.getInstance().prepareStatement(query);
			prepare.setInt(1, personId);
			ResultSet r = prepare.executeQuery();
			while (r.next()) {
				accountType = r.getInt("type");
			}
			if (accountType == 2) // premium
				maxMovieRented = 10;
			else if (accountType == 1) // simple 
				maxMovieRented = 2;
			
//			System.out.println("account_type:" + accountType);
			
			// Compter le nombre de movies rented
			query = "SELECT COUNT(*) FROM rentals WHERE id_persons = ?";
			prepare = DbConnection.getInstance().prepareStatement(query);
			prepare.setInt(1, personId);
			r = prepare.executeQuery();
			int numberMovieRented = 0;
			while (r.next()) 
				numberMovieRented = r.getInt(1);
			if (numberMovieRented < maxMovieRented)
				canRent = true;
			
//			System.out.println("movies rented: " + numberMovieRented);
//			System.out.println("max movies: " + maxMovieRented);
			if (canRent) {
				query = "SELECT nb_available FROM movies WHERE id = ?";
				prepare = DbConnection.getInstance().prepareStatement(query);
				prepare.setInt(1, movieId);	
				r = prepare.executeQuery();
				while (r.next()) {
					nbAvailable = r.getInt("nb_available");
				}
				if(nbAvailable > 0) {
					query = "UPDATE movies SET nb_available = ? WHERE id = ? ";
					prepare = DbConnection.getInstance().prepareStatement(query);
					prepare.setInt(1, nbAvailable-1);
					prepare.setInt(2, movieId);
					prepare.execute();
					
					java.util.Date date = new java.util.Date();
					query = "INSERT INTO rentals(id_persons, id_movies, date, status) VALUES(?, ?, ?, ?)";
					prepare = DbConnection.getInstance().prepareStatement(query);
					prepare.setInt(1, personId);
					prepare.setInt(2, movieId);
					prepare.setDate(3, new java.sql.Date(date.getTime()));
					prepare.setString(4, "rented");
					prepare.execute();
					
					result = "Movie rented!";
				}
				else
					result = "This movie is not available!";
			}
			else
				result = "You can't rent more movies";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	
	// status=returned
	public String submitMovie(int movieId, int personId) {
		Statement s;
		String result = "";
		int nbAvailable = 0;
		try {
			s = DbConnection.getInstance().createStatement();
			String query = "UPDATE rentals SET status = 'returned' WHERE id_persons = ? AND id_movies = ?";
			PreparedStatement prepare = DbConnection.getInstance().prepareStatement(query);
			prepare.setInt(1, personId);
			prepare.setInt(2, movieId);
			prepare.execute();
			
			query = "SELECT nb_available FROM movies WHERE id=?";
			prepare = DbConnection.getInstance().prepareStatement(query);
			prepare.setInt(1, movieId);	
			ResultSet r = prepare.executeQuery();
			while (r.next()) {
				nbAvailable = r.getInt("nb_available");
			}
			
			query = "UPDATE movies SET nb_available = ? WHERE id = ? ";
			prepare = DbConnection.getInstance().prepareStatement(query);
			prepare.setInt(1, nbAvailable+1);
			prepare.setInt(2, movieId);
			prepare.execute();
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Movie returned";
	}
}
