package video.dto;

import java.util.ArrayList;

public class MovieInfo {

	private Movie movie;
	private ArrayList<Person> listPerson;
	
	public MovieInfo() {}
	
	public MovieInfo(Movie movie, ArrayList<Person> listPerson) {
		this.movie = movie;
		this.listPerson = listPerson;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public ArrayList<Person> getListPerson() {
		return listPerson;
	}

	public void setListPerson(ArrayList<Person> listPerson) {
		this.listPerson = listPerson;
	}
}
