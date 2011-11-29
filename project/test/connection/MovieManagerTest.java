package team6.connection;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.junit.Test;

import team6.entity.Movie;

public class MovieManagerTest {

	private MovieManager mm = new MovieManager();
	
	@Test
	public void insertMovieInDb() {
		Movie m = new Movie();
		
		m.setName("Iron Man");
		m.setBanner("Paramount Pictures");
		m.setNbAvailable(5);
		m.setRentAmount(2.99);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date releaseDate = new Date();
		try {
			releaseDate = dateFormat.parse("2008-05-02");
		} catch (ParseException e) {
			e.printStackTrace();
			fail("ParseException!!");
		}
		m.setReleaseDate(releaseDate);
		
		assertTrue(mm.insert(m));
	}
	
	@Test
	public void retrieveMovieFromDbByName() {
		String name = "Iron Man";
		Movie movie = mm.find(name);
//		System.out.println(movie.getName() + "\n" + movie.getReleaseDate());
		assertTrue(movie != null);
	}
	
	@Test
	public void updateMovieNameInDb() {
		Movie movie = mm.find("Iron Man");
		if (movie != null) {
			movie.setName("Valkyrie");
			mm.update(movie);
			Movie updated = mm.find("Valkyrie");
			assertTrue(updated.getName().equals(movie.getName()));
		} else {
			fail("Cannot retrieve movie by name...");
		}
	}
	
	@Test
	public void deleteMovieByName() {
		Movie movieToDelete = mm.find("Valkyrie");
		if (movieToDelete != null) {
			mm.delete(movieToDelete.getId());
			assertTrue(mm.find("Valkyrie") == null);
		} else {
			fail("Cannot retrieve movie by name...");
		}
	}

	@Test
	public void tryInsertDuplicateMovieInDb() {
		Movie m = new Movie();
		m.setName("Sherlock Holmes 2");
		assertTrue("First insert failed", mm.insert(m));
		assertFalse("Inserted duplicate entry", mm.insert(m));
		
		m = mm.find("Sherlock Holmes 2");
		if (m != null) {
			mm.delete(m.getId());
		}
	}
	
//	@Test
//	public void getPersonInfo() {
//		PersonInfo personInfo = mm.getPersonInfo(1, 11, 2011);
//		System.out.println(personInfo.getPerson().getFirstName());
//		for (Movie m : personInfo.getListActualRentMovie()) {
//			System.out.println(m.getName());
//		}
//		for (Movie m : personInfo.getListRentMovie()) {
//			System.out.println(m.getName());
//		}
//	}
	
	@Test
	public void insertMultipleMovies() {
		insertMovies(1000);
		insertMovies(5000);
		insertMovies(10000);
	}
	
	private void insertMovies(int nb) {
		int counter = 0;
		Movie m = new Movie();
		long startTime = System.currentTimeMillis();
		for (int i = 0; i < nb; i++) {
			m.setName(generateRandomName());
			if (mm.insert(m)) {
				counter++;
			}
		}
		long stopTime = System.currentTimeMillis();
		System.out.println(counter + " movies inserted (avg time = " + (stopTime - startTime) / (float) nb  + " msecs)");
		System.out.println("(with " + (nb - counter) + " duplicate entries)\n");
		mm.clearTable();
	}
	
	private String generateRandomName() {
		int nameLength = 20;
		String name = "";
		for (int i = 0; i < nameLength; i++) {
			name += getRandomLetter();
		}
		return name;
	}
	
	private char getRandomLetter() {
		Random r = new Random();
		return (char) ('A' + r.nextInt(26));
	}
}
