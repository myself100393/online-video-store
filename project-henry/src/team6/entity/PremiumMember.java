package team6.entity;

public class PremiumMember extends Person {

	private double monthlyFee;
	private int outstandingMovies;

	public PremiumMember() {
	}

	public PremiumMember(double monthlyFee, int outstandingMovies) {
		this.monthlyFee = monthlyFee;
		this.outstandingMovies = outstandingMovies;
	}

	public double getMonthlyFee() {
		return monthlyFee;
	}

	public void setMonthlyFee(double monthlyFee) {
		this.monthlyFee = monthlyFee;
	}

	public int getOutstandingMovies() {
		return outstandingMovies;
	}

	public void setOutstandingMovies(int outstandingMovies) {
		this.outstandingMovies = outstandingMovies;
	}

}
