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
import video.dto.Movie;
import video.dto.Person;
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
					//Date date = new Date(new java.util.Date().getTime());
					person.setLast_login(new java.util.Date().getTime()+"");
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
	
	public Movie[] listMovies() {
		Statement s;
		ArrayList<Movie> arraylistmovie = new ArrayList<Movie>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			
			
			s = db.con.createStatement();
			String query = "SELECT * FROM movie ORDER BY name ASC";
			ResultSet r = s.executeQuery(query);
			while (r.next()) {
				Long timestamp = r.getDate("release_date").getTime();
				java.util.Date releaseDate = new java.util.Date(timestamp);
				arraylistmovie.add(new Movie(r.getString("name"), r.getString("banner"), releaseDate, Double.parseDouble(r.getString("rent_amount")), Integer.parseInt(r.getString("nb_available"))));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Movie[] listMovie = new Movie[arraylistmovie.size()];
		int i = 0;
		for (Movie movie : arraylistmovie) 
			listMovie[i++] = movie;
		return listMovie;
	}

	public String generateStringQuery(String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable) {
		boolean isFirstArg = true;
		String query = "SELECT * FROM movie ";
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
		ArrayList<Movie> arraylistmovie = new ArrayList<Movie>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			s = db.con.createStatement();
			String query = generateStringQuery(name, banner, release, rentalPrice, category, isAvailable);
			ResultSet r = s.executeQuery(query);
			while (r.next()) {
				Long timestamp = r.getDate("release_date").getTime();
				java.util.Date releaseDate = new java.util.Date(timestamp);
				arraylistmovie.add(new Movie(r.getString("name"), r.getString("banner"), releaseDate, Double.parseDouble(r.getString("rent_amount")), Integer.parseInt(r.getString("nb_available"))));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Movie[] listMovie = new Movie[arraylistmovie.size()];
		int i = 0;
		for (Movie movie : arraylistmovie) 
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
			s = db.con.createStatement();
			String query = "SELECT type FROM accounts WHERE person_id = ?";
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
			query = "SELECT COUNT(*) FROM rentals WHERE id_persons = ?";
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
					query = "INSERT INTO rentals(id_persons, id_movie, date, status) VALUES(?, ?, ?, ?)";
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
			String query = "UPDATE rentals SET status = 'returned' WHERE id_persons = ? AND id_movie = ?";
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
	
	 
	
	 
}
 
