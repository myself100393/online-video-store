package team6.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import team6.entity.Bill;
import team6.entity.Movie;
import team6.entity.MovieInfo;
import team6.entity.Person;
import team6.entity.PersonInfo;

public class MovieManager {

	private Connection conn = DbConnection.getInstance();

	public boolean insert(Movie movie) {
		// Check if there isn't already a movie with the same title in the db
		if (find(movie.getName()) != null) {
			return false;
		}
		
		try {
			String sql = "INSERT INTO movies (name, banner, release_date, rent_amount, nb_available, category_id) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement prepare = conn.prepareStatement(sql);

			prepare.setString(1, movie.getName());
			prepare.setString(2, movie.getBanner());
			prepare.setDate(3, new java.sql.Date(movie.getReleaseDate().getTime()));
			prepare.setDouble(4, movie.getRentAmount());
			prepare.setInt(5, movie.getNbAvailable());
			prepare.setInt(6, 1); // TODO implement category_id in the model

			prepare.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Movie find(String name) {
		Movie movie = null;
		try {
			String sql = "SELECT * FROM movies WHERE name = ?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setString(1, name);
			ResultSet rs = prepare.executeQuery();
			if (rs.first()) {
				movie = new Movie();
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setBanner(rs.getString("banner"));
				movie.setNbAvailable(rs.getInt("nb_available"));
				movie.setRentAmount(rs.getDouble("rent_amount"));
				movie.setReleaseDate(new java.util.Date(rs.getDate("release_date").getTime()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return movie;
	}
	
	public boolean update(Movie movie) {
		try {
			String sql = "UPDATE movies SET name = ?, banner = ?, nb_available = ?, rent_amount = ?, release_date = ? WHERE id = ?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			
			prepare.setString(1, movie.getName());
			prepare.setString(2, movie.getBanner());
			prepare.setInt(3, movie.getNbAvailable());
			prepare.setDouble(4, movie.getRentAmount());
			prepare.setDate(5, new java.sql.Date(movie.getReleaseDate().getTime()));
			prepare.setInt(6, movie.getId());
			
			prepare.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean delete(int movieId) {
		try {
			String sql = "DELETE FROM movies WHERE id = ?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setInt(1, movieId);
			prepare.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean clearTable() {
		try {
			String sql = "DELETE FROM movies";
			Statement s = conn.createStatement();
			s.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public Bill generateBill(int personId, int month, int year) {
		Bill bill = new Bill();
		
		PersonInfo personInfo = getPersonInfo(personId, month, year);
		bill.setPersonInfo(personInfo);
		
		bill.setMonth(month);
		bill.setMonthlySubscription(getAmountToPay(personInfo));
		bill.setOutstandingMovie(getOutstandingMovie(personInfo));
		
		return bill;
	}
	
	private int getOutstandingMovie(PersonInfo personInfo) {
		return personInfo.getListActualRentMovie().size();
	}
	
	private double getAmountToPay(PersonInfo personInfo) {
		double toPay = 0.0;
		for (Movie movie : personInfo.getListRentMovie()) {
			toPay += movie.getRentAmount();
		}
		
		return toPay;
	}
	
	private PersonInfo getPersonInfo(int personId, int month, int year) {
		PersonInfo personInfo = new PersonInfo();
		try {
			// Get the person from db
			String sql = "SELECT * FROM persons p JOIN accounts a ON p.id = a.person_id WHERE p.id = ?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setInt(1, personId);
			ResultSet rs = prepare.executeQuery();
			rs.first();
			
			Person person = new Person();
			person.setId(rs.getInt("id"));
			person.setDateRegistration(new java.util.Date(rs.getDate("date_registration").getTime()));
			person.setFirstName(rs.getString("first_name"));
//			person.setLastLogin(new java.util.Date(rs.getDate("last_login").getTime()));
			person.setLastName(rs.getString("last_name"));
			person.setPassword(rs.getString("password"));
			person.setUsername(rs.getString("username"));
			person.setSsn(rs.getString("ssn"));
			
			personInfo.setPerson(person);
			rs.close();
			prepare.close();
			
			// Get the rented movies for this month and this user
			sql = "SELECT m.name, m.rent_amount, r.date, r.status "
					+ "FROM rentals r JOIN movies m ON r.id_movies = m.id "
					+ "WHERE r.date >= ? AND r.date < ? AND r.id_persons = ?";
			
			prepare = conn.prepareStatement(sql);
			prepare.setString(1, year + "-" + month + "-01");
			
			// Correction for the end date
			String endDate;
			if (month == 12) {
				endDate = (year + 1) + "-01-01";
			} else {
				endDate = year + "-" + (month + 1) + "-01";
			}
			
			prepare.setString(2, endDate);
			prepare.setInt(3, personId);
			
			rs = prepare.executeQuery();
			
			ArrayList<Movie> rentedMovies = new ArrayList<Movie>();
			ArrayList<Movie> returnedMovies = new ArrayList<Movie>();
			
			while (rs.next()) {
				Movie movie = new Movie();
				movie.setName(rs.getString("name"));
//				System.out.println("toto" + movie.getName());
				movie.setRentAmount(rs.getDouble("rent_amount"));
				
				
				if (rs.getString("status").equalsIgnoreCase("returned")) {
					returnedMovies.add(movie);
				} else if (rs.getString("status").equalsIgnoreCase("rented")) {
					rentedMovies.add(movie);
				}
			}
			
			personInfo.setListActualRentMovie(rentedMovies);
			personInfo.setListRentMovie(returnedMovies);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return personInfo;
	}
	
	
	public PersonInfo displayPerson(int personId) {
		
		PersonInfo personInfo = new PersonInfo();
		try {
			// Get the person from db
			String sql = "SELECT * FROM persons p JOIN accounts a ON p.id = a.person_id WHERE p.id = ?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setInt(1, personId);
			ResultSet rs = prepare.executeQuery();
			rs.first();
			
			Person person = new Person();
			person.setId(rs.getInt("id"));
			person.setDateRegistration(new java.util.Date(rs.getDate("date_registration").getTime()));
			person.setFirstName(rs.getString("first_name"));
			person.setLastLogin(new java.util.Date(rs.getDate("last_login").getTime()));
			person.setLastName(rs.getString("last_name"));
			person.setPassword(rs.getString("password"));
			person.setUsername(rs.getString("username"));
			person.setSsn(rs.getString("ssn"));
			
			personInfo.setPerson(person);
			rs.close();
			prepare.close();
			
			// Get the rented movies for this user
			sql = "SELECT * "
					+ "FROM rentals r JOIN movies m ON r.id_movies = m.id "
					+ "WHERE r.id_persons = ?";
			
			prepare = conn.prepareStatement(sql);
	
					
			prepare.setInt(1, personId);
			
			rs = prepare.executeQuery();
			
			ArrayList<Movie> rentedMovies = new ArrayList<Movie>();
			ArrayList<Movie> returnedMovies = new ArrayList<Movie>();
			
			while (rs.next()) {
				Movie movie = new Movie();
				movie.setId(rs.getInt("id_movies"));
				movie.setName(rs.getString("name"));
				movie.setBanner(rs.getString("banner"));
				movie.setReleaseDate(new java.util.Date(rs.getDate("release_date").getTime()));
				movie.setRentAmount(rs.getDouble("rent_amount"));
				movie.setNbAvailable(rs.getInt("nb_available"));
				
				if (rs.getString("status").equalsIgnoreCase("returned")) {
					returnedMovies.add(movie);
				} else if (rs.getString("status").equalsIgnoreCase("rented")) {
					rentedMovies.add(movie);
				}
			}
			
			personInfo.setListActualRentMovie(rentedMovies);
			personInfo.setListRentMovie(returnedMovies);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return personInfo;
		
	}
	
	public MovieInfo displayMovie(int movieId) {
		
		MovieInfo movieInfo = new MovieInfo();
		
		Movie movie = null;
		try {
			String sql = "SELECT * FROM movies WHERE id = ?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setInt(1, movieId);
			ResultSet rs = prepare.executeQuery();
			if (rs.first()) {
				movie = new Movie();
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setBanner(rs.getString("banner"));
				movie.setNbAvailable(rs.getInt("nb_available"));
				movie.setRentAmount(rs.getDouble("rent_amount"));
				movie.setReleaseDate(new java.util.Date(rs.getDate("release_date").getTime()));
				
				movieInfo.setMovie(movie);
				
				rs.close();
				prepare.close();
				
				// Get the persons who rented  this movie
				sql = "select * from rentals r, persons p,  accounts a "
						+ "where r.id_persons=p.id and p.id=a.person_id and r.id_movies=?";
				
				prepare = conn.prepareStatement(sql);
		
						
				prepare.setInt(1, movieId);
				
				rs = prepare.executeQuery();
				
				ArrayList<Person> rentPersons = new ArrayList<Person>();
				
				while (rs.next()) {
					Person person = new Person();
					person.setId(rs.getInt("id_persons"));
					person.setDateRegistration(new java.util.Date(rs.getDate("date_registration").getTime()));
					person.setFirstName(rs.getString("first_name"));
					person.setLastLogin(new java.util.Date(rs.getDate("last_login").getTime()));
					person.setLastName(rs.getString("last_name"));
					person.setPassword(rs.getString("password"));
					person.setUsername(rs.getString("username"));
					person.setSsn(rs.getString("ssn"));
					
					rentPersons.add(person);
									
				}
				
				movieInfo.setListPerson(rentPersons);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return movieInfo;
	}
	
	public Person[] listAllPersons(int type) {
		ArrayList<Person> persons = new ArrayList<Person>(); 
	
		try {	
			// Get all persons from db
			String sql = "SELECT * FROM persons p JOIN accounts a ON p.id = a.person_id";
			PreparedStatement prepare = conn.prepareStatement(sql);
			
			ResultSet rs = prepare.executeQuery();
			
			while (rs.next()) {
				Person person = new Person();
				person.setId(rs.getInt("id"));
				person.setDateRegistration(new java.util.Date(rs.getDate("date_registration").getTime()));
				person.setFirstName(rs.getString("first_name"));
				person.setLastLogin(new java.util.Date(rs.getDate("last_login").getTime()));
				person.setLastName(rs.getString("last_name"));
				person.setPassword(rs.getString("password"));
				person.setUsername(rs.getString("username"));
				person.setSsn(rs.getString("ssn"));
				
				persons.add(person);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Person[] arrPersons = new Person[persons.size()];
		arrPersons = persons.toArray(arrPersons);
		return arrPersons;
	}

}
