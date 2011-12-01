package team6.connection;

import java.util.Date;

import team6.entity.Address;
import team6.entity.Bill;
import team6.entity.Movie;
import team6.entity.MovieInfo;
import team6.entity.Person;
import team6.entity.PersonInfo;

/**
 * Web Services available for the class project
 * CMPE 273 - Section 3 (TuTh) - Fall 2011
 * 
 * Henry Chea
 * Wai Leung Jason Yu
 * Jing Zhang
 * Fan Ieong
 * Mickael Pham
 * 
 * @author Team #6
 */
public interface Services {

	/*
	 * Customer functions
	 */

//	/**
//	 * Allow the user to log and set his/her session
//	 * 
//	 * @param user
//	 *            email or username to identify
//	 * @param hashPassword
//	 *            SHA-1 encrypted password
//	 * @return information on the result of the logon
//	 */
//	public String logon(String user, String hashPassword);
//
//	/**
//	 * Allow an user to register in the system
//	 * 
//	 * @param person
//	 *            information submitted by form
//	 * @param accountType
//	 *            (1 = simple member; 2 = premium member)
//	 * @return result of the operation
//	 */
//	public String signUp(Person person, int accountType);
//
//	/**
//	 * Destroy the session of an user and do server-side operation on logout
//	 * 
//	 * @param personId
//	 *            in the database
//	 * @return result of the operation
//	 */
//	public String logOut(int personId);
//
//	/**
//	 * Update informations about an user in the database
//	 * 
//	 * @param person
//	 *            information updated by form
//	 * @param accountType
//	 *            (1 = simple member; 2 = premium member)
//	 * @return result of the update
//	 */
//	public String updatePerson(Person person, int accountType);
//
//	/**
//	 * Delete a person from the database (should be the user's account or an
//	 * admin doing this)
//	 * 
//	 * @param personId
//	 *            in the Database
//	 * @return result of the delete operation
//	 */
//	public String deletePerson(int personId);

	/**
	 * Do a research in the database with the criteria submitted
	 * 
	 * @param name
	 * @param banner
	 * @param release
	 * @param rentalPrice
	 * @param category
	 * @param isAvailable
	 * @return all the movies that match the search
	 */
	public Movie[] findMovies(String name, String banner, Date release,
			Double rentalPrice, int category, boolean isAvailable);

	/**
	 * Get all movies from the database
	 * 
	 * @return tab of movies
	 */
	public Movie[] listMovies();

	/**
	 * Rent a movie under an user ID
	 * 
	 * @param movieId
	 *            movie to rent
	 * @param personId
	 *            renter
	 * @return result of the operation (ok, denied, etc.)
	 */
	public String issueMovie(int movieId, int personId);

	/**
	 * Return a movie rented by an user
	 * 
	 * @param movieId
	 *            returning movie
	 * @param personId
	 *            renter
	 * @return result of the operation
	 */
	public String submitMovie(int movieId, int personId);

//	/**
//	 * Collect and prepare an PersonInfo object (view) from the database
//	 * 
//	 * @param personId
//	 *            user to display
//	 * @return PersonInfo, with user info and the movie he rented
//	 */
//	public PersonInfo displayPerson(int personId);
//
//	/**
//	 * Collect and prepare an MovieInfo object (view) from the database
//	 * 
//	 * @param movieId
//	 *            movie to display
//	 * @return MovieInfo, with all the renters of this movie
//	 */
//	public MovieInfo displayMovie(int movieId);
//
//	/*
//	 * Admin functions
//	 */
//
//	/**
//	 * Get a list of all users
//	 * 
//	 * @param type
//	 *            0 = all; 1 = simple members; 2 = premium members
//	 * @return tab of users
//	 */
//	public Person[] listAllPersons(int type);
//
//	/**
//	 * Add a movie in the database
//	 * 
//	 * @param movie
//	 * @return result of the operation
//	 */
//	public String addMovie(Movie movie);
//
//	/**
//	 * Update a movie in the database
//	 * 
//	 * @param movie
//	 * @return result of the operation
//	 */
//	public String updateMovie(Movie movie);
//
//	/**
//	 * Delete a movie from the database
//	 * 
//	 * @param movieId
//	 *            movie to delete
//	 * @return result of the operation
//	 */
//	public String deleteMovie(String movieId);
//
//	/**
//	 * Do a research in the database to find persons
//	 * 
//	 * @param firstName
//	 * @param lastName
//	 * @param address
//	 * @param type
//	 * @param issuedMovie
//	 * @return result of the search
//	 */
//	public Person[] findPersons(String firstName, String lastName,
//			Address address, int type, int issuedMovie);
//
//	/**
//	 * For this user and this month, generate the bill
//	 * 
//	 * @param personId
//	 * @param month
//	 * @return Bill, with all informations (movie, price) for this month
//	 */
//	public Bill generateBill(int personId, int month);
}
