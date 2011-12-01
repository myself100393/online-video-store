package team6.connection;

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

	
}
