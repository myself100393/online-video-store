package team6.connection;

import java.util.Date;

import team6.entity.Address;
import team6.entity.Bill;
import team6.entity.Movie;
import team6.entity.MovieInfo;
import team6.entity.Person;
import team6.entity.PersonInfo;

public interface Services {

	/**
	 * Add a movie in the database
	 * 
	 * @param movie
	 * @return result of the operation
	 */
	public String addMovie(Movie movie);

	/**
	 * Update a movie in the database
	 * 
	 * @param movie
	 * @return result of the operation
	 */
	public String updateMovie(Movie movie);

	/**
	 * Delete a movie from the database
	 * 
	 * @param movieId
	 *            movie to delete
	 * @return result of the operation
	 */
	public String deleteMovie(String movieId);
	
	/**
	 * For this user and this month, generate the bill
	 * 
	 * @param personId
	 * @param month
	 * @return Bill, with all informations (movie, price) for this month
	 */
	public Bill generateBill(int personId, int month, int year);
	
	/**
	 * For this personId, generate PersonInfo
	 * 
	 * @param personId
	 * @return PersonInfo, with all information (person, rented movies, actual rented movies) for this personId
	 */
	public PersonInfo displayPerson(int personId);
	
	/**
	 * For this movieId, generate MovieInfo
	 * 
	 * @param movieId
	 * @return MovieInfo, with all information (movie, persons) for this permovieIdsonId
	 */
	public MovieInfo displayMovie(int movieId);
	
	/**
	 * For this type, generate array of persons
	 * 
	 * @param type
	 * @return Person[], with all information (person) for this type
	 */
	public Person[] listAllPersons(int type);

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
	
	/**
	 * Logon a person
	 * 
	 * @param user
	 * @param hashPassword
	 * @return result of the operation
	 */
	public String logon(String user, String hashPassword);   
	
	/**
	 * create a person and account in db
	 * 
	 * @param person
	 * @param accountType
	 * @param ssn
	 * @return result of the operation
	 */
	public String signUp(Person person, int accountType, String ssn);
	
	/**
	 * logout a person
	 * 
	 * @param personId
	 * @return result of the operation
	 */
	public String logOut(int personId);

	/**
	 * update a person and account in db
	 * 
	 * @param person
	 * @param accountType
	 * @param ssn
	 * @return result of the operation
	 */
	public String updatePerson(Person person, int accountType, String ssn);
	
	/**
	 * delete a person and account in db
	 * 
	 * @param personId
	 * @return result of the operation
	 */
	public String deletePerson(int personId);

	/**
	 * find persons based on parameters
	 * 
	 * @param firstName
	 * @param lastName
	 * @param address
	 * @param type
	 * @param issuedMovie
	 * @return result of the operation
	 */
	public Person[] findPersons(String firstName, String lastName, Address address, int type, int issuedMovie);

	
}
