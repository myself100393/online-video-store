package video.dto;

public class Movie {

	private long id;
	private String name;
	private String banner;
	private String releaseDate;
	private double rentAmount;
	private int nbAvailable;
	
	public Movie() {}
	
	public Movie(String name, String banner, String releaseDate, double rentAmount, int nbAvailable) {
		this.name = name;
		this.banner = banner;
		this.releaseDate = releaseDate;
		this.rentAmount = rentAmount;
		this.nbAvailable = nbAvailable;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
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

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
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

	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", banner=" + banner
				+ ", releaseDate=" + releaseDate + ", rentAmount=" + rentAmount
				+ ", nbAvailable=" + nbAvailable + "]";
	}
	
}
