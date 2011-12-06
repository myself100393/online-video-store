package video.onlineStore;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import video.connection.DatabaseConnection;
import video.dao.AccountDao;
import video.dao.AddressDao;
import video.dao.PersonDao;
import video.dto.Account;
import video.dto.Address;
import video.dto.Bill;
import video.dto.Movie;
import video.dto.MovieInfo;
import video.dto.Person;
import video.dto.PersonInfo;
import video.exceptions.NotFoundException;


public class OnlineVideo {
	DatabaseConnection db=new DatabaseConnection();
 	
	// All should be just one transaction but i am just running out of time :-( 
	public String signUp(Person person, int accountType) {
		
		try {		
			
			PersonDao dao = new PersonDao();			
			
			//Check is user name existed
			boolean isUserExist = dao.isUserExist(db.con, person.getUsername());
			if(isUserExist){//user already exist				
				return "false:User name already registered";
			}			
			
			boolean isCreate = dao.create(db.con, person);			
			int personId = person.getId();
			
			
			//Create Account
			AccountDao a_dao = new AccountDao();
			Account account = a_dao.createValueObject();
			account.setPersonId(personId);
			account.setUserType(accountType);			
			a_dao.create(db.con,account );
 
			//Create Address
			AddressDao add_dao = new AddressDao();
			Address address = add_dao.createValueObject();
			address.setPersonId(personId);
			address.setStreet("");
			address.setCity("");
			address.setState("");
			address.setCountry("");
			address.setZip("00000");
			
			
			System.out.println("street: "+address.getStreet());
			add_dao.create(db.con,address );
			
			
			return (isCreate)?"true" : "false:No obj return";
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:Exception";
		}
	 
	}
	
	public String logon(String username, String pwd) {
		
		try {
			
			PersonDao dao = new PersonDao();			
			
			//Check is user name existed
			List<Person> result = dao.searchUser(db.con, username);
								
			if(result!=null && result.size()==1){
				
				Person person = result.get(0);
				//check password				
				String pass = person.getPassword();
				
				
				/*
				 * Need to encrypt the password
				 */
				
				if(pwd.equals(pass)){
					//[[update last login time]]					 
					Date date = new Date(new java.util.Date().getTime());
					person.setLast_login(date);
					dao.save(db.con, person);					
					
					return "true";
				}else{
					return "false:Wrong password";
				}				
			}else{
				return "false:User name not found!";
			}
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:exception";
		}
		
	 
	}
		 
	public String logout(int userId) {
		
		return "true: logout sucessful ";
	 
	}
	 
	public void search() {
	 
	}

	public Person getPerson(String username) {
		try {
			
			PersonDao dao = new PersonDao();			
			List<Person> result = dao.searchUser(db.con, username);
								
			if(result!=null && result.size()==1){				
				return result.get(0);			  
			}else{
				return null;
			}		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return null;
		}
	}
	
