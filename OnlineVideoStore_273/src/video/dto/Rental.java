package video.dto;

import java.io.*;
import java.sql.*;


 /**
  * This class is  representing rental DB table 
  * This class is intended to be used with RentalDao.
  */
 
public class Rental implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -7986872767655297806L;
	/** 
     * Persistent Instance variables. This data is directly 
     * mapped to the columns of database table.
     */
    private int id;
    private int personId;
    private int movieId;
    private Timestamp date;
    private String status;
 
    public Rental () {

    }
 


    /** 
     * Get- and Set-methods 
     */

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

    public int getMovieId() {
          return this.movieId;
    }
    public void setMovieId(int movieIdIn) {
          this.movieId = movieIdIn;
    }

    public Timestamp getDate() {
          return this.date;
    }
    public void setDate(Timestamp dateIn) {
          this.date = dateIn;
    }

    public String getStatus() {
          return this.status;
    }
    public void setStatus(String statusIn) {
          this.status = statusIn;
    }


    /**
     * toString will return String object representing the state of this 
     * valueObject. This is useful during application development, and 
     * possibly when application is writing object states in textlog.
     */
    public String toString() {
        StringBuffer out = new StringBuffer();
        out.append("\nclass Rental, mapping to table rental\n");
        out.append("Persistent attributes: \n"); 
        out.append("id = " + this.id + "\n"); 
        out.append("personId = " + this.personId + "\n"); 
        out.append("movieId = " + this.movieId + "\n"); 
        out.append("date = " + this.date + "\n"); 
        out.append("status = " + this.status + "\n"); 
        return out.toString();
    }

 

 

}