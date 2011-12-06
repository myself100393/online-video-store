package connection;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.junit.Test;

import video.dto.Movie;
import video.dto.PersonInfo;
import video.onlineStore.OnlineVideo;

public class MovieManagerTest {

	OnlineVideo ov = new OnlineVideo();
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
		assertTrue(ov.insert(m));
	}
	
	@Test
	public void retrieveMovieFromDbByName() {
		String name = "Iron Man";
		Movie movie = ov.find(name);
//		System.out.println(movie.getName() + "\n" + movie.getReleaseDate());
		assertTrue(movie != null);
	}
	
	@Test
	public void updateMovieNameInDb() {
		Movie movie = ov.find("Iron Man");
		if (movie != null) {
			movie.setName("Valkyrie");
			ov.update(movie);
			Movie updated = ov.find("Valkyrie");
			assertTrue(updated.getName().equals(movie.getName()));
		} else {
			fail("Cannot retrieve movie by name...");
		}
	}
	
	@Test
	public void deleteMovieByName() {
		Movie movieToDelete = ov.find("Valkyrie");
		if (movieToDelete != null) {
			ov.delete(movieToDelete.getId());
			assertTrue(ov.find("Valkyrie") == null);
		} else {
			fail("Cannot retrieve movie by name...");
		}
	}

	@Test
	public void tryInsertDuplicateMovieInDb() {
		Movie m = new Movie();
		m = ov.find("Sherlock Holmes 2");
		if (m != null) {
			ov.delete(m.getId());
		}
		m.setName("Sherlock Holmes 2");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date releaseDate = new Date();
		try {
			releaseDate = dateFormat.parse("2008-05-02");
		} catch (ParseException e) {
			e.printStackTrace();
			fail("ParseException!!");
		}
		m.setReleaseDate(releaseDate);
		assertTrue("First insert failed", ov.insert(m));
		assertFalse("Insert duplicate success", ov.insert(m));
	}
	
//	@Test
//	public void getPersonInfo() {
//		PersonInfo personInfo = ov.getPersonInfo(1, 11, 2011);
//		System.out.println(personInfo.getPerson().getFirstName());
//		for (Movie m : personInfo.getListActualRentMovie()) {
//			System.out.println(m.getName());
//		}
//		for (Movie m : personInfo.getListRentMovie()) {
//			System.out.println(m.getName());
//		}
//	}
	
	@Test
	public void insert1000Movies() {
		insertMovies(1);
	}
	
	@Test
	public void insert5000Movies() {
		insertMovies(5);
	}

	@Test
	public void insert10000Movies() {
		insertMovies(10);
	}
	
	private void insertMovies(int nb) {
		int counter = 0;
		Movie m = new Movie();
		long startTime = System.currentTimeMillis();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date releaseDate = new Date();
		try {
			releaseDate = dateFormat.parse("2008-05-02");
		} catch (ParseException e) {
			e.printStackTrace();
			fail("ParseException!!");
		}
		for (int i = 0; i < nb; i++) {
			m.setReleaseDate(releaseDate);
			m.setName(generateRandomName());
			if (ov.insert(m)) {
				counter++;
			}
		}
		long stopTime = System.currentTimeMillis();
		System.out.println(counter + " movies inserted (avg time = " + (stopTime - startTime) / (float) nb  + " msecs)");
		System.out.println("(with " + (nb - counter) + " duplicate entries)\n");
//		ov.clearTable();
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
