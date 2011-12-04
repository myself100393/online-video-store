package video.dto;

import java.util.ArrayList;

public class PersonInfo {
	
	private Person person;
	private Movie[] listActualRentMovie;
	private Movie[] listRentMovie;

	public PersonInfo() {}
	
	public PersonInfo(Person person, Movie[] listActualRentMovie, Movie[] listRentMovie) {
		this.person = person;
		this.listActualRentMovie = listActualRentMovie;
		this.listRentMovie = listRentMovie;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Movie[] getListActualRentMovie() {
		return listActualRentMovie;
	}

	public void setListActualRentMovie(Movie[] listActualRentMovie) {
		this.listActualRentMovie = listActualRentMovie;
	}

	public Movie[] getListRentMovie() {
		return listRentMovie;
	}

	public void setListRentMovie(Movie[] listRentMovie) {
		this.listRentMovie = listRentMovie;
	}
	
}
