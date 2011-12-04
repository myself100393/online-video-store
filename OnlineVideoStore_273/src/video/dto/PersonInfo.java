package video.dto;

import java.util.ArrayList;

public class PersonInfo {
	
	private Person person;
	private ArrayList<Movie> listActualRentMovie;
	private ArrayList<Movie> listRentMovie;

	public PersonInfo() {}
	
	public PersonInfo(Person person, ArrayList<Movie> listActualRentMovie, ArrayList<Movie> listRentMovie) {
		this.person = person;
		//this.listActualRentMovie = listActualRentMovie;
		//this.listRentMovie = listRentMovie;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public ArrayList<Movie> getListActualRentMovie() {
		return listActualRentMovie;
	}

	public void setListActualRentMovie(ArrayList<Movie> listActualRentMovie) {
		this.listActualRentMovie = listActualRentMovie;
	}

	public ArrayList<Movie> getListRentMovie() {
		return listRentMovie;
	}

	public void setListRentMovie(ArrayList<Movie> listRentMovie) {
		this.listRentMovie = listRentMovie;
	}
	
}
