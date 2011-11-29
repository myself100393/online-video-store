package team6.connection;

import team6.entity.Bill;
import team6.entity.Movie;

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
	
}
