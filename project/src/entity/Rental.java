package team6.entity;

import java.util.Date;

public class Rental {
	
	private int id;
	private int idPerson;
	private int idMovies;
	private Date date;
	private String status;
	
	public Rental() {}
	
	public Rental(int idPerson, int idMovies, Date date, String status) {
		this.idPerson = idPerson;
		this.idMovies = idMovies;
		this.date = date;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdPerson() {
		return idPerson;
	}

	public void setIdPerson(int idPerson) {
		this.idPerson = idPerson;
	}

	public int getIdMovies() {
		return idMovies;
	}

	public void setIdMovies(int idMovies) {
		this.idMovies = idMovies;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
