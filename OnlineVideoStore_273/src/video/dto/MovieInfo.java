package video.dto;

import java.util.ArrayList;
import java.util.Arrays;

public class MovieInfo {

	private Movie movie;
	private Person[] listPerson;
	
	public MovieInfo() {}
	
	public MovieInfo(Movie movie, Person[] listPerson) {
		this.movie = movie;
		//this.listPerson = listPerson;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Person[] getListPerson() {
		return listPerson;
	}

	public void setListPerson(Person[] listPerson) {
		this.listPerson = listPerson;
	}

	@Override
	public String toString() {
		return "MovieInfo [movie=" + movie + ", listPerson="
				+ Arrays.toString(listPerson) + "]";
	}
	
}
