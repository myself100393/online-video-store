package video.dto;

import java.io.*;
import java.util.Date;
import java.sql.Timestamp;
 


public class Person implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -3237188902071565826L;
	
	/** 
     * This data is directly mapped to the columns of database table.
     */
    private int id;
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private Date registration;
    private Date last_login;

    public Person () {}

    public Person (int id) {
          this.id = id;
    }


    /** Get- and Set-methods  **/

    public int getId() {
          return this.id;
    }
    public void setId(int idIn) {
          this.id = idIn;
    }

    public String getFirstName() {
          return this.firstName;
    }
    public void setFirstName(String firstNameIn) {
          this.firstName = firstNameIn;
    }

    public String getLastName() {
          return this.lastName;
    }
    public void setLastName(String lastNameIn) {
          this.lastName = lastNameIn;
    }

    public String getUsername() {
          return this.username;
    }
    public void setUsername(String usernameIn) {
          this.username = usernameIn;
    }

    public String getPassword() {
          return this.password;
    }
    public void setPassword(String passwordIn) {
          this.password = passwordIn;
    }

    public Date getRegistration() {
          return this.registration;
    }
    public void setRegistration(Date registrationIn) {
          this.registration = registrationIn;
    }

    public Date getLast_login() {
          return this.last_login;
    }
    public void setLast_login(java.util.Date date) {
          this.last_login = (Date) date;
    }

    /**
     * toString will return String object representing the state of this 
     * valueObject. This is useful during application development, and 
     * possibly when application is writing object states in textlog.
     */
    public boolean compareTo(String fname,String lname, String uname,String pwd) {
    	fname = fname.trim();
    	lname = lname.trim();
    	uname = uname.trim();
    	pwd = pwd.trim();
 
        if (this.firstName == null) {
                  if (fname != null)
                         return(false);
        } else if (!this.firstName.equals(fname)) {
                  return(false);
        }
        
        if (this.lastName == null) {
                  if (lname != null)
                         return(false);
        } else if (!this.lastName.equals(lname)) {
                  return(false);
        }
        
        if (this.username == null) {
                  if (uname != null)
                         return(false);
        } else if (!this.username.equals(uname)) {
                  return(false);
        }
        
        if (this.password == null) {
                  if (pwd != null)
                         return(false);
        } else if (!this.password.equals(pwd)) {
                  return(false);
        }
        
 

        return true;
  }


    /** 
     * setAll allows to set all variables in one method call. 
     */

    public void setAll(int id,
    					String firstName,
    					String lastName,
    					String username,
    					String password,
    					Date last_login) {
          this.id = id;
          this.firstName = firstName;
          this.lastName = lastName;
          this.username = username;
          this.password = password;        
          this.last_login = last_login;
    }




    /**
     * toString will return String object representing the state of this 
     * valueObject. This is useful during application development, and 
     * possibly when application is writing object states in textlog.
     */
    public String toString() {
        StringBuffer out = new StringBuffer( );
        out.append("\nclass Person, mapping to table Person\n");
        out.append("Persistent attributes: \n"); 
        out.append("id = " + this.id + "\n"); 
        out.append("firstName = " + this.firstName + "\n"); 
        out.append("lastName = " + this.lastName + "\n"); 
        out.append("username = " + this.username + "\n"); 
        out.append("password = " + this.password + "\n"); 
        out.append("registration = " + this.registration + "\n"); 
        out.append("last_login = " + this.last_login + "\n"); 
        return out.toString();
    }





 

}


             


 
