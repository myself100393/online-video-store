package video.dto;


import java.io.*;

 


public class Account implements Serializable {
 
    /**
	 * 
	 */
	private static final long serialVersionUID = 4500980981822261760L;
	private int id;
    private int personId;
    private String ssn;
    private int userType;
    private double balance;
    private double monthlyFee;
    private int outstandingMovies;
 
    public Account () {

    }
 

    public int getId() {
          return this.id;
    }
    public void setId(int idIn) {
          this.id = idIn;
    }

    public int getPersonId() {
          return this.personId;
    }
    public void setPersonId(int personIdIn) {
          this.personId = personIdIn;
    }

    public String getSsn() {
          return this.ssn;
    }
    public void setSsn(String ssnIn) {
          this.ssn = ssnIn;
    }

    public int getUserType() {
          return this.userType;
    }
    public void setUserType(int userTypeIn) {
          this.userType = userTypeIn;
    }

    public double getBalance() {
          return this.balance;
    }
    public void setBalance(double balanceIn) {
          this.balance = balanceIn;
    }

    public double getMonthlyFee() {
          return this.monthlyFee;
    }
    public void setMonthlyFee(double monthlyFeeIn) {
          this.monthlyFee = monthlyFeeIn;
    }

    public int getOutstandingMovies() {
          return this.outstandingMovies;
    }
    public void setOutstandingMovies(int outstandingMoviesIn) {
          this.outstandingMovies = outstandingMoviesIn;
    }

 
 


    /**
     * toString will return String object representing the state of this 
     * valueObject. This is useful during application development, and 
     * possibly when application is writing object states in textlog.
     */
    public String toString() {
        StringBuffer out = new StringBuffer( );
        out.append("\nclass Account, mapping to table account\n");
        out.append("Persistent attributes: \n"); 
        out.append("id = " + this.id + "\n"); 
        out.append("personId = " + this.personId + "\n"); 
        out.append("ssn = " + this.ssn + "\n"); 
        out.append("userType = " + this.userType + "\n"); 
        out.append("balance = " + this.balance + "\n"); 
        out.append("monthlyFee = " + this.monthlyFee + "\n"); 
        out.append("outstandingMovies = " + this.outstandingMovies + "\n"); 
        return out.toString();
    }


   

 

}
