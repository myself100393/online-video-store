package team6.entity;

public class SimpleMember extends Person{

	private double outstandingBalance;
	private int outstandingMovies;
	
	public SimpleMember() {}
	
	public SimpleMember(double outstandingBalance, int outstandingMovies) {
		this.outstandingBalance = outstandingBalance;
		this.outstandingMovies = outstandingMovies;
	}

	public double getOutstandingBalance() {
		return outstandingBalance;
	}

	public void setOutstandingBalance(double outstandingBalance) {
		this.outstandingBalance = outstandingBalance;
	}

	public int getOutstandingMovies() {
		return outstandingMovies;
	}

	public void setOutstandingMovies(int outstandingMovies) {
		this.outstandingMovies = outstandingMovies;
	}
	
}
