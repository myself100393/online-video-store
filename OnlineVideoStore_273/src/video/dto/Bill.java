package video.dto;

public class Bill {
	private PersonInfo personInfo;
	private int month;
	private double monthlySubscription;
	private int outstandingMovie;
	
	public Bill() {}
	
	public Bill(PersonInfo personInfo, int month, double monthlySubscription, int outstandingMovie) {
		this.personInfo = personInfo;
		this.month = month;
		this.monthlySubscription = monthlySubscription;
		this.outstandingMovie = outstandingMovie;
	}

	public PersonInfo getPersonInfo() {
		return personInfo;
	}

	public void setPersonInfo(PersonInfo personInfo) {
		this.personInfo = personInfo;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public double getMonthlySubscription() {
		return monthlySubscription;
	}

	public void setMonthlySubscription(double monthlySubscription) {
		this.monthlySubscription = monthlySubscription;
	}

	public int getOutstandingMovie() {
		return outstandingMovie;
	}

	public void setOutstandingMovie(int outstandingMovie) {
		this.outstandingMovie = outstandingMovie;
	}
}