	public Person getPerson(int userId) {
		PersonDao dao = new PersonDao();	
		try {
			return dao.getObject(db.con, userId);
		} catch (NotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Account getAccount(int userId) {
		try {
			
			AccountDao dao = new AccountDao();			
			List<Account> result = dao.searchByUserId(db.con, userId);
								
			if(result!=null && result.size()==1){				
				return result.get(0);			  
			}else{
				return null;
			}		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return null;
		}
	}
	
	public Address getAddress(int userId) {
		try {
			
			AddressDao dao = new AddressDao();			
			List<Address> result = dao.searchByUserId(db.con, userId);
								
			if(result!=null && result.size()==1){				
				return result.get(0);			  
			}else{
				return null;
			}		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return null;
		}
	}

	public String updatePersonAccount(Person person, Account account, Address address) {
		try {		
			
			PersonDao p_dao = new PersonDao();			
			boolean isPersonUpdated  = p_dao.save(db.con, person);
			

			AccountDao a_dao = new AccountDao();			
		    boolean isAccountUpdated = a_dao.save(db.con, account);
		    
			AddressDao add_dao = new AddressDao();			
		    boolean isAddressUpdated = add_dao.save(db.con, address);

				
			if(isPersonUpdated && isAccountUpdated && isAddressUpdated){
				return "true:User account is updated";				
			}else{						 
				return "false:Cann't update user account!";				
			}		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:Exception";
		}
	}

	public boolean isUsernameExisted(String username) {

		PersonDao dao = new PersonDao();	
		
		try {
			return dao.isUserExist(db.con,username);
		} catch (SQLException e) {		
				e.printStackTrace();
		}
		
		return false;
	}

	public String deletePerson(int personId) {
		PersonDao dao = new PersonDao();	
		
	 
			 try {
				dao.delete(db.con, personId);
			} catch (NotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "false:User not found";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "false:user can't be deleted";
			}
	 
		return "true:User is deleted";
	}

	public List<Person> findPerson(String firstName, String lastName,
			Address address, int type, int issuedMovie) {
			
		PersonDao dao = new PersonDao();
		
		try {
			return dao.searchMatching(db.con, firstName, lastName, address, type, issuedMovie);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return null;
	}

	public String generateStringQuery_Find_Persons(int id,String firstName, String lastName, String userName, Date registration,Date last_Login) {
		boolean isFirstArg = true;
		String query = "SELECT * FROM person ";
		if (((Integer)id)!=null) {
			if (isFirstArg) {
				query += "WHERE id <= " + id + " ";
				isFirstArg = false;
			}
			else
				query += "AND id <= " + id + " ";
		}
		if (firstName != null && firstName.length() > 0) {
			if (isFirstArg) {
				query += "WHERE first_name LIKE '%" + firstName + "%' ";
				isFirstArg = false;
			}
			else
				query += "AND first_name LIKE '%" + firstName + "%' ";
		}
		
		if (lastName != null && lastName.length() > 0) {
			if (isFirstArg) {
				query += "WHERE last_name LIKE '%" + lastName + "%' ";
				isFirstArg = false;
			}
			else
				query += "AND last_name LIKE '%" + lastName + "%' ";
		}
		
		if (userName != null && userName.length() > 0) {
			if (isFirstArg) {
				query += "WHERE username LIKE '%" + userName + "%' ";
				isFirstArg = false;
			}
			else
				query += "AND username LIKE '%" + userName + "%' ";
		}

		if (registration != null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateRegister = dateFormat.format(registration);
			if (isFirstArg) {
				query += "WHERE date_registration = '" + dateRegister + "' ";
				isFirstArg = false;
			}
			else
				query += "AND date_registration = '" + dateRegister + "' ";
		}
				
		if (last_Login != null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String date_Last_Login = dateFormat.format(last_Login);
			if (isFirstArg) {
				query += "WHERE last_login = '" + date_Last_Login + "' ";
				isFirstArg = false;
			}
			else
				query += "AND last_login = '" + date_Last_Login + "' ";
		}
			
		return query;
	}

	//for admin
	public Person[] find_Persons(int id, String firstName, String lastName, String username, Date registration,Date last_Login){
		Statement s;
		ArrayList<Person> arraylistPerson = new ArrayList<Person>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			s = db.con.createStatement();
			String query = generateStringQuery_Find_Persons(id,firstName, lastName, username, registration, last_Login);
			ResultSet r = s.executeQuery(query);
			while (r.next()) {
				Date timeStamp_Reg = r.getDate("date_registration");
				Date timeStamp_Last_Login = r.getDate("last_login");
				Person p = new Person(r.getInt("id"));
				p.setId(r.getInt("id"));
            	p.setFirstName(r.getString("first_name"));
            	p.setLastName(r.getString("last_name"));
            	p.setUsername(r.getString("username"));
            //	p.setRegistration(timeStamp_Reg); 
           // 	p.setLast_login(timeStamp_Last_Login);
            	
            	p.setRegistration(r.getDate("date_registration")); 
               	p.setLast_login(r.getDate("last_login"));
				arraylistPerson.add(p);
									
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Person[] listPerson = new Person[arraylistPerson.size()];
		int i = 0;
		for (Person person : arraylistPerson) 
			listPerson[i++] = person;
		return listPerson;		
	}
	
	public Movie[] listMovies() {
		Statement s;
		ArrayList<Movie> arraylistmovie = new ArrayList<Movie>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			
			
			s = db.con.createStatement();
			String query = "SELECT * FROM movie ORDER BY name ASC";
			ResultSet r = s.executeQuery(query);
			while (r.next()) {
				Movie m = new Movie(r.getString("name"), r.getString("banner"), r.getDate("release_date"), Double.parseDouble(r.getString("rent_amount")), Integer.parseInt(r.getString("nb_available")));
				m.setId(r.getInt("id"));
				arraylistmovie.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Movie[] listMovie = new Movie[arraylistmovie.size()];
		int i = 0;
		for (Movie movie : arraylistmovie) {
			listMovie[i++] = movie;
			System.out.println(movie.toString());
		}
		return listMovie;
	}

	public String generateStringQuery(int id,String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable) {
		boolean isFirstArg = true;
		String query = "SELECT * FROM movie ";
		if (((Integer)id)!=null) {
			if (isFirstArg) {
				query += "WHERE id <= " + id + " ";
				isFirstArg = false;
			}
			else
				query += "AND id <= " + id + " ";
		}		
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
		
		if (release != null && release.getYear() > 0) {
			if (isFirstArg) {
				query += "WHERE release_date = '" + release + "' ";
				isFirstArg = false;
			}
			else
				query += "AND release_date = '" + release + "' ";
		}
		
		if (((Double)rentalPrice) != null) {
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
		System.out.print("generated query for movie searching is.... "+query);
		return query;
	}
	
	public Movie[] findMovies(int id,String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable) {
		Statement s;
		ArrayList<Movie> arraylistmovie = new ArrayList<Movie>();
		System.out.println("1st....");
		try {
			s = db.con.createStatement();
			System.out.println("2nd....");
			String query = generateStringQuery(id,name, banner, release, rentalPrice, category, isAvailable);
			ResultSet r = s.executeQuery(query);
			System.out.println("3rd....");
			while (r.next()) {
				Movie m = new Movie(r.getString("name"), r.getString("banner"), r.getDate("release_date"), Double.parseDouble(r.getString("rent_amount")), Integer.parseInt(r.getString("nb_available")));
				m.setId(r.getInt("id"));
				arraylistmovie.add(m);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Movie[] listMovie = new Movie[arraylistmovie.size()];
		int i = 0;
		for (Movie movie : arraylistmovie) 
			listMovie[i++] = movie;

		for(Movie movie:listMovie){
			System.out.println(listMovie.toString());
            
			System.out.println("");
		}
		
		return listMovie;
	}
	
	// status=rented
	// vifier en fonction du type de compte combien de films ils ont emprunt�
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
			s = db.con.createStatement();
			String query = "SELECT type FROM account WHERE person_id = ?";
			PreparedStatement prepare = db.con.prepareStatement(query);
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
			
			// Compter le nombre de movie rented
			query = "SELECT COUNT(*) FROM rental WHERE person_id = ?";
			prepare = db.con.prepareStatement(query);
			prepare.setInt(1, personId);
			r = prepare.executeQuery();
			int numberMovieRented = 0;
			while (r.next()) 
				numberMovieRented = r.getInt(1);
			if (numberMovieRented < maxMovieRented)
				canRent = true;
			
//			System.out.println("movie rented: " + numberMovieRented);
//			System.out.println("max movie: " + maxMovieRented);
			if (canRent) {
				query = "SELECT nb_available FROM movie WHERE id = ?";
				prepare = db.con.prepareStatement(query);
				prepare.setInt(1, movieId);	
				r = prepare.executeQuery();
				while (r.next()) {
					nbAvailable = r.getInt("nb_available");
				}
				if(nbAvailable > 0) {
					query = "UPDATE movie SET nb_available = ? WHERE id = ? ";
					prepare = db.con.prepareStatement(query);
					prepare.setInt(1, nbAvailable-1);
					prepare.setInt(2, movieId);
					prepare.execute();
					
					java.util.Date date = new java.util.Date();
					query = "INSERT INTO rental(person_id, movie_id, date, status) VALUES(?, ?, ?, ?)";
					prepare = db.con.prepareStatement(query);
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
				result = "You can't rent more movie";
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
			s = db.con.createStatement();
			String query = "UPDATE rental SET status = 'returned' WHERE person_id = ? AND movie_id= ?";
			PreparedStatement prepare = db.con.prepareStatement(query);
			prepare.setInt(1, personId);
			prepare.setInt(2, movieId);
			prepare.execute();
			
			query = "SELECT nb_available FROM movie WHERE id=?";
			prepare = db.con.prepareStatement(query);
			prepare.setInt(1, movieId);	
			ResultSet r = prepare.executeQuery();
			while (r.next()) {
				nbAvailable = r.getInt("nb_available");
			}
			
			query = "UPDATE movie SET nb_available = ? WHERE id = ? ";
			prepare = db.con.prepareStatement(query);
			prepare.setInt(1, nbAvailable+1);
			prepare.setInt(2, movieId);
			prepare.execute();
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "false:Can't find the movie";
		}
		return "true:Movie returned";
	}
	
	// for admin
	public PersonInfo displayPerson(int personId) {
			
			PersonInfo personInfo = new PersonInfo();
			try {
				// Get the person from db
				String sql = "SELECT * FROM person p JOIN account a ON p.id = a.person_id WHERE p.id = ?";
				PreparedStatement prepare = db.con.prepareStatement(sql);
				prepare.setInt(1, personId);
				ResultSet rs = prepare.executeQuery();
				rs.first();
				
				Person person = new Person();
				person.setId(rs.getInt("id"));
				person.setRegistration(rs.getDate("date_registration"));
				person.setFirstName(rs.getString("first_name"));
				person.setLast_login(rs.getDate("last_login"));
				person.setLastName(rs.getString("last_name"));
				person.setPassword(rs.getString("password"));
				person.setUsername(rs.getString("username"));
			//	person.setSsn(rs.getString("ssn"));
				
				personInfo.setPerson(person);
				rs.close();
				prepare.close();
				
				// Get the rented movies for this user
				sql = "SELECT * "
						+ "FROM rental r JOIN movie m ON r.movie_id = m.id "
						+ "WHERE r.person_id = ?";
				
				prepare = db.con.prepareStatement(sql);
		
						
				prepare.setInt(1, personId);
				
				rs = prepare.executeQuery();
				
				ArrayList<Movie> rentedMovies = new ArrayList<Movie>();
				ArrayList<Movie> returnedMovies = new ArrayList<Movie>();
				
				while (rs.next()) {
					Movie movie = new Movie();
					movie.setId(rs.getInt("movie_id"));
					movie.setName(rs.getString("name"));
					movie.setBanner(rs.getString("banner"));
					movie.setReleaseDate( new java.util.Date(rs.getDate("release_date").getTime()));
					movie.setRentAmount(rs.getDouble("rent_amount"));
					movie.setNbAvailable(rs.getInt("nb_available"));
					
					if (rs.getString("status").equalsIgnoreCase("returned")) {
						returnedMovies.add(movie);
					} else if (rs.getString("status").equalsIgnoreCase("rented")) {
						rentedMovies.add(movie);
					}
				}
				Movie[] listRentMovie = new Movie[returnedMovies.size()];
				int i = 0;
				for (Movie movie : returnedMovies) 
					listRentMovie[i++] = movie;
				
				Movie[] listActualRentMovie = new Movie[rentedMovies.size()];
				i = 0;
				for (Movie movie : rentedMovies) 
					listActualRentMovie[i++] = movie;
				
				personInfo.setListActualRentMovie(listActualRentMovie);
				personInfo.setListRentMovie(listRentMovie);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return personInfo;
			
		}
	
	// for admin
	public MovieInfo displayMovie(int movieId) {
		
		MovieInfo movieInfo = new MovieInfo();
		
		Movie movie = null;
		try {
			String sql = "SELECT * FROM movie WHERE id = ?";
			PreparedStatement prepare = db.con.prepareStatement(sql);
			prepare.setInt(1, movieId);
			ResultSet rs = prepare.executeQuery();
			if (rs.first()) {
				movie = new Movie();
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setBanner(rs.getString("banner"));
				movie.setNbAvailable(rs.getInt("nb_available"));
				movie.setRentAmount(rs.getDouble("rent_amount"));
				movie.setReleaseDate(rs.getDate("release_date"));
				
				movieInfo.setMovie(movie);
				
				rs.close();
				prepare.close();
				
				// Get the persons who rented  this movie
				sql = "select * from rental r, person p,  account a "
						+ "where r.person_id=p.id and p.id=a.person_id and r.movie_id=?";
				
				prepare = db.con.prepareStatement(sql);
		
						
				prepare.setInt(1, movieId);
				
				rs = prepare.executeQuery();
				
				ArrayList<Person> rentPersons = new ArrayList<Person>();
				
				while (rs.next()) {
					Person person = new Person();
					person.setId(rs.getInt("id"));
					person.setRegistration(rs.getDate("date_registration"));
					person.setFirstName(rs.getString("first_name"));
					person.setLast_login(rs.getDate("last_login"));
					person.setLastName(rs.getString("last_name"));
					person.setPassword(rs.getString("password"));
					person.setUsername(rs.getString("username"));
				//	person.setSsn(rs.getString("ssn"));
					
					rentPersons.add(person);
									
				}
				Person[] listRentPerson = new Person[rentPersons.size()];
				int i = 0;
				for (Person person : rentPersons) 
					listRentPerson[i++] = person;					
				movieInfo.setListPerson(listRentPerson);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return movieInfo;
	}
	
	// for admin
	public Person[] listAllPersons(int type) {
		ArrayList<Person> persons = new ArrayList<Person>(); 
	
		try {	
			// Get all persons from db
			String sql = "SELECT * FROM person p JOIN account a ON p.id = a.person_id where type=?";
			PreparedStatement prepare = db.con.prepareStatement(sql);
			prepare.setInt(1, type);
			ResultSet rs = prepare.executeQuery();
			
			while (rs.next()) {
				Person person = new Person();
				person.setId(rs.getInt("id"));
				person.setRegistration(rs.getDate("date_registration"));
				person.setFirstName(rs.getString("first_name"));
				person.setLast_login(rs.getDate("last_login"));
				person.setLastName(rs.getString("last_name"));
				person.setPassword(rs.getString("password"));
				person.setUsername(rs.getString("username"));
			//	person.setSsn(rs.getString("ssn"));
				
				persons.add(person);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Person[] arrPersons = new Person[persons.size()];
		arrPersons = persons.toArray(arrPersons);
		return arrPersons;
	}

	// Mickael Integration
	public boolean insert(Movie movie) {
		// Check if there isn't already a movie with the same title in the db
		if (find(movie.getName()) != null) {
			return false;
		}
		
		try {
			String sql = "INSERT INTO movie (name, banner, release_date, rent_amount, nb_available, category_title) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement prepare = db.con.prepareStatement(sql);

			prepare.setString(1, movie.getName());
			prepare.setString(2, movie.getBanner());
			prepare.setDate(3, (java.sql.Date) movie.getReleaseDate());
		
			prepare.setDouble(4, movie.getRentAmount());
			prepare.setInt(5, movie.getNbAvailable());
			prepare.setString(6, "default"); // TODO implement category_id in the model

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
			String sql = "SELECT * FROM movie WHERE name = ?";
			PreparedStatement prepare = db.con.prepareStatement(sql);
			prepare.setString(1, name);
			ResultSet rs = prepare.executeQuery();
			if (rs.first()) {
				movie = new Movie();
				movie.setId(rs.getInt("id"));
				movie.setName(rs.getString("name"));
				movie.setBanner(rs.getString("banner"));
				movie.setNbAvailable(rs.getInt("nb_available"));
				movie.setRentAmount(rs.getDouble("rent_amount"));
				movie.setReleaseDate(rs.getDate("release_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return movie;
	}
	
	public boolean update(Movie movie) {
		try {
			String sql = "UPDATE movie SET name = ?, banner = ?, nb_available = ?, rent_amount = ?, release_date = NOW() WHERE id = ?";
			PreparedStatement prepare = db.con.prepareStatement(sql);
			
			prepare.setString(1, movie.getName());
			prepare.setString(2, movie.getBanner());
			prepare.setInt(3, movie.getNbAvailable());
			prepare.setDouble(4, movie.getRentAmount());
//			prepare.setString(5, new java.sql.Date(movie.getReleaseDate().getTime()));
			prepare.setLong(6, movie.getId());
			
			prepare.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean delete(int movieId) {
		try {
			String sql = "DELETE FROM movie WHERE id = ?";
			PreparedStatement prepare = db.con.prepareStatement(sql);
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
			String sql = "DELETE FROM movie";
			Statement s = db.con.createStatement();
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
		return personInfo.getListActualRentMovie().length;
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
			PreparedStatement prepare = db.con.prepareStatement(sql);
			prepare.setInt(1, personId);
			ResultSet rs = prepare.executeQuery();
			rs.first();
			
			Person person = new Person();
			person.setId(rs.getInt("id"));
			person.setRegistration(rs.getDate("date_registration"));
			person.setFirstName(rs.getString("first_name"));
//			person.setLastLogin(new java.util.Date(rs.getDate("last_login").getTime()));
			person.setLastName(rs.getString("last_name"));
			person.setPassword(rs.getString("password"));
			person.setUsername(rs.getString("username"));
//			person.setSsn(rs.getString("ssn"));
			
			personInfo.setPerson(person);
			rs.close();
			prepare.close();
			
			// Get the rented movies for this month and this user
			sql = "SELECT m.name, m.rent_amount, r.date, r.status "
					+ "FROM rental r JOIN movie m ON r.movie_id = m.id "
					+ "WHERE r.date >= ? AND r.date < ? AND r.person_id = ?";
			
			prepare = db.con.prepareStatement(sql);
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
			
			Movie[] arrayRentedMovies = new Movie[rentedMovies.size()];
			Movie[] arrayReturnedMovies = new Movie[returnedMovies.size()];
			
			int i = 0;
			for (Movie m : rentedMovies) {
				arrayRentedMovies[i] = m;
				i++;
			}
			
			i = 0;
			for (Movie m : returnedMovies) {
				arrayReturnedMovies[i] = m;
				i++;
			}
			
			personInfo.setListActualRentMovie(arrayRentedMovies);
			personInfo.setListRentMovie(arrayReturnedMovies);
			
			
		//	personInfo.setListActualRentMovie(rentedMovies);
		//	personInfo.setListRentMovie(returnedMovies);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return personInfo;
	}
}
 
