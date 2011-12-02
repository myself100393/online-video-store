package team6.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import team6.entity.Address;
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
			String sql = "SELECT * FROM persons p JOIN accounts a ON p.id = a.person_id where type=?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setInt(1, type);
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

	public Person[] findPersons(String firstName, String lastName, Address address, int type, int issuedMovie) {
		ArrayList<Person> persons = new ArrayList<Person>(); 
		
		Person[] arrPersons = new Person[persons.size()];
		arrPersons = persons.toArray(arrPersons);
		return arrPersons;
	}

	
	public String logon(String user, String hashPassword) {
		
		String result = null;
		Person person = findPerson(user);
		try {
			if (person != null) {
				String sql = "Select * from persons where username like '?' and password like MD5('?')";
				PreparedStatement prepare = conn.prepareStatement(sql);
				prepare.setString(1, user);
				prepare.setString(2, person.getPassword());
				ResultSet rs = prepare.executeQuery();
			
				if (rs.first()) {
					prepare.close();
					sql = "Update persons set last_login = Now() where id = ?";
					prepare.setInt(1, person.getId());
					
					// update last_login for this person
					prepare.executeUpdate(sql);
					
					result = "Login successful and updated last login time.\n";
					
				} else {
					result = "Username and password do not match.\n";
				}
				
			
			
			} else result = "Username does not exist.\n";
		
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Error logon.\n";
		}
		
		return result;
		
	}
	
	public Person findPerson(String username) {
		Person person = null;
		try {
			String sql = "SELECT * FROM persons WHERE username like '?'";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setString(1, username);
			ResultSet rs = prepare.executeQuery();
			if (rs.first()) {
				person = new Person();
				person.setId(rs.getInt("id"));
				person.setFirstName(rs.getString("first_name"));
				person.setLastName(rs.getString("last_name"));
				person.setUsername(rs.getString("username"));
				person.setPassword(rs.getString("password"));
				person.setDateRegistration(new java.util.Date(rs.getDate("date_registration").getTime()));
				person.setLastLogin(new java.util.Date(rs.getDate("last_login").getTime()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return person;
	}
	
	public String signUp(Person person, int accountType, String ssn) {
		// Check if there isn't already a person with the same username in the db
		
		String result = null;
		
		if (find(person.getUsername()) != null) {
			result = "Username already exists.\n";
		}
		
		try {
			String password = person.getPassword();
			String sql = "INSERT INTO persons (first_name, last_name, date_registration, last_login, username,  password ) VALUES (?, ?, ?, ?, ?, md5(" + password + "))";
			PreparedStatement prepare = conn.prepareStatement(sql);

			prepare.setString(1, person.getFirstName());
			prepare.setString(2, person.getLastName());
			prepare.setDate(3, new java.sql.Date(person.getDateRegistration().getTime()));
			prepare.setDate(4, new java.sql.Date(person.getLastLogin().getTime()));
			prepare.setString(5, person.getUsername());
			//prepare.setString(6, person.getPassword());
		
			prepare.executeUpdate();
			
			prepare.close();
			
			// now create the account for the person
			sql = "INSERT INTO accounts (person_id, ssn, type ) VALUES (?, ?, ?,)";
			prepare = conn.prepareStatement(sql);

			prepare.setInt(1, person.getId());
			prepare.setString(2, ssn);
			prepare.setInt(3, 1);
			prepare.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			result = "Error creating username and account.\n";
		}
		
		
		result = "Username and account created.\n";
		
		return result;
	}
	
	public String logOut(int personId) {
		return "You are now logged out.\n";
	}

	public String updatePerson(Person person, int accountType, String ssn) {
		String result = null;
		
		if (find(person.getUsername()) != null) {
			
		
			try {
				String password = person.getPassword();
				String sql = "update persons set first_name=?, last_name=?, date_registration=?, last_login=?, username=?,  password=md5(password) where id=?";
				PreparedStatement prepare = conn.prepareStatement(sql);
	
				prepare.setString(1, person.getFirstName());
				prepare.setString(2, person.getLastName());
				prepare.setDate(3, new java.sql.Date(person.getDateRegistration().getTime()));
				prepare.setDate(4, new java.sql.Date(person.getLastLogin().getTime()));
				prepare.setString(5, person.getUsername());
				prepare.setInt(6, person.getId());
			
				prepare.executeUpdate();
				
				prepare.close();
				
				// now create the account for the person
				sql = "udpate accounts set ssn=?, type=? where person_id=?";
				prepare = conn.prepareStatement(sql);
	
				
				prepare.setString(1, ssn);
				prepare.setInt(2, accountType);
				prepare.setInt(3, person.getId());
				prepare.executeUpdate();
	
			} catch (SQLException e) {
				e.printStackTrace();
				result = "Error updating username and account.\n";
			}
		
		} else result = "Username does not exist.\n";
		
		result = "Username and account updated.\n";
		
		return result;
	}
	
	public String deletePerson(int personId) {
		//delete person from persons table
		String result = null;
		
		try {
			String sql = "DELETE FROM persons WHERE id = ?";
			PreparedStatement prepare = conn.prepareStatement(sql);
			prepare.setInt(1, personId);
			prepare.executeUpdate();
			
			prepare.close();
			
			sql = "DELETE FROM accounts WHERE person_id = ?";
			prepare = conn.prepareStatement(sql);
			prepare.setInt(1, personId);
			prepare.executeUpdate();
			
			result = "Person and account deleted.\n";
			
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Error deleting this person.\n";
		}
		return result;
		
		//delete account with person_i from db
		
	}

}
