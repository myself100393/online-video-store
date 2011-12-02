package team6.entity;

import java.util.Date;

public class Movie {

	private int id;
	private String name;
	private String banner;
	private Date releaseDate;
	private double rentAmount;
	private int nbAvailable;
	
	public Movie() {}
	
	public Movie(String name, String banner, Date releaseDate, double rentAmount, int nbAvailable) {
		this.name = name;
		this.banner = banner;
		this.releaseDate = releaseDate;
		this.rentAmount = rentAmount;
		this.nbAvailable = nbAvailable;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public double getRentAmount() {
		return rentAmount;
	}

	public void setRentAmount(double rentAmount) {
		this.rentAmount = rentAmount;
	}

	public int getNbAvailable() {
		return nbAvailable;
	}

	public void setNbAvailable(int nbAvailable) {
		this.nbAvailable = nbAvailable;
	}
}
